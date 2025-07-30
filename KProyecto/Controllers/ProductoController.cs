using KProyecto.EF;
using KProyecto.Models;
using KProyecto.Services;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KProyecto.Controllers
{
    [OutputCache(Duration = 0, Location = OutputCacheLocation.None, NoStore = true, VaryByParam = "*")]
    [FiltroSesion]
    [FiltroAdministrador]
    public class ProductoController : Controller
    {
        readonly Utilitarios service = new Utilitarios();

        [HttpGet]
        public ActionResult ConsultarProductos()
        {
            var result = service.ConsultarDatosProductos("Todos");
            return View(result);
        }

        #region RegistrarProducto

        [HttpGet]
        public ActionResult RegistrarProducto()
        {
            return View();
        }

        [HttpPost]
        public ActionResult RegistrarProducto(Producto producto, HttpPostedFileBase ImagenProducto)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var tabla = new TProducto();
                tabla.IdProducto = 0;
                tabla.Nombre = producto.Nombre;
                tabla.Descripcion = producto.Descripcion;
                tabla.Cantidad = producto.Cantidad;
                tabla.Precio = producto.Precio;
                tabla.Estado = true;
                tabla.Imagen = string.Empty;

                dbContext.TProducto.Add(tabla);
                var result = dbContext.SaveChanges();

                //var result = dbContext.RegistroProducto(
                //    producto.Nombre,
                //    producto.Descripcion,
                //    producto.Cantidad,
                //    producto.Precio,
                //    producto.Imagen).FirstOrDefault();

                if (result > 0)
                {
                    string extension = Path.GetExtension(ImagenProducto.FileName);
                    string ruta = AppDomain.CurrentDomain.BaseDirectory + "Productos\\" + tabla.IdProducto + extension;
                    ImagenProducto.SaveAs(ruta);

                    tabla.Imagen = "/Productos/" + tabla.IdProducto + extension;
                    dbContext.SaveChanges();

                    return RedirectToAction("ConsultarProductos", "Producto");
                }

                ViewBag.Mensaje = "No se pudo registrar el producto";
                return View();
            }


        }

        #endregion

        #region ActualizarProducto

        [HttpGet]
        public ActionResult ActualizarProducto(long id)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var datos = new Producto();
                var result = dbContext.TProducto.FirstOrDefault(p => p.IdProducto == id);

                if (result != null)
                {
                    datos.IdProducto = result.IdProducto;
                    datos.Nombre = result.Nombre;
                    datos.Descripcion = result.Descripcion;
                    datos.Cantidad = result.Cantidad;
                    datos.Precio = result.Precio;
                    datos.Estado = result.Estado;
                    datos.Imagen = result.Imagen;
                }

                return View(datos);
            }
        }

        [HttpPost]
        public ActionResult ActualizarProducto(Producto producto, HttpPostedFileBase ImagenProducto)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var result = dbContext.TProducto.FirstOrDefault(u => u.IdProducto == producto.IdProducto);

                if (result != null)
                {
                    result.Nombre = producto.Nombre;
                    result.Descripcion = producto.Descripcion;
                    result.Cantidad = producto.Cantidad;
                    result.Precio = producto.Precio;

                    if (ImagenProducto != null)
                    {
                        System.IO.File.Delete(AppDomain.CurrentDomain.BaseDirectory + result.Imagen);

                        string extension = Path.GetExtension(ImagenProducto.FileName);
                        string ruta = AppDomain.CurrentDomain.BaseDirectory + "Productos\\" + result.IdProducto + extension;
                        ImagenProducto.SaveAs(ruta);

                        result.Imagen = "/Productos/" + result.IdProducto + extension;
                    }

                    var update = dbContext.SaveChanges();

                    if (update > 0)
                        return RedirectToAction("ConsultarProductos", "Producto");
                }

                ViewBag.Mensaje = "No se pudo actualizar el producto";
                return View(producto);
            }
        }

        #endregion

        [HttpPost]
        public ActionResult CambiarEstadoProducto(Producto producto)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var result = dbContext.TProducto.FirstOrDefault(u => u.IdProducto == producto.IdProducto);

                if (result != null)
                {
                    result.Estado = producto.Estado;
                    var update = dbContext.SaveChanges();

                    if (update > 0)
                        return RedirectToAction("ConsultarProductos", "Producto");
                }

                var result2 = service.ConsultarDatosProductos("Todos");

                ViewBag.Mensaje = "No se pudo actualizar el estado del producto";
                return View("ConsultarProductos", result2);
            }            
        }

    }
}