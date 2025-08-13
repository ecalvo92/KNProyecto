using KProyecto.EF;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace KProyecto.Services
{
    public class Utilitarios
    {
        public bool EnviarCorreo(string destinatario, string mensaje, string asunto)
        {
            try
            {
                var remitente = ConfigurationManager.AppSettings["CorreoRemitente"];
                var contrasena = ConfigurationManager.AppSettings["CorreoPassword"];

                MailMessage mail = new MailMessage
                {
                    From = new MailAddress(remitente),
                    To = { destinatario },
                    Subject = asunto,
                    Body = mensaje,
                    IsBodyHtml = true,
                };

                // Para Office 365
                SmtpClient smtp = new SmtpClient("smtp.office365.com", 587)
                {
                    Credentials = new NetworkCredential(remitente, contrasena),
                    EnableSsl = true
                };

                smtp.Send(mail);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public string GenerarPassword(int longitud = 8)
        {
            const string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var sb = new StringBuilder(longitud);

            for (int i = 0; i < longitud; i++)
            {
                int index = random.Next(caracteres.Length);
                sb.Append(caracteres[index]);
            }

            return sb.ToString();
        }

        public List<TProducto> ConsultarDatosProductos(string filtro)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                List<TProducto> result;

                if (filtro == "Todos")
                    result = dbContext.TProducto.ToList();
                else
                    result = dbContext.TProducto.Where(x => x.Estado == true).ToList();

                return result;
            }
        }

        public List<TCarrito> ConsultarDatosCarrito()
        {
            var IdUsuario = long.Parse(HttpContext.Current.Session["IdUsuario"].ToString());
            using (var dbContext = new KNDataBaseEntities())
            {
                var carrito = dbContext.TCarrito.Include("TProducto")
                    .Where(x => x.IdUsuario == IdUsuario).ToList();

                HttpContext.Current.Session["TotalCarrito"] = carrito.Sum(x => x.Cantidad * x.TProducto.Precio) * 1.13M;
                HttpContext.Current.Session["CantidadCarrito"] = carrito.Sum(x => x.Cantidad);

                return carrito;
            }
        }

        public List<TMaestro> ConsultarDatosFacturas()
        {
            var IdUsuario = long.Parse(HttpContext.Current.Session["IdUsuario"].ToString());
            using (var dbContext = new KNDataBaseEntities())
            {
                var facturas = dbContext.TMaestro.Include("TDetalle")
                    .Where(x => x.IdUsuario == IdUsuario).ToList();
                return facturas;
            }
        }

        public List<TDetalle> ConsultarDatosDetalleFactura(long Id)
        {
            using (var dbContext = new KNDataBaseEntities())
            {
                var detalles = dbContext.TDetalle.Include("TProducto")
                    .Where(x => x.IdMaestro == Id).ToList();
                return detalles;
            }
        }
        

    }
}