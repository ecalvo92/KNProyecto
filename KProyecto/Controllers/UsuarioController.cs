using KProyecto.EF;
using KProyecto.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.UI;

namespace KProyecto.Controllers
{
    [OutputCache(Duration = 0, Location = OutputCacheLocation.None, NoStore = true, VaryByParam = "*")]
    [FiltroSesion]   
    public class UsuarioController : Controller
    {
        #region ConsultarPerfilUsuario

        [HttpGet]
        public ActionResult ConsultarPerfilUsuario()
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var datos = new Usuario();

                var idUsuario = long.Parse(Session["IdUsuario"].ToString());
                var result = dbContext.TUsuario.FirstOrDefault(u => u.IdUsuario == idUsuario);

                if (result != null)
                {
                    datos.Identificacion = result.Identificacion;
                    datos.Nombre = result.Nombre;
                    datos.Correo = result.Correo;
                }

                return View(datos);
            }
        }

        [HttpPost]
        public ActionResult ActualizarPerfilUsuario(Usuario usuario)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                ViewBag.Mensaje = "No se pudo actualizar la información";

                var idUsuario = long.Parse(Session["IdUsuario"].ToString());
                var result = dbContext.TUsuario.FirstOrDefault(u => u.IdUsuario == idUsuario);

                if (result != null)
                {
                    result.Correo = usuario.Correo;
                    result.Nombre = usuario.Nombre;
                    result.Identificacion = usuario.Identificacion;

                    var update = dbContext.SaveChanges();

                    if (update > 0)
                    {
                        ViewBag.Mensaje = "Información actualizada correctamente";
                        Session["Nombre"] = usuario.Nombre;
                    }
                }

                return View("ConsultarPerfilUsuario", usuario);
            }
        }

        #endregion

        #region CambiarContrasenna

        [HttpGet]
        public ActionResult CambiarContrasenna()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CambiarContrasenna(Usuario usuario)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                ViewBag.Mensaje = "No se pudo actualizar la información";

                var idUsuario = long.Parse(Session["IdUsuario"].ToString());
                var result = dbContext.TUsuario.FirstOrDefault(u => u.IdUsuario == idUsuario
                                                                 && u.Contrasenna == usuario.ContrasennaAnterior);

                if (result != null)
                {
                    result.Contrasenna = usuario.Contrasenna;

                    var update = dbContext.SaveChanges();

                    if (update > 0)
                    {
                        usuario.Contrasenna = string.Empty;
                        usuario.ContrasennaAnterior = string.Empty;
                        ViewBag.Mensaje = "Información actualizada correctamente";
                    }
                }

                return View(usuario);
            }
        }

        #endregion

        
        [HttpGet]
        [FiltroAdministrador]
        public ActionResult ConsultarUsuarios()
        {
            var result = ConsultarDatosUsuarios();
            return View(result);
        }


        [HttpPost]
        public ActionResult CambiarEstadoUsuario(Usuario usuario)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var result = dbContext.TUsuario.FirstOrDefault(u => u.IdUsuario == usuario.IdUsuario);

                if (result != null)
                {
                    result.Estado = usuario.Estado;
                    var update = dbContext.SaveChanges();

                    if (update > 0)
                        return RedirectToAction("ConsultarUsuarios", "Usuario");
                }

                var result2 = ConsultarDatosUsuarios();

                ViewBag.Mensaje = "No se pudo actualizar el estado del usuario";
                return View("ConsultarUsuarios", result2);
            }
        }     

        private List<TUsuario> ConsultarDatosUsuarios()
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                return dbContext.TUsuario.Include("TRol").ToList();
            }
        }

    }
}