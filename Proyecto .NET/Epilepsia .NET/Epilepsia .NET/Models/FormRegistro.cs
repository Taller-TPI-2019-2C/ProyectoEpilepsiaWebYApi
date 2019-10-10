using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Models
{
    public class FormRegistro
    {
        public FormRegistro()
        {
            Pacientes = new[]
            {
                new SelectListItem { Value = "Paciente", Text = "Soy paciente de epilepsia"},
                new SelectListItem { Value = "Tutor", Text = "Quiero cuidar a una persona con epilepsia"}
            };
        }

        [Required]
        public string Nombre { get; set; }
        [Required]
        public string Apellido { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        [Display(Name = "Contraseña")]
        public string Contrasenia { get; set; }
        [Required]
        [Range(0, int.MaxValue, ErrorMessage = "La edad debe ser un número")]
        public string Edad { get; set; }

        [Required]
        [Display(Name = "¿Qué uso le daras a nuestra aplicación?")]
        public string Tipo_Paciente { set; get; }
        public IEnumerable<SelectListItem> Pacientes { set; get; }
    }
}