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
        public ActionResult CambiarDatosUsuario(long IdUsuario, bool Estado, int IdRol)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var result = dbContext.TUsuario.FirstOrDefault(u => u.IdUsuario == IdUsuario);

                if (result != null)
                {
                    result.Estado = Estado;
                    result.IdRol = IdRol;
                    var update = dbContext.SaveChanges();
                    return Json("OK");
                }

                return Json("No se pudo actualizar el estado del usuario");
            }
        }     

        private List<TUsuario> ConsultarDatosUsuarios()
        {
            using (var dbContext = new KNDataBaseEntities())
            {

                ViewBag.Estados = new List<SelectListItem>{
                    new SelectListItem{ Value = "1", Text = "Activo" },
                    new SelectListItem{ Value = "0", Text = "Inactivo" },
                };

                ViewBag.Roles = dbContext.TRol.Select(r => new SelectListItem { Value = r.IdRol.ToString(), Text = r.DescripcionRol}).ToList();

                return dbContext.TUsuario.Include("TRol").ToList();
            }
        }

    }
}