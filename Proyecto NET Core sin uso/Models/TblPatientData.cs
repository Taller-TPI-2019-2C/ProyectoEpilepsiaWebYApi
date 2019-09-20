using System;
using System.Collections.Generic;

namespace ProyectoEpilepsia.Models
{
    public partial class TblPatientData
    {
        public TblPatientData()
        {
            TblGuardian = new HashSet<TblGuardian>();
        }

        public int UserId { get; set; }
        public DateTime BirthDate { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        public TblUser User { get; set; }
        public ICollection<TblGuardian> TblGuardian { get; set; }
    }
}
