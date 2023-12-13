using System.Security.Claims;

namespace ProyectoAPI.Entities
{
    public interface IUtilitarios
    {
        public string Encrypt(string texto);

        public string Decrypt(string texto);

        public string GenerarContrasenna();

        public void SendEmail(string recipient, string subject, string valueU, string valueP, int emailType);
    }
}
