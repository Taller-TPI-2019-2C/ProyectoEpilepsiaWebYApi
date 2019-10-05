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
            return View();
        }

        //Se debería poder acceder solo cuando el user no esta logeado.
        public ActionResult Registro()
        {
            return View();
        }

        /*Se debería poder acceder solo cuando el user no esta logeado (y que justo te registres)
         Si se quiere cambiar y dejarlo sin confirmación (Logeandote apenas terminas el registro), yo 
         no tengo drama. De momento lo hice por las dudas*/
        public ActionResult Confirmacion()
        {
            return View();
        }
    }
}