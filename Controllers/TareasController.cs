using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using proyectoReact1.Contexts;
using proyectoReact1.Models;

namespace proyectoReact1.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class TareasController : ControllerBase
    {
        private readonly ConexionSQLServer _context;
        public TareasController(ConexionSQLServer context){
            _context = context;
        }

        [HttpGet]
        [Route("Lista")]
        public async Task<IActionResult> Lista(){
            List<Tareas> lista = _context.Tareas.OrderByDescending(t=>t.idTarea).ThenBy(t=>t.fechaRegistro).ToList();
            return StatusCode(StatusCodes.Status200OK, lista);
        }

        [HttpPost]
        [Route("Guardar")]

        public async Task<IActionResult> Guardar([FromBody] Tareas request){
            await _context.Tareas.AddAsync(request);
            await _context.SaveChangesAsync();
            return StatusCode(StatusCodes.Status200OK, "Ok");
        }

        [HttpDelete]
        [Route("Cerrar/{id:int}")]

        public async Task<IActionResult> Cerrar(int id){
            Tareas tarea = _context.Tareas.Find(id);
            _context.Tareas.Remove(tarea);
            
            await _context.SaveChangesAsync();
            return StatusCode(StatusCodes.Status200OK, "Ok");
        }

        

    }
}