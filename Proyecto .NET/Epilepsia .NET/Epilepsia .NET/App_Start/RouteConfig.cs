using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Epilepsia.NET
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "EditarDatos",
                url: "Editar/Datos/{id}",
                defaults: new { controller = "Editar", action = "Datos", id = 0 }
            );

            routes.MapRoute(
                name: "EditarPersonaEnAlerta",
                url: "Editar/PersonaEnAlerta/{id}",
                defaults: new { controller = "Editar", action = "PersonaEnAlerta", id = 0 }
            );

            routes.MapRoute(
                name: "Perfil",
                url: "Perfil/{action}",
                defaults: new { controller = "Perfil", action = "Datos" }
            );

            routes.MapRoute(
                name: "Home",
                url: "Home/{action}",
                defaults: new { controller = "Home", action = "Index" }
            );

            //Lo estoy dejando como referencia al original
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
