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
            FormEditarDatos formEditarDatos = UsuarioServicio.ObtenerDatosEditables(@Session["Usuario"] as Usuario);
            return View(formEditarDatos);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Datos(FormEditarDatos formEditarDatos)
        {
            Usuario usuarioEnSesion = Session["Usuario"] as Usuario;
            if (!ModelState.IsValid || usuarioEnSesion.Id != formEditarDatos.Id)
            {
                return View("Datos", formEditarDatos);
            }

            Usuario usuarioActualizado = UsuarioServicio.ActualizarDatos(formEditarDatos);
            Session["Usuario"] = usuarioActualizado;

            return RedirectToAction("Datos");
        }
        
        //Lista de tutores, Form para agregar uno nuevo también. (Si sos tutor no podes entrar)
        public ActionResult PersonasEnAlerta()
        {
            Usuario usuario = Session["Usuario"] as Usuario;

            if (usuario.Tipo_Usuario == "Paciente")
            {
                return View();
            }

                return RedirectToAction("Solicitudes");
        }

        //Lista de pacientes que te quieren como tutor, aca aceptas o rechazas. (Si sos paciente no podes entrar)
        public ActionResult Solicitudes()
        {
            Usuario usuario = Session["Usuario"] as Usuario;

            if (usuario.Tipo_Usuario == "Tutor")
            {
                return View();
            }

            return RedirectToAction("PersonasEnAlerta");
        }
    }
}