using System;
using System.Collections.Generic;

namespace ProyectoEpilepsia.Models
{
    public partial class TblGuardian
    {
        public int Patient { get; set; }
        public int NonPatient { get; set; }

        public TblNonPatientData NonPatientNavigation { get; set; }
        public TblPatientData PatientNavigation { get; set; }
    }
}
