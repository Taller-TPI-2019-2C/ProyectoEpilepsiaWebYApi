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
                    .Include(x => x.Medicamento)
                    .Include(x => x.Alerta)
                    .Include(x => x.Alerta1)
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

        public static List<Medicamento> ListarMedicamentosDePaciente(long id)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                try
                {
                    List<Medicamento> lista = ctx.Medicamento.Where(m => m.PacienteId == id).ToList();
                    return lista;
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine("Excepción: " + e.Message);
                    return null;
                }
            }
        }

        public static Usuario LoginPorToken(string token)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                try
                {
                    return ctx.Usuario.Where(u => u.Token == token)
                    .Include(x => x.Usuario1)
                    .Include(x => x.Usuario2)
                    .Include(x => x.Medicamento)
                    .Include(x => x.Alerta)
                    .Include(x => x.Alerta1)
                    .FirstOrDefault();
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine("Excepción: " + e.Message);
                    return null;
                }
            }
        }

        public static Medicamento NuevoMedicamento(FormMedicamento form)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                try
                {
                    Medicamento medicamento = new Medicamento();
                    medicamento.PacienteId = form.pacienteId;
                    medicamento.Nombre = form.nombre;
                    medicamento.PeriodicidadHoras = form.periodicidadHoras;
                    medicamento.Activo = true;
                    medicamento.UltimaVez = DateTime.Now;
                    ctx.Medicamento.Add(medicamento);
                    ctx.SaveChanges();

                    return medicamento;
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine("Excepción: " + e.Message);
                    return null;
                }
            }
        }

        public static void TomarMedicamento(int id)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                try
                {
                    Medicamento medicamento = ctx.Medicamento.Find(id);
                    medicamento.UltimaVez = DateTime.Now;
                    ctx.SaveChanges();
                }
                catch (Exception e)
                {
                    System.Diagnostics.Debug.WriteLine("Excepción: " + e.Message);
                    return;
                }
            }
        }

        public static Medicamento DesactivarRecordatorioMedicamento(int id)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                Medicamento m = ctx.Medicamento.Find(id);
                m.Activo = false;
                ctx.SaveChanges();
                return m;
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

        //Usuario1 en un user de tipo Paciente contiene sus tutores
        public static Usuario AgregarTutor(Usuario usuarioEnSesion, Usuario usuarioBuscado)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                Usuario usuarioActualizado = ctx.Usuario
                    .Include("Usuario1")
                    .Include("Usuario2")
                    .Include("Medicamento")
                    .Include("Alerta")
                    .Include("Alerta1")
                    .FirstOrDefault(x => x.Id == usuarioEnSesion.Id);

                ctx.Usuario.Attach(usuarioBuscado);
                usuarioActualizado.Usuario1.Add(usuarioBuscado);

                ctx.SaveChanges();
                return usuarioActualizado;
            }
        }

        public static Usuario ObtenerUsuarioActualizado(Usuario usuario)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                return ctx.Usuario
                    .Include("Usuario1")
                    .Include("Usuario2")
                    .Include("Medicamento")
                    .Include("Alerta")
                    .Include("Alerta1")
                    .FirstOrDefault(x => x.Id == usuario.Id);//.Find(usuario.Id);
            }
        }

        public static Usuario ObtenerUsuarioPorId(long id)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                return ctx.Usuario
                    .Include("Usuario1")
                    .Include("Usuario2")
                    .Include("Medicamento")
                    .Include("Alerta")
                    .Include("Alerta1")
                    .FirstOrDefault(x => x.Id == id);
            }
        }

        public static Alerta GuardarAlertaManual(Alerta alerta)
        {
            using (Epilepsia_TP_Entities ctx = new Epilepsia_TP_Entities())
            {
                ctx.Alerta.Add(alerta);
                ctx.SaveChanges();
            }
                return alerta;
        }
    }
}