using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProyectoAPI.Entities;
using System.Data.SqlClient;
using System.Data;
using Dapper;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GrupoController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public GrupoController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarGrupo")]
        public IActionResult RegistrarGrupo(GrupoEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    entidad.IdEstatus = 1;

                    var datos = context.Execute("InsertarGrupo",
                        new
                        {
                            entidad.IdEstatus,
                            entidad.Descripcion,
                            entidad.IdCurso
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



        [HttpPost]
        [AllowAnonymous]
        [Route("RegistrarEstudianteGrupo")]
        public IActionResult RegistrarEstudianteGrupo(GrupoEstudiantesEnt entidad)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {

                    var datos = context.Execute("InsertarGrupoEstudiantes",
                        new
                        {
                            entidad.IdUsuario,
                            entidad.IdGrupo
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
        [Route("UsuariosPorCursoMatriculado")]
        public IActionResult UsuariosPorCursoMatriculado(long idCurso)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<List<UsuarioEnt>>("UsuariosPorCursoMatriculado",
                        new { idCurso },
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
        [Route("ConsultarGrupos")]
        public IActionResult ConsultarGrupos()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<GrupoEnt>("ConsultarGrupos",
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

    }
}
