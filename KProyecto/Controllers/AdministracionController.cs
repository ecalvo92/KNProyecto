using KProyecto.EF;
using KProyecto.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KProyecto.Controllers
{
    public class AdministracionController : Controller
    {
        public ActionResult MiniDashboard()
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var datos = new AdminValues();

                //Consultar usuarios
                var resultUsuarios = dbContext.TUsuario.ToList();
                datos.CantidadClientes = resultUsuarios.Where(x => x.IdRol == 1).ToList().Count;

                var resultUsuariosFacturas = dbContext.TUsuario.Include("TMaestro").Where(x => x.IdRol == 1).ToList();
                datos.ClientesTop = resultUsuariosFacturas.Take(5).OrderByDescending(x => x.TMaestro.Sum(y => y.TotalPagado)).ToList();

                var resultProductos = dbContext.TProducto.ToList();
                datos.CantidadProductosActivos = resultProductos.Where(x => x.Estado == true).ToList().Count;
                datos.CantidadProductosInactivos = resultProductos.Where(x => x.Estado == false).ToList().Count;

                var resultProductosFacturas = dbContext.TProducto.Include("TDetalle").ToList();
                datos.ProductosTop = resultProductosFacturas.Take(5).OrderByDescending(x => x.TDetalle.Sum(y => y.Cantidad)).ToList();

                return View(datos);
            }
        }
    }
}