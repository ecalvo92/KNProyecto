using KProyecto.EF;
using KProyecto.Models;
using System.Linq;
using System.Web.Mvc;

namespace KProyecto.Controllers
{
    public class UsuarioController : Controller
    {
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
                    else
                        ViewBag.Mensaje = "No se pudo actualizar la información";
                }

                return View("ConsultarPerfilUsuario");
            }
        }

    }
}