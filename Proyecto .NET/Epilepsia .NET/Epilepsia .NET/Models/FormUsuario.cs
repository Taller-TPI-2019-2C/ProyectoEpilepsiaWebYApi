using Epilepsia.NET.Models.Util;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Models
{
    public class FormUsuario
    {
        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        [Display(Name = "Contraseña")]
        public string Contrasenia { get; set; }
        [Range(0, int.MaxValue, ErrorMessage = "La edad debe ser un número")]
        public DateTime? FechaNacimiento { get; set; }

        [Required]
        public bool Paciente { set; get; }
    }
}