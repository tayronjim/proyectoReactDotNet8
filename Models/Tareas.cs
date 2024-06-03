using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace proyectoReact1.Models
{
    public class Tareas
    {
        [Key]
        public int idTarea { get; set; }
        public string? descripcion { get; set; }
        public DateTime? fechaRegistro { get; set; }
    }
}