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
        //Aca ves tus datos, podes ir a /Editar/Datos/IdPerfilUsuario (Entrada Default si vas a /Perfil/)
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
        
        //Lista de tutores, Form para agregar uno nuevo también. De aca podes ir a '/Editar/PersonaEnAlerta/idPersonaEnAlerta'
        public ActionResult PersonasEnAlerta()
        {
            return View();
        }

        //Lista de pacientes que te quieren como tutor, aca aceptas o rechazas.
        public ActionResult Solicitudes()
        {
            return View();
        }
    }
}