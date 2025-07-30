using KProyecto.EF;
using KProyecto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace KProyecto.Controllers
{
    [OutputCache(Duration = 0, Location = OutputCacheLocation.None, NoStore = true, VaryByParam = "*")]
    [FiltroSesion]
    public class CarritoController : Controller
    {

        [HttpPost]
        public ActionResult AgregarCarrito(long IdProducto)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var IdUsuario = long.Parse(Session["IdUsuario"].ToString());
                var result = dbContext.TCarrito.FirstOrDefault(u => u.IdProducto == IdProducto
                                                                 && u.IdUsuario == IdUsuario);

                if (result == null)
                {
                    dbContext.TCarrito.Add(new TCarrito
                    {
                        IdUsuario = IdUsuario,
                        IdProducto = IdProducto,
                        Cantidad = 1,
                        FechaCarrito = DateTime.Now
                    });
                }
                else
                {
                    result.Cantidad += 1;
                    result.FechaCarrito = DateTime.Now;
                }

                var transaccion = dbContext.SaveChanges();
                if(transaccion > 0)
                   return Json("OK");

                return Json("No se pudo actualizar su carrito");
            }
        }

    }
}