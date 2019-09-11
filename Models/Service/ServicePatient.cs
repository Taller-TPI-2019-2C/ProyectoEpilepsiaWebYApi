using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoEpilepsia.Models
{
    public static class ServicePatient
    {
        internal static List<TblNonPatientData> GetGuardians (int userID)
        {
            return DaoPatient.GetGuardians(userID);
        }
        
    }
}
