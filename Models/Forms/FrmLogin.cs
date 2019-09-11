using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ProyectoEpilepsia.Models
{
    public class FrmLogin
    {
        [Required]
        public string User { get; set; }
        [Required]
        public string Pwd { get; set; }
    }
}
