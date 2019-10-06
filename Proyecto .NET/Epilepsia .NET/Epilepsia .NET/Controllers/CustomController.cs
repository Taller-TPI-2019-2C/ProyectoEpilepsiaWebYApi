﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Controllers
{
    public class CustomController : Controller
    {
        /*Este método sirve para detectar donde estas entrando. Esto se ejecuta antes que el ActionResult 
         correspondiente. Es bueno, por ejemplo, para preguntar por la sesión, traer una id, o lo que sea 
         que se use para ver si el user esta logeado o no (SIN TENER QUE REPETIR LO MISMO EN CADA MÉTODO)*/
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string controllerName = this.ControllerContext.RouteData.Values["controller"].ToString();
            Debug.WriteLine("====Estas en el controlador: " + controllerName);

            if (Session["Usuario"] == null)
            {
                string urlIntentada = Request.Url.ToString();
                UrlHelper u = new UrlHelper(this.ControllerContext.RequestContext);
                string urlNueva = u.Action("Login",
                    "Home",
                    new { ReturnUrl = urlIntentada });
                filterContext.Result = Redirect(urlNueva);
            }
        }
    }
}