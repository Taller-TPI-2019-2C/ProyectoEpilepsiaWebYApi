using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using ProyectoEpilepsia.Models;
using Microsoft.AspNetCore.Http;

namespace ProyectoEpilepsia.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        
        [HttpPost]
        public IActionResult Index(FrmLogin form)
        {
            TblUser user = ServiceLogin.Login(form);
            if(user != null)
            {
                HttpContext.Session.SetInt32("UserID", user.UserId);
                if (user.Patient)
                {
                    HttpContext.Session.SetString("BirthDate", user.TblPatientData.BirthDate.ToString("dd/MM/yyyy"));
                    return RedirectToAction("Index", "Patient");
                }
                else
                {
                    HttpContext.Session.SetString("BirthDate", user.TblNonPatientData.BirthDate.ToString("dd/MM/yyyy"));
                    return RedirectToAction("Index", "NonPatient");
                }
            }
            else
            {
                ViewBag.Error = Resources.RsError.UserNotFound;
                return View();
            }
        }
    }
}
