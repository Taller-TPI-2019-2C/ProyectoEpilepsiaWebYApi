using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoEpilepsia.Models
{
    public static class DaoUser
    {
        internal static TblUser GetById (int id) {
            using (var ctx = new Context())
            {
                return ctx.TblUser.Find(id);
            }
        }

        internal static TblUser Login(FrmLogin form)
        {
            using (var ctx = new Context())
            {
                return ctx.TblUser.Where(x=>x.Email==form.User&&x.Password==form.Pwd)
                    .Include(x => x.TblPatientData)
                    .Include(x => x.TblNonPatientData)
                    .FirstOrDefault();
            }
        }
        

    }
}
