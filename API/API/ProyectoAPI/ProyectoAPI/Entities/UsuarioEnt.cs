﻿namespace ProyectoAPI.Entities
{
    public class UsuarioEnt
    {
        public long IdUsuario { get; set; }
        public string Cedula { get; set; } = string.Empty;
        public string Correo { get; set; } = string.Empty;
        public string Nombre { get; set; } = string.Empty;
        public string Apellido1 { get; set; } = string.Empty;
        public string Apellido2 { get; set; } = string.Empty;
        public DateTime FechaNacimiento { get; set; }
        public string Telefono { get; set; } = string.Empty;
        public string Direccion { get; set; } = string.Empty;
        public int IdEstatus { get; set; }
        public int IdRol { get; set; }
        public string Usuario { get; set; } = string.Empty;
        public string PwUsuario { get; set; } = string.Empty;
        public string PwUsuarioAnterior { get; set; } = string.Empty;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaUltimaActividad { get; set; }
        public string NombreRol { get; set; } = string.Empty;
    }
}
