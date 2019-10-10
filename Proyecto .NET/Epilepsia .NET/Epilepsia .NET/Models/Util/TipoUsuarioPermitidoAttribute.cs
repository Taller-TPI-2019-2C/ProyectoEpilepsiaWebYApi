using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Epilepsia.NET.Models.Util
{
    public class TipoUsuarioPermitidoAttribute : ValidationAttribute
    {
        public string[] AllowableValues { get; set; }

            protected override ValidationResult IsValid(object value, ValidationContext validationContext)
            {
                if (AllowableValues?.Contains(value?.ToString()) == true)
                {
                    return ValidationResult.Success;
                }

                var msg = $"Use los valores previstos: {string.Join(", ", (AllowableValues ?? new string[] { "Se encontraron valores incorrectos" }))}.";
                return new ValidationResult(msg);
            }
    }
}