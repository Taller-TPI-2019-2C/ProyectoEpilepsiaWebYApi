//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Epilepsia.NET
{
    using System;
    using System.Collections.Generic;
    
    public partial class Alerta
    {
        public long Id { get; set; }
        public Nullable<int> Tipo_Alerta { get; set; }
        public long Id_Usuario_Paciente { get; set; }
        public long Id_Usuario_Tutor { get; set; }
        public Nullable<System.DateTime> Tiempo { get; set; }
        public string Notas { get; set; }
    
        public virtual Usuario Usuario { get; set; }
        public virtual Usuario Usuario1 { get; set; }
    }
}
