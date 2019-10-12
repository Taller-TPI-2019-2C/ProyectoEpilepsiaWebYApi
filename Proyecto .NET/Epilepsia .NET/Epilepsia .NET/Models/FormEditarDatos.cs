using Epilepsia.NET.Models.Util;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Epilepsia.NET.Models
{
    public class FormEditarDatos
    {
        public FormEditarDatos()
        {
            Pacientes = new[]
            {
                new SelectListItem { Value = "Paciente", Text = "Soy paciente de epilepsia"},
                new SelectListItem { Value = "Tutor", Text = "Quiero cuidar a una persona con epilepsia"}
            };
        }

        [Required]
        public long Id { get; set; }

        [Required]
        public string Nombre { get; set; }

        [Required]
        public string Apellido { get; set; }

        [Required]
        [Display(Name = "¿Qué uso le daras a nuestra aplicación?")]
        [TipoUsuarioPermitido(AllowableValues = new[] { "Paciente", "Tutor" }, ErrorMessage = "Error en la seleción. Intente de nuevo")]
        public string Tipo_Usuario { set; get; }
        public IEnumerable<SelectListItem> Pacientes { set; get; }
    }
}