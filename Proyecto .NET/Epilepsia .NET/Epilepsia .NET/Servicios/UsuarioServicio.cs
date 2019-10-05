using Epilepsia.NET.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Epilepsia.NET.Servicios
{
    public static class UsuarioServicio
    {
        public static int obtenerCantidadDeUsuariosRegistrados()
        {
            return UsuarioDao.obtenerCantidadDeUsuariosRegistrados();
        }
    }
}