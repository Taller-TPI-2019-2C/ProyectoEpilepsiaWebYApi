using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Controllers
{
    public class ApiController : Controller
    {
        [HttpPost]
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
                    else if (u.Paciente != false)
                    {
                        if (!ctx.TokenTutor.Any(t => t.TutorID == u.Id && t.API_Token == token))
                        {
                            TokenTutor nuevoToken = new TokenTutor();
                            nuevoToken.TutorID = u.Id;
                            nuevoToken.API_Token = token;
                            ctx.TokenTutor.Add(nuevoToken);
                        }
                        ret = new { msg = "ok",
                            id = u.Id,
                            nombre = u.Nombre + " " + u.Apellido,
                            pacientes = u.Usuario2.Select(x => new { id = u.Id, nombre = u.Nombre + " " + u.Apellido }).ToArray()
                        };
                    }
                    else
                    {
                        ret = new
                        {
                            msg = "ok",
                            id = u.Id,
                            nombre = u.Nombre + " " + u.Apellido,
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

        [HttpPost]
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
                        if (!String.IsNullOrEmpty(tutor.TokenTutor.API_Token)) { 
                            LogManager.Escribir("--> Enviado al tutor " + tutor.Nombre + " " + tutor.Apellido + " (Token: " + tutor.TokenTutor.API_Token + ")",ruta);
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
    }
}