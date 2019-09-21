using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Controllers
{
    public class EditarController : CustomController
    {
        /*Aca un usuario viene desde /Perfil/Datos si quiere cambiar sus cosas. Después de cancelar o 
        confirmar edición, volvería a /Perfil/Datos. Castear dentro*/
        public ActionResult Datos(string idPerfilUsuario)
        {
            return View();
        }

        /*Aca se viene desde /Perfil/PersonasEnAlerta si se quiere cambiar algo de esta persona 
         (número, nombre, quitarla, etcetera...). Una vez confirmada o cancelada la edición, volverías a 
         /Perfil/PersonasEnAlerta*/
        public ActionResult PersonaEnAlerta(string idPersonaEnAlerta)
        {
            return View();
        }
    }
}