using System;
using System.Collections.Generic;

namespace ProyectoEpilepsia.Models
{
    public partial class TblUser
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public bool Patient { get; set; }
        public string Password { get; set; }

        public TblNonPatientData TblNonPatientData { get; set; }
        public TblPatientData TblPatientData { get; set; }
    }
}
