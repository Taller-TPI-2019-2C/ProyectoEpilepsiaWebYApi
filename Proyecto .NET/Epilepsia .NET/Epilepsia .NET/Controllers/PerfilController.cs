using Epilepsia.NET.Models;
using Epilepsia.NET.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Controllers
{
    public class PerfilController : CustomController
    {
        public ActionResult Datos()
        {
            ViewBag.Usuario = Session["Usuario"] as Usuario;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Datos(Usuario usuario)
        {
            Usuario usuarioEnSesion = Session["Usuario"] as Usuario;
            if (!ModelState.IsValid || usuarioEnSesion.Id != usuario.Id)
            {
                return View("Datos");
            }

            Usuario usuarioActualizado = UsuarioServicio.ActualizarDatos(usuario);
            Session["Usuario"] = usuarioActualizado;

            return RedirectToAction("Datos");
        }
        
        //Lista de tutores, Form para agregar uno nuevo también. (Si sos tutor no podes entrar)
        public ActionResult PersonasEnAlerta()
        {
            Usuario usuario = Session["Usuario"] as Usuario;

            if (usuario.Paciente == true)
            {
                return View();
            }

                return RedirectToAction("Solicitudes");
        }

        [HttpPost]
        public ActionResult PersonasEnAlerta(string email)
        {
            ViewBag.ResultadoBusqueda = UsuarioServicio.AgregarPersonaEnAlerta(Session["Usuario"] as Usuario, email);
            return View();
        }

        //Lista de pacientes que te quieren como tutor, aca aceptas o rechazas. (Si sos paciente no podes entrar)
        public ActionResult Solicitudes()
        {
            Usuario usuario = Session["Usuario"] as Usuario;

            if (usuario.Paciente == false)
            {
                return View();
            }

            return RedirectToAction("PersonasEnAlerta");
        }
    }
}