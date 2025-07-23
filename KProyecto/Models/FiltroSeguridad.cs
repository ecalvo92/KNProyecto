using System.Web.Mvc;

namespace KProyecto.Models
{
    public class FiltroSesion : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var sesion = filterContext.HttpContext.Session;

            if (sesion["IdUsuario"] == null)
            {
                // Redireccionarlo a la pantalla de inicio
                filterContext.Result = new RedirectResult("~/Home/Index");
            }

            base.OnActionExecuting(filterContext);
        }
    }

    public class FiltroAdministrador : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var sesion = filterContext.HttpContext.Session;

            if (sesion["IdUsuario"] == null || sesion["IdRol"]?.ToString() != "2")
            {
                // Redireccionarlo a la pantalla de inicio
                filterContext.Result = new RedirectResult("~/Home/Principal");
            }

            base.OnActionExecuting(filterContext);
        }
    }
}