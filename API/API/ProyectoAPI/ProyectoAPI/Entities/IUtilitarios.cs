namespace ProyectoAPI.Entities
{
    public interface IUtilitarios
    {
        public string Encrypt(string texto);

        public string Decrypt(string texto);
    }
}
