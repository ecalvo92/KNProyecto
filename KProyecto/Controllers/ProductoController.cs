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
            return View();
        }
    }
}