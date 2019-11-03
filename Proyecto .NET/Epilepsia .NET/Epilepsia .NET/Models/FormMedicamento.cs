using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Epilepsia.NET.Models
{
    public class FormMedicamento
    {
        [Required]
        public long pacienteId {get; set;}
        [Required]
        public string nombre { get; set; }
        [Required]
        public int periodicidadHoras { get; set; }
    }
}