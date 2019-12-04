using Epilepsia.NET.Dao;
using Epilepsia.NET.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace Epilepsia.NET.Servicios
{
    public static class UsuarioServicio
    {
        public static int ObtenerCantidadDeUsuariosRegistrados()
        {
            return UsuarioDao.ObtenerCantidadDeUsuariosRegistrados();
        }

        public static Usuario ObtenerUsuario(FormLogin formLogin)
        {
            return UsuarioDao.ObtenerUsuario(formLogin);
        }

        public static Usuario ObtenerUsuarioActualizado(Usuario usuario)
        {
            return UsuarioDao.ObtenerUsuarioActualizado(usuario);
        }

        public static Usuario ObtenerUsuarioPorId(long id)
        {
            return UsuarioDao.ObtenerUsuarioPorId(id);
        }

        public static Usuario ActualizarDatos(Usuario usuario)
        {
            return UsuarioDao.ActualizarDatos(usuario);
        }

        public static bool EmailEnUso(string email)
        {
            return UsuarioDao.EmailEnUso(email);
        }

        public static Usuario AgregarUsuario(FormUsuario formRegistro)
        {
            return UsuarioDao.AgregarUsuario(formRegistro);
        }

        public static Usuario AgregarTutor(Usuario usuarioEnSesion, string emailBuscado)
        {
            Usuario usuarioBuscado = UsuarioDao.ObtenerUsuarioPorEmail(emailBuscado);

            if (usuarioBuscado == null || usuarioBuscado.Paciente == true) return null;

            return UsuarioDao.AgregarTutor(usuarioEnSesion, usuarioBuscado);
        }

        public static string AgregarEarlyAdopter(string email)
        {
            try
            {
                MailAddress m = new MailAddress(email);
                return UsuarioDao.AgregarEarlyAdopter(email);
            }
            catch (Exception)
            {
                return email;
            }
        }

        public static Medicamento NuevoMedicamento(FormMedicamento form)
        {
            return UsuarioDao.NuevoMedicamento(form);
        }

        public static List<Medicamento> ListarMedicamentosDePaciente(long id)
        {
            return UsuarioDao.ListarMedicamentosDePaciente(id);
        }

        public static Medicamento DesactivarRecordatorioMedicamento(int id)
        {
            return UsuarioDao.DesactivarRecordatorioMedicamento(id);
        }

        public static Usuario LoginPorToken(string token)
        {
            if (!String.IsNullOrEmpty(token)) { 
                return UsuarioDao.LoginPorToken(token);
            }
            else
            {
                return null;
            }
        }

        public static void TomarMedicamento (int id)
        {
            UsuarioDao.TomarMedicamento(id);
        }

        public static Alerta CrearAlertaManual(Alerta alerta, Usuario usuario)
        {
            alerta.Id_Usuario_Paciente = usuario.Id;
            alerta.Id_Usuario_Tutor = usuario.Id;
            return alerta;
        }

        public static Alerta GuardarAlertaManual(Alerta alerta)
        {
            return UsuarioDao.GuardarAlertaManual(alerta);
        }

        public static bool EnviarNotificacionHaciaCelular(string token, string value)
        {
            try
            {
                var applicationID = "AIzaSyA7l-YQmWastGC7A__Up-taR8fGtSs9nG8";
                var SENDER_ID = "auraapp-d137c";
                WebRequest tRequest;
                tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send");
                tRequest.Method = "post";
                tRequest.ContentType = " application/x-www-form-urlencoded;charset=UTF-8";
                tRequest.Headers.Add(string.Format("Authorization: key={0}", applicationID));

                tRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));
                string postData = "collapse_key=score_update&time_to_live=108&delay_while_idle=1&data.message=" + value + "&registration_id=" + token + "";
                Console.WriteLine(postData);
                Byte[] byteArray = Encoding.UTF8.GetBytes(postData);
                tRequest.ContentLength = byteArray.Length;

                Stream dataStream = tRequest.GetRequestStream();
                dataStream.Write(byteArray, 0, byteArray.Length);
                dataStream.Close();

                WebResponse tResponse = tRequest.GetResponse();

                dataStream = tResponse.GetResponseStream();

                StreamReader tReader = new StreamReader(dataStream);

                String sResponseFromServer = tReader.ReadToEnd();

                string respuesta = sResponseFromServer;
                tReader.Close();
                dataStream.Close();
                tResponse.Close();


                return true;
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + e.Message);
                return false;
            }
        }
    }
}