using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Epilepsia.NET.Models
{
    public class FormLogin
    {
        [Required]
        public string Email {get; set;}
        [Required]
        public string Contrasenia { get; set; }
    }
}