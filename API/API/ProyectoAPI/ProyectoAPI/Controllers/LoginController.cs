using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProyectoAPI.Entities;
using System.Data;
using System.Data.SqlClient;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private string _connection;

        public LoginController(IConfiguration configuration)
        {
            _configuration = configuration;
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
        public IActionResult RegistrarUsuario(UsuarioRegistrarEnt entidad)
        {
            try
            {
                var verificacionCorreo = VerificarCorreo(entidad.Correo);
                if (verificacionCorreo >= 1)
                {
                    return Ok(150);
                }
                using (var context = new SqlConnection(_connection))
                {
                    entidad.IdEstatus = 1;
                    entidad.IdRol = 2;
                    var datos = context.Execute("RegistrarUsuario",
                        new { entidad.Correo, entidad.Nombre, entidad.Apellido1, entidad.Apellido2, 
                            entidad.FechaNacimiento, entidad.Telefono, entidad.Direccion, entidad.IdEstatus, entidad.IdRol, 
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

        public int VerificarCorreo(string correo)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    context.Open();

                    var parameters = new DynamicParameters();
                    parameters.Add("@Correo", correo, DbType.String);

                    var result = context.QueryFirstOrDefault<int>("VerificarCorreo", parameters, commandType: CommandType.StoredProcedure);

                    return result;
                }
            }
            catch (Exception)
            {
                return -1;
            }
        }

    }
}
