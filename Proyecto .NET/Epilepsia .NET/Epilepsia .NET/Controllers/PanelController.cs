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
            return View();
        }
        public ActionResult Micuenta()
        {
            return View();
        }
    }
}