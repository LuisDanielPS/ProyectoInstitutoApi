namespace ProyectoAPI.Entities
{
    public class GrupoEnt
    {
        public int IdGrupo { get; set; }
        public int IdEstatus { get; set; }
        public string Descripcion { get; set; } = string.Empty;
        public int IdCurso { get; set; }
        public string NombreCurso { get; set; } = string.Empty;
    }
}
