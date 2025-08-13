using KProyecto.EF;
using KProyecto.Models;
using KProyecto.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;
using System.Web.UI;

namespace KProyecto.Controllers
{
    [OutputCache(Duration = 0, Location = OutputCacheLocation.None, NoStore = true, VaryByParam = "*")]
    [FiltroSesion]
    public class CarritoController : Controller
    {
        readonly Utilitarios service = new Utilitarios();

        [HttpPost]
        public ActionResult AgregarCarrito(long IdProducto)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var IdUsuario = long.Parse(Session["IdUsuario"].ToString());
                var result = dbContext.TCarrito.Include("TProducto")
                    .FirstOrDefault(u => u.IdProducto == IdProducto
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
                    if (result.Cantidad + 1 <= result.TProducto.Cantidad)
                    {
                        result.Cantidad += 1;
                        result.FechaCarrito = DateTime.Now;
                    }
                    else
                    {
                        return Json($"Supera el límite establecido en el inventario. Unidades disponibles {result.TProducto.Cantidad}");
                    }
                }

                var transaccion = dbContext.SaveChanges();

                if (transaccion > 0)
                {
                    service.ConsultarDatosCarrito();
                    return Json("OK");
                }

                return Json("No se pudo actualizar su carrito");
            }
        }

        [HttpGet]
        public ActionResult ConsultarCarrito()
        {
            var result = service.ConsultarDatosCarrito();
            return View(result);
        }

        [HttpPost]
        public ActionResult EliminarProductoCarrito(long IdProducto)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var IdUsuario = long.Parse(Session["IdUsuario"].ToString());
                var result = dbContext.TCarrito.FirstOrDefault(u => u.IdProducto == IdProducto
                                                                 && u.IdUsuario == IdUsuario);

                if (result != null)
                {
                    dbContext.TCarrito.Remove(result);
                    var delete = dbContext.SaveChanges();

                    if (delete > 0)
                        return Json("OK");
                }

                return Json("No se pudo eliminar el producto de su carrito");
            }
        }

        [HttpPost]
        public ActionResult ProcesarPago()
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var IdUsuario = long.Parse(Session["IdUsuario"].ToString());
                var result = dbContext.ProcesarPago(IdUsuario);

                if (result > 0)
                {
                    service.ConsultarDatosCarrito();
                    return Json("OK");
                }

                return Json("No se pudo realizar el pago de su carrito");
            }
        }

        [HttpGet]
        public ActionResult ConsultarFacturas()
        {
            var result = service.ConsultarDatosFacturas();
            return View(result);
        }

        [HttpGet]
        public ActionResult ConsultarDetalleFactura(long id)
        {
            var result = service.ConsultarDatosDetalleFactura(id);
            return View(result);
        }

    }
}