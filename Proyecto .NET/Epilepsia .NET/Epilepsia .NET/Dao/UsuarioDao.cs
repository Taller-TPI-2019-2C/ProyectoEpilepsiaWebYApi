using Epilepsia.NET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Epilepsia.NET.Dao
{
    public static class UsuarioDao
    {
        //Método de ejemplo, para que queden las carpetas subidas en el repo
        public static int ObtenerCantidadDeUsuariosRegistrados()
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                return ctx.Usuario.Count();
            }
        }

        public static Usuario ObtenerUsuario(FormLogin formLogin)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                try
                {
                    return ctx.Usuario.First(x => x.Email == formLogin.Email && x.Contrasenia == formLogin.Contrasenia);
                }
                catch(Exception e)
                {
                    System.Diagnostics.Debug.WriteLine("Excepción: " + e.Message);
                    return null;
                }                
            }
        }
    }
}