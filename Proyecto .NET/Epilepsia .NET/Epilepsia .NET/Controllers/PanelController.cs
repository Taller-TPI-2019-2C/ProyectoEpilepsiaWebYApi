using Epilepsia.NET.Models;
using Epilepsia.NET.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Controllers
{
    public class PanelController : CustomController
    {
        // GET: Panel
        public ActionResult Personas ()
        {
            ViewBag.Usuario = Session["Usuario"] as Usuario;
            return View();
        }
        public ActionResult Micuenta()
        {
            ViewBag.Usuario = Session["Usuario"] as Usuario;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MiCuenta(Usuario usuario)
        {
            Usuario usuarioEnSesion = Session["Usuario"] as Usuario;
            if (!ModelState.IsValid || usuarioEnSesion.Id != usuario.Id)
            {
                return View("Micuenta");
            }

            Usuario usuarioActualizado = UsuarioServicio.ActualizarDatos(usuario);
            Session["Usuario"] = usuarioActualizado;

            return RedirectToAction("MiCuenta");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Personas(string email)
        {
            Usuario usuario = UsuarioServicio.AgregarTutor(Session["Usuario"] as Usuario, email);
            if (usuario == null)
            {
                ViewBag.ResultadoBusqueda = "No se pudo agregar como tutor a esta persona";
            }
            else
            {
                ViewBag.ResultadoBusqueda = "Esta persona ha sido agregada como tutor";
                Session["Usuario"] = usuario;
                ViewBag.Usuario = usuario;
            }
            return View();
        }

        public ActionResult Medicamentos()
        {
            Usuario usuario = Session["Usuario"] as Usuario;
            if (usuario.Paciente == false) return RedirectToAction("Index", "Home");
            ViewBag.Usuario = usuario;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Medicamentos(FormMedicamento form)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.ErrorFormulario = "Asegurese de completar todos los campos.";
                return View("Medicamentos");
            }

            UsuarioServicio.NuevoMedicamento(form);
            Session["Usuario"] = UsuarioServicio.ObtenerUsuarioActualizado(Session["Usuario"] as Usuario);

            return RedirectToAction("Medicamentos");
        }

        public ActionResult DesactivarRecordatorioMedicamento(int id)
        {
            UsuarioServicio.DesactivarRecordatorioMedicamento(id);
            return RedirectToAction("Medicamentos");
        }

        public ActionResult Historial()
        {
            Usuario usuario = Session["Usuario"] as Usuario;
            if (usuario.Paciente == false)
            {
                return RedirectToAction("Index", "Home");
            }


            ViewBag.Usuario = usuario;
            return View();
        }
    }
}