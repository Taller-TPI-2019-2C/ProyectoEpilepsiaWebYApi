﻿using Epilepsia.NET.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Controllers
{
    public class AllowCrossSiteJsonAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (filterContext.RequestContext.HttpContext.Request.HttpMethod == "POST") { 
                filterContext.RequestContext.HttpContext.Response.AddHeader("Access-Control-Allow-Origin", "*");
                base.OnActionExecuting(filterContext);
            }
            else
            {
                filterContext.Result = new EmptyResult();
            }
        }
    }
    public class ApiController : Controller
    {
        [AllowCrossSiteJson]
        public ActionResult Login(string usuario, string contrasenia, string token)
        {
            dynamic ret;
            Usuario u;
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                try { 
                    u = ctx.Usuario.Where(x => x.Email == usuario && x.Contrasenia == contrasenia).FirstOrDefault();
                    if (u == null)
                    {
                        ret = new { msg = "Usuario o contraseña incorrecto" };
                    }
                    else
                    {
                        if (u.Token != token) { 
                            u.Token = token;
                            ctx.SaveChanges();
                        }
                        ret = new { msg = "ok",
                            id = u.Id,
                            nombre = u.Nombre + " " + u.Apellido,
                            pacientes = u.Usuario2.Select(x => new { id = x.Id, nombre = x.Nombre + " " + x.Apellido }).ToArray()
                        };
                    }
                    else
                    {
                        ret = new
                        {
                            msg = "ok",
                            id = u.Id,
                            nombre = u.Nombre + " " + u.Apellido,
                            tutores = u.Usuario1.Select(x => new { id = x.Id, nombre = x.Nombre + " " + x.Apellido }).ToArray()
                        };
                    }
                }
                catch (Exception)
                {
                    ret = new { msg = "Error inesperado" };
                }
            }
            return Json(ret);
        }

        [AllowCrossSiteJson]
        public ActionResult MandarAlerta(long pacienteId, int tipo)
        {
            //TO DO: mandar notificacion a la api
            try { 
                string ruta = Server.MapPath("~");
                Usuario u;
                using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
                {
                    u = ctx.Usuario.Where(x => x.Id == pacienteId).FirstOrDefault();
                    LogManager.Escribir("Recibido señal del paciente " + u.Nombre + " " + u.Apellido + " del tipo "+ tipo, ruta);
                    foreach (Usuario tutor in u.Usuario1)
                    {
                        if (!String.IsNullOrEmpty(tutor.Token)) {
                            string mensaje = "recibido alerta de tipo " + tipo + " del paciente " + u.Nombre + " " + u.Apellido;
                            UsuarioServicio.EnviarNotificacionHaciaCelular(tutor.Token,mensaje);
                            LogManager.Escribir("--> Enviado al tutor " + tutor.Nombre + " " + tutor.Apellido + " (Token: " + tutor.Token + ")",ruta);
                        }
                    }
                }
                return Json(new { msg = "ok" });
            }
            catch (Exception)
            {
                return Json(new { msg = "error" });
            }           
        }

        [AllowCrossSiteJson]
        public ActionResult Registro(string email, string contrasenia, string nombre, string apellido, string token)
        {
            if (String.IsNullOrEmpty(email) ||
                String.IsNullOrEmpty(contrasenia) ||
                String.IsNullOrEmpty(token) ||
                String.IsNullOrEmpty(nombre) ||
                String.IsNullOrEmpty(apellido))
            {
                return Json(new { msg = "Complete todos los campos" });
            }

            if (UsuarioServicio.EmailEnUso(email))
            {
                return Json(new { msg = "El email esta en uso"});
            }

            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                Usuario u = new Usuario();
                u.Nombre = nombre;
                u.Apellido = apellido;
                u.FechaNacimiento = DateTime.Now;
                u.Email = email;
                u.Contrasenia = contrasenia;
                u.Token = token;

                ctx.Usuario.Add(u);
                ctx.SaveChanges();
            }
            return Json(new { msg = "Usuario registrado" });
        }
    }
}