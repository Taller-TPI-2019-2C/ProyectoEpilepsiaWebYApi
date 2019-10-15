using Epilepsia.NET.Models;
using Epilepsia.NET.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Controllers
{
    public class HomeController : Controller
    {
        //Esto esta solo para dar info para que arranquemos. Después se debe borrar
        public ActionResult Leeme()
        {
            ViewBag.CantidadDeUsuariosRegistrados = UsuarioServicio.ObtenerCantidadDeUsuariosRegistrados();
            return View();
        }
        
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        //Se debería poder acceder solo cuando el user no esta logeado. Debe incluír login con Google
        public ActionResult Login()
        {
            if (Session["UsuarioId"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormLogin formLogin)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            Usuario usuario = UsuarioServicio.ObtenerUsuario(formLogin);
            if(usuario != null)
            {
                Session.Add("Usuario", usuario);

                //Por si se intento ingresar a una url que requería estar logeado, te llevo ahí
                string destino = HttpUtility.ParseQueryString(Request.UrlReferrer.Query)["ReturnUrl"];
                if (destino != null)    return Redirect(destino);

                return RedirectToAction("Index");
            }

            ViewData["MensajeLogin"] = "No se pudo acceder al sistema. Revise sus credenciales.";
            return View();
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }

        //Se debería poder acceder solo cuando el user no esta logeado.
        public ActionResult Registro()
        {
            if (Session["Usuario"] != null)
            {
                return RedirectToAction("Index", "Home");
            }

            return View();
        }

        [HttpPost]
        public ActionResult Registro(FormUsuario formRegistro)
        {
            if (UsuarioServicio.EmailEnUso(formRegistro.Email))
            {
                ModelState.AddModelError("Email", "El correo electrónico se encuentra en uso");
            }

            if (!ModelState.IsValid)
            {
                ViewBag.Form = formRegistro;
                return View("Registro");
            }

            Usuario usuario = UsuarioServicio.AgregarUsuario(formRegistro);

            if (usuario == null)
                return View("Registro", formRegistro);

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult AgregarEarlyAdopter(string email)
        {
            UsuarioServicio.AgregarEarlyAdopter(email);
            return RedirectToAction("Index");
        }
    }
}