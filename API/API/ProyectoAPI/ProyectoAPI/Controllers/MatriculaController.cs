using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using ProyectoAPI.Entities;
using System.Data.SqlClient;
using System.Data;
using Dapper;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MatriculaController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public MatriculaController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarCursos")]
        public IActionResult ConsultarCursos()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarCursos",
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

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarModalidades")]
        public IActionResult ConsultarModalidades()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarModalidades",
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

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarNiveles")]
        public IActionResult ConsultarNiveles()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarNiveles",
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

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarHorarios")]
        public IActionResult ConsultarHorarios()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarHorarios",
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

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarUsuariosPorRol")]
        public IActionResult ConsultarUsuariosPorRol()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarUsuariosPorRol",
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

        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarMatricula")]
        public IActionResult RegistrarMatricula(MatriculaEnt entidad)
        {
            try
            {
                var verificacionMatricula = VerificarMatricula(entidad.IdUsuario);
                if (!verificacionMatricula)
                {
                    return Ok(150);
                }


                using (var context = new SqlConnection(_connection))
                {
                    entidad.IdEstatus = 1;

                    var datos = context.Execute("InsertarMatricula",
                        new
                        {
                            entidad.IdUsuario,
                            entidad.IdCurso,
                            entidad.IdModalidad,
                            entidad.IdNivel,
                            entidad.IdHorario,
                            entidad.Monto,
                            entidad.Comentario
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

        [HttpGet]
        [AllowAnonymous]
        [Route("VerificarMatricula")]
        public bool VerificarMatricula(long IdUsuario)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var result = context.ExecuteScalar<int>("VerificarMatricula", new { IdUsuario }, commandType: CommandType.StoredProcedure);

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

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarClientes")]
        public IActionResult ConsultarClientes()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<UsuarioEnt>("ConsultarClientes",
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

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarUsuariosMatriculados")]
        public IActionResult ConsultarUsuariosMatriculados()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<UsuariosMatriculadosEnt>("ConsultarUsuariosMatriculados",
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
        [Route("EliminarMatriculaPorUsuario")]
        public bool EliminarMatriculaPorUsuario(UsuariosMatriculadosEnt Usuario)
        {
            try
            {
                var idUsuario = Usuario.IdUsuario;
                using (var context = new SqlConnection(_connection))
                {
                    var result = context.ExecuteScalar<int>("EliminarMatriculaPorUsuario", new { idUsuario }, commandType: CommandType.StoredProcedure);

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
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}
