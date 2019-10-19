using Epilepsia.NET.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
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
                Usuario u = ctx.Usuario
                    .Include(x => x.Usuario1)
                    .Include(x => x.Usuario2)
                    .FirstOrDefault(x => x.Email == formLogin.Email && x.Contrasenia == formLogin.Contrasenia);
                return u;
            }
        }

        public static bool EmailEnUso(string email)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                return ctx.Usuario.FirstOrDefault(x => x.Email == email) != null ? true : false;
            }

        }

        public static Usuario AgregarUsuario(FormUsuario formRegistro)
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
                    usuario.Paciente = formRegistro.Paciente;
                    usuario.FechaNacimiento = formRegistro.FechaNacimiento;

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

        public static Usuario ActualizarDatos(Usuario usuarioActualizado)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                Usuario usuarioAntiguo = ctx.Usuario.FirstOrDefault(x => x.Id == usuarioActualizado.Id);
                usuarioAntiguo.Nombre = usuarioActualizado.Apellido;
                usuarioAntiguo.Contrasenia = usuarioActualizado.Contrasenia;

                ctx.SaveChanges();
                return usuarioActualizado;
            }
        }

        public static Usuario ObtenerUsuarioPorEmail(string email)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                return ctx.Usuario.FirstOrDefault(x => x.Email == email);
            }
        }

        //Usuario2 en un user de tipo Paciente contiene sus tutores
        public static Usuario EnviarInvitacionParaTutor(Usuario usuarioEnSesion, Usuario usuarioBuscado)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                Usuario usuarioActualizado = ctx.Usuario.Find(usuarioEnSesion.Id);

                ctx.Usuario.Attach(usuarioBuscado);
                usuarioActualizado.Usuario2.Add(usuarioBuscado);               

                ctx.SaveChanges();
            }
            return usuarioEnSesion;
        }
    }
}