namespace KProyecto.Models
{
    public class Usuario
    {
        public long IdUsuario { get; set; }
        public string Identificacion { get; set; }
        public string Nombre { get; set; }
        public string Correo { get; set; }
        public string Contrasenna { get; set; }
        public string ContrasennaAnterior { get; set; }
        public bool Estado { get; set; }
        public int IdRol { get; set; }
    }
}