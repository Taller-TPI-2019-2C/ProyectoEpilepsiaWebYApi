using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProyectoEpilepsia.Models;

namespace ProyectoEpilepsia.Controllers
{
    public class PatientController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.Guardians = ServicePatient.GetGuardians((int)HttpContext.Session.GetInt32("UserID"));
            return View();
        }
    }
}