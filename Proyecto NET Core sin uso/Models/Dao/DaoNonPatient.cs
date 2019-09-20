using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoEpilepsia.Models
{
    public static class DaoNonPatient
    {
        internal static TblNonPatientData GetById (int id) {
            using (var ctx = new Context())
            {
                return ctx.TblNonPatientData.Find(id);
            }
        }

        internal static List<TblPatientData> GetPatients(int userID)
        {
            using (var ctx = new Context())
            {
                return ctx.TblGuardian.Where(x=>x.NonPatient==userID).Select(x=>x.PatientNavigation).ToList();
            }
        }
    }
}
