using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using proyectoReact1.Models;

namespace proyectoReact1.Contexts
{
    public class ConexionSQLServer:DbContext
    {
        public ConexionSQLServer(DbContextOptions<ConexionSQLServer>options) :base(options) 
        {
            //
        }
        public DbSet<Tareas> Tareas {get;set;}
    }
}