using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoEpilepsia.Models
{
    public static class ServiceNonPatient
    {
        internal static List<TblPatientData> GetPatients(int userID)
        {
            return DaoNonPatient.GetPatients(userID);
        }
        
    }
}
