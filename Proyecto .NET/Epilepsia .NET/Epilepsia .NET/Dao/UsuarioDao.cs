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
                return ctx.Usuario.FirstOrDefault(x => x.Email == formLogin.Email && x.Contrasenia == formLogin.Contrasenia);   
            }
        }

        public static bool EmailEnUso(string email)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                return ctx.Usuario.FirstOrDefault(x => x.Email == email) != null ? true : false;
            }

        }

        public static Usuario AgregarUsuario(FormRegistro formRegistro)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                try
                {
                    Usuario usuario = new Usuario();
                    usuario.Nombre = formRegistro.Nombre;
                    usuario.Apellido = formRegistro.Apellido;
                    usuario.Email = formRegistro.Email;
                    usuario.Contrasenia = formRegistro.Contrasenia;
                    usuario.Tipo_Usuario = formRegistro.Tipo_Paciente;

                    ctx.Usuario.Add(usuario);
                    ctx.SaveChanges();

                    return usuario;
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine("Excepción: " + e.Message);
                    return null;
                }
            }
        }

        public static string AgregarEarlyAdopter(string email)
        {
            /*Aca se agrega el email a la tabla de emails para early adopters (no creada de momento)
             - Quedaría validar si el email existe en esa tabla también para no agregar lo mismo dos veces*/
            return email;
        }

        public static Usuario ActualizarDatos(FormEditarDatos formEditarDatos)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                Usuario usuario = ctx.Usuario.FirstOrDefault(x => x.Id == formEditarDatos.Id);
                usuario.Nombre = formEditarDatos.Nombre;
                usuario.Apellido = formEditarDatos.Apellido;
                usuario.Tipo_Usuario = formEditarDatos.Tipo_Usuario;

                ctx.SaveChanges();
                return usuario;
            }
        }
    }
}