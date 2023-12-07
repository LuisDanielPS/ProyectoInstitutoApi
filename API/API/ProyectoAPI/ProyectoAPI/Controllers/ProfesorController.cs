using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ProyectoAPI.Entities;
using System;
using System.Data.SqlClient;
using System.Data;
using Dapper;
using System.Linq;

namespace ProyectoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProfesorController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUtilitarios _utilitarios;
        private string _connection;

        public ProfesorController(IConfiguration configuration, IUtilitarios utilitarios)
        {
            _configuration = configuration;
            _connection = _configuration.GetConnectionString("DefaultConnection");
            _utilitarios = utilitarios;
        }

        // POST: api/Profesor/RegistrarProfesor
        [HttpPost]
        [Route("RegistrarProfesor")]
        public IActionResult PostProfesor(ProfesorEnt profesor)
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    var parameters = new DynamicParameters(profesor);
                    var result = connection.Execute("sp_InsertarProfesor", parameters, commandType: CommandType.StoredProcedure);
                    return result > 0 ? Ok(result) : NotFound("Profesor no se pudo insertar.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET: api/Profesor/ListarProfesores
        [HttpGet]
        [Route("ListarProfesores")]
        public IActionResult GetProfesores()
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    var profesores = connection.Query<ProfesorEnt>("sp_ListarProfesores", commandType: CommandType.StoredProcedure).ToList();
                    return Ok(profesores);
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT: api/Profesor/ActualizarProfesor/5
        [HttpPut]
        [Route("ActualizarProfesor/{id}")]
        public IActionResult PutProfesor(long id, [FromBody] ProfesorEnt profesor)
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("IdProfesor", id);
                    parameters.AddDynamicParams(profesor);
                    var result = connection.Execute("sp_ActualizarProfesor", parameters, commandType: CommandType.StoredProcedure);
                    return result > 0 ? Ok(result) : NotFound("Profesor no encontrado o no se pudo actualizar.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE: api/Profesor/DesactivarProfesor/5
        [HttpDelete]
        [Route("DesactivarProfesor/{id}")]
        public IActionResult DeleteProfesor(long id)
        {
            try
            {
                using (var connection = new SqlConnection(_connection))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("IdProfesor", id);
                    var result = connection.Execute("sp_DesactivarProfesor", parameters, commandType: CommandType.StoredProcedure);
                    return result > 0 ? Ok(result) : NotFound("Profesor no encontrado o no se pudo desactivar.");
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
