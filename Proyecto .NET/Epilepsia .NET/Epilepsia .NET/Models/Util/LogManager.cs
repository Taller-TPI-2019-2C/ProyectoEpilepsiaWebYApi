using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Epilepsia.NET
{
    public static class LogManager
    {
        public static void Escribir(string Mensaje, string ruta)
        {
            string path = ruta + "\\Logs";

            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            string filepath = ruta + "\\Logs\\ServiceLog_" + DateTime.Now.Date.ToShortDateString().Replace('/', '_') + ".txt";
            if (!File.Exists(filepath))
            {
                using (StreamWriter sw = File.CreateText(filepath))
                {
                    sw.WriteLine(Mensaje);
                }
            }
            else
            {
                using (StreamWriter sw = File.AppendText(filepath))
                {
                    sw.WriteLine(Mensaje);
                }
            }
        }
    }
}