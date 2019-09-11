using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProyectoEpilepsia.Models;

namespace ProyectoEpilepsia.Controllers
{
    public class NonPatientController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.Guardians = ServiceNonPatient.GetPatients((int)HttpContext.Session.GetInt32("UserID"));
            return View();
        }
    }
}