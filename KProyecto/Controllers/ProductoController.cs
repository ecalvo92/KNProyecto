using KProyecto.EF;
using KProyecto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace KProyecto.Controllers
{
    public class ProductoController : Controller
    {
        [HttpGet]
        public ActionResult ConsultarProductos()
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var datos = new List<Producto>();

                //var result = dbContext.TProducto.ToList();
                var result = dbContext.ConsultarProductos().ToList();

                foreach (var item in result)
                {
                    var producto = new Producto
                    {
                        Nombre = item.Nombre
                    };
                    datos.Add(producto);
                }

                return View(datos);
            }
        }
    }
}