using KProyecto.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KProyecto.Models
{
    public class AdminValues
    {
        public int CantidadClientes { get; set; }
        public List<TUsuario> ClientesTop { get; set; }

        public int CantidadProductosActivos { get; set; }
        public int CantidadProductosInactivos { get; set; }
        public List<TProducto> ProductosTop { get; set; }
    }
}