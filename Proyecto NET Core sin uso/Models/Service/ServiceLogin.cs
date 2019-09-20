using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoEpilepsia.Models
{
    public static class ServiceLogin
    {
        
        internal static TblUser Login (FrmLogin form)
        {
            return DaoUser.Login(form);
        }
        
    }
}
