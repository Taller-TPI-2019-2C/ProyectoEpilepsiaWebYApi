﻿using Epilepsia.NET.Dao;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
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

        //Esto no ira aca seguramente, aun no se bien como funciona el método. Sería parte de la API
        public static bool EnviarNotificacionHaciaCelular(string token)
        {
            try
            {
                var applicationID = "AIzaSyAEFq2sDmzIqtJdomO69ecmyuxmaYpgdgE";
                var SENDER_ID = "mitrapharmaencasa";
                var tokenHardcodeado = "dgoOi5eS8as:APA91bF-WNuKOurr8cqo61CnDNuIhyVnAK2hntG4mm6LfXxOr-b2PpTpNO9nGy2r6Vi8rX463vGWfTW7_JDrnLk7p8aOF-j7YpVDLMsKJMQgPsSpHGfN6_pKzhzpvNG-PhPOkk0vd-cy";
                var value = "mensaje de prueba";


                WebRequest tRequest;
                tRequest = WebRequest.Create("https://android.googleapis.com/gcm/send");
                tRequest.Method = "post";
                tRequest.ContentType = " application/x-www-form-urlencoded;charset=UTF-8";
                tRequest.Headers.Add(string.Format("Authorization: key={0}", applicationID));

                tRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));
                string postData = "collapse_key=score_update&time_to_live=108&delay_while_idle=1&data.message=" + value + "&registration_id=" + tokenHardcodeado + "";
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