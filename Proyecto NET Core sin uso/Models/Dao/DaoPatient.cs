using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoEpilepsia.Models
{
    public static class DaoPatient
    {
        internal static TblPatientData GetById (int id) {
            using (var ctx = new Context())
            {
                return ctx.TblPatientData.Find(id);
            }
        }

        internal static List<TblNonPatientData> GetGuardians(int userID)
        {
            using (var ctx = new Context())
            {
                return ctx.TblGuardian.Where(x=>x.Patient==userID).Select(x=>x.NonPatientNavigation).ToList();
            }
        }
    }
}
