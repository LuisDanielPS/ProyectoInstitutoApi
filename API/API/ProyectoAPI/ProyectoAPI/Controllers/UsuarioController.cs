using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProyectoAPI.Entities;
using System.Data.Common;
using System.Data.SqlClient;
using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : Controller
    {

        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public UsuarioController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarUsuario")]
        public IActionResult ConsultarUsuario(long idUsuario)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<UsuarioEnt>("ConsultarUsuario",
                        new { idUsuario },
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

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
        [Route("ListaUsuarios")]
        public IActionResult ListaUsuarios(long IdUsuario)
        {
            try
            {

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<UsuarioEnt>("ListaUsuarios",
                        new { IdUsuario },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarEstadoUsuario")]
        public IActionResult ActualizarEstadoUsuario(UsuarioEnt Usuario)
        {
            try
            {               
                using (var context = new SqlConnection(_connection))
                {
                    var result = context.Execute("ActualizarEstadoUsuario",
                        new { Usuario.IdUsuario },
                        commandType: CommandType.StoredProcedure);

                    return Ok(result);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarRolUsuario")]
        public IActionResult ActualizarRolUsuario(UsuarioEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarRolUsuario",
                        new { entidad.IdUsuario, entidad.IdRol },
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
        [Route("ConsultarRoles")]
        public IActionResult ConsultarRoles()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarRoles",
                        new { },
                        commandType: CommandType.StoredProcedure).ToList();

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [AllowAnonymous]
        [Route("EditarUsuario")]
        public IActionResult EditarUsuario(UsuarioEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("EditarUsuario",
                        new {
                            entidad.IdUsuario,
                            entidad.Cedula,
                            entidad.Correo,
                            entidad.Nombre,
                            entidad.Apellido1,
                            entidad.Apellido2,
                            entidad.Telefono,
                            entidad.Direccion,
                        },
                        commandType: CommandType.StoredProcedure);

                    return Ok(datos);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut]
        [AllowAnonymous]
        [Route("ActualizarContrasena")]
        public IActionResult ActualizarContrasena(UsuarioEnt entidad)
        {
            try
            {
                entidad.PwUsuario = _utilitarios.Encrypt(entidad.PwUsuario);
                entidad.PwUsuarioAnterior = _utilitarios.Encrypt(entidad.PwUsuarioAnterior);

                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Execute("ActualizarContrasena",
                        new { entidad.IdUsuario, entidad.PwUsuarioAnterior, entidad.PwUsuario },
                        commandType: CommandType.StoredProcedure);

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
