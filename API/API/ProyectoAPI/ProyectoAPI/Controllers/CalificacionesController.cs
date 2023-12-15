using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProyectoAPI.Entities;
using System.Data.SqlClient;
using System.Data;
using Dapper;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Runtime.CompilerServices;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CalificacionesController : ControllerBase
    {

        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public CalificacionesController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }

        [HttpPost]
        [AllowAnonymous]
        [Route("AgregarCalificaciones")]
        public IActionResult AgregarCalificaciones(CalificacionesEnt entidad)
        {
            try
            {
                var verificacionE = ValidarExistenciaCalificacion(entidad.IdUsuario, entidad.IdCurso);
                if (!verificacionE)
                {
                    return Ok(150);
                }

                using (var context = new SqlConnection(_connection))
                {
                    decimal nota = 0;
                    nota = (entidad.PrimerParcial + entidad.SegundoParcial + entidad.TercerParcial) / 3;
                    entidad.NotaFinal = nota;
                    var datos = context.Execute("AgregarCalificaciones",
                        new
                        {
                            entidad.IdUsuario,
                            entidad.IdCurso,
                            entidad.PrimerParcial,
                            entidad.SegundoParcial,
                            entidad.TercerParcial,
                            entidad.NotaFinal,
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
        [Route("ConsultarCalificaciones")]
        public IActionResult ConsultarCalificaciones()
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<CalificacionesEnt>("ConsultarCalificaciones",
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
        [Route("ValidarExistenciaCalificacion")]
        public bool ValidarExistenciaCalificacion(long IdUsuario, long IdCurso)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var result = context.ExecuteScalar<int>("ValidarExistenciaCalificacion", new { IdUsuario, IdCurso }, commandType: CommandType.StoredProcedure);

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
        [Route("ConsultarCursosPorUsuario")]
        public IActionResult ConsultarCursosPorUsuario(long IdUsuario)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<SelectListItem>("ConsultarCursosPorUsuario",
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

        [HttpGet]
        [AllowAnonymous]
        [Route("ConsultarCalificacionPorId")]
        public IActionResult ConsultarCalificacionPorId(long IdCalificacion)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<CalificacionesEnt>("ConsultarCalificacionPorId",
                        new { IdCalificacion },
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
        [Route("ConsultarCalificacionesPorUsuario")]
        public IActionResult ConsultarCalificacionesPorUsuario(long IdUsuario)
        {
            try
            {
                using (var context = new SqlConnection(_connection))
                {
                    var datos = context.Query<CalificacionesEnt>("ConsultarCalificacionesPorUsuario",
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

        [HttpPost]
        [AllowAnonymous]
        [Route("EditarCalificacion")]
        public IActionResult EditarCalificacion(CalificacionesEnt entidad)
        {
            try
            {

                using (var context = new SqlConnection(_connection))
                {
                    decimal nota = 0;
                    nota = (entidad.PrimerParcial + entidad.SegundoParcial + entidad.TercerParcial) / 3;
                    entidad.NotaFinal = nota;
                    var datos = context.Execute("EditarCalificacion",
                        new
                        {
                            entidad.IdUsuario,
                            entidad.IdCurso,
                            entidad.PrimerParcial,
                            entidad.SegundoParcial,
                            entidad.TercerParcial,
                            entidad.NotaFinal,
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

    }
}
