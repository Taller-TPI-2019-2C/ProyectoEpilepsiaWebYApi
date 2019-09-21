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
            return View();
        }
        
        /*Aca seleccionas si sos paciente o tutor. Según tu rol, podrías ir a...
         - /Perfil/PersonasEnAlerta => Lista de los tutores que tenes, posibilidad de agregar
         - /Perfil/Solicitudes => Aceptar o rechazar pacientes*/
        public ActionResult Rol()
        {
            return View();
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