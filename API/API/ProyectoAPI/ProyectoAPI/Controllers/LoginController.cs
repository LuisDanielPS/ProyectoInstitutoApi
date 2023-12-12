using Microsoft.AspNetCore.Mvc;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using ProyectoAPI.Entities;
using Microsoft.AspNetCore.Authorization;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private string _connection;
        private readonly IUtilitarios _utilitarios;

        public LoginController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _utilitarios = utilitarios;
            _connection = _configuration.GetConnectionString("DefaultConnection");
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("IniciarSesion")]
        public IActionResult IniciarSesion(UsuarioEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    entidad.PwUsuario = _utilitarios.Encrypt(entidad.PwUsuario);

                    var datos = context.Query<UsuarioEnt>("IniciarSesion",
                        new { entidad.Usuario, entidad.PwUsuario },
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                    if (datos != null)
                    {
                        return Ok(datos);
                    }
                    else
                    {
                        return BadRequest("Uusario o clave incorrectos");
                    }

                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarUsuario")]
        public IActionResult RegistrarUsuario(UsuarioEnt entidad)
        {
            try
            {
                var verificacionCorreo = VerificarCorreo(entidad.Correo);
                if (!verificacionCorreo)
                {
                    return Ok(150);
                }

                using (var context = new SqlConnection(_connection))
                {
                    entidad.IdEstatus = 1;
                    entidad.IdRol = 2;

                    string dato = entidad.Telefono.Substring(entidad.Telefono.Length - 4);

                    entidad.Usuario = (entidad.Nombre.Substring(0, 1) + entidad.Apellido1.Substring(0, 4) + dato).ToLower();

                    entidad.PwUsuario = _utilitarios.Encrypt(entidad.PwUsuario);

                    var datos = context.Execute("RegistrarUsuario",
                        new { entidad.Correo, entidad.Cedula, entidad.Nombre, entidad.Apellido1, entidad.Apellido2,
                            entidad.Telefono, entidad.Direccion, entidad.IdEstatus, entidad.IdRol, 
                            entidad.Usuario, entidad.PwUsuario },
                        commandType: CommandType.StoredProcedure);

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("VerificarCorreo")]
        public bool VerificarCorreo(string correo)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var result = context.ExecuteScalar<int>("VerificarCorreo", new { correo }, commandType: CommandType.StoredProcedure);

                    if (result == 0)
                    {
                        return true;  
                    }
                    else 
                    { 
                        return false; 
                    }
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        [HttpPut]
        [Authorize]
        [Route("RestablecerClave")]
        public IActionResult RestablecerClave(UsuarioEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {

                    var consultaUsuario = context.Query<UsuarioEnt>("ConsultarUsuario",
                        new { entidad.Usuario },
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                    entidad.PwUsuario = _utilitarios.GenerarContrasenna();

                    var datos = context.Execute("RestablecerClave",
                        new { consultaUsuario.IdUsuario, entidad.PwUsuario },
                        commandType: CommandType.StoredProcedure);

                    if (datos > 0)
                    {
                        _utilitarios.SendEmail(consultaUsuario.Correo, "Restablecimiento de contraseña", consultaUsuario.Usuario, entidad.PwUsuario, 1);
                    }

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
