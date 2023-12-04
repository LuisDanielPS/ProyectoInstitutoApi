CREATE OR ALTER PROCEDURE [dbo].[ListaUsuarios]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        U.[IdUsuario],
        U.[Cedula],
        U.[Correo],
        U.[Nombre],
        U.[Apellido1],
        U.[Apellido2],
        U.[Telefono],
        U.[Direccion],
        U.[IdEstatus],
        U.[IdRol],
        U.[Usuario],
        U.[PwUsuario],
        U.[FechaCreacion],
        U.[FechaUltimaActividad],
        R.[Nombre] AS [NombreRol]
    FROM
        [dbo].[Usuario] U
    INNER JOIN
        [dbo].[Rol] R ON U.[IdRol] = R.[IdRol]
    WHERE
        U.[IdEstatus] = 1;
END;
GO

CREATE or ALTER PROCEDURE [dbo].[ConsultarRoles]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdRol] 'Value',
        [Nombre] 'Text'
    FROM
        [dbo].[Rol];
END;
GO

CREATE or ALTER PROCEDURE [dbo].[ActualizarRolUsuario]
    @IdUsuario bigint,
    @IdRol bigint
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Usuario]
    SET [IdRol] = @IdRol
    WHERE [IdUsuario] = @IdUsuario;
END;
GO

ALTER PROCEDURE [dbo].[ConsultarUsuario]
	@idUsuario bigint
AS
BEGIN
	SELECT [IdUsuario]
	  ,[Cedula]
      ,[Correo]
      ,[Nombre]
      ,[Apellido1]
      ,[Apellido2]
      ,[Telefono]
      ,[Direccion]
      ,[IdEstatus]
      ,[IdRol]
      ,[Usuario]
      ,[FechaCreacion]
      ,[FechaUltimaActividad]
  FROM [dbo].[Usuario]
  where [idUsuario] = @idUsuario;

END
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarUsuariosPorRol]
    @IdRol bigint
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdUsuario],
        [Cedula],
        [Correo],
        [Nombre],
        [Apellido1],
        [Apellido2],
        [Telefono],
        [Direccion],
        [IdEstatus],
        [IdRol],
        [Usuario],
        [PwUsuario],
        [FechaCreacion],
        [FechaUltimaActividad]
    FROM
        [dbo].[Usuario]
    WHERE
        [IdRol] = @IdRol;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertarMatricula]
    @IdUsuario bigint,
    @IdCurso bigint,
    @IdModalidad bigint,
    @IdNivel bigint,
    @IdHorario bigint,
    @Monto decimal(10, 2),
    @Comentario varchar(500)
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @FechaMatricula datetime = GETDATE();
    DECLARE @DiaPago datetime = DATEADD(MONTH, 2, GETDATE());
    DECLARE @IdEstatus bigint = 1;

    INSERT INTO [dbo].[Matricula] (
        [IdUsuario],
        [IdCurso],
        [IdModalidad],
        [IdNivel],
        [IdHorario],
        [Monto],
        [FechaMatricula],
        [DiaPago],
        [Comentario],
        [IdEstatus]
    )
    VALUES (
        @IdUsuario,
        @IdCurso,
        @IdModalidad,
        @IdNivel,
        @IdHorario,
        @Monto,
        @FechaMatricula,
        @DiaPago,
        @Comentario,
        @IdEstatus
    );
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarCursos]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdCurso] 'Value',
        [Nombre] 'Text'
    FROM
        [dbo].[Curso];
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarModalidades]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdModalidad] 'Value',
        [Nombre] 'Text'
    FROM
        [dbo].[Modalidad];
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarNiveles]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdNivelCurso] 'Value',
        [Nombre] 'Text'
    FROM
        [dbo].[NivelCurso];
END;
GO


CREATE OR ALTER PROCEDURE [dbo].[ConsultarHorarios]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdHorario] 'Value',
        [Dia] 'Text'
    FROM
        [dbo].[Horario];
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarUsuariosPorRol]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdUsuario] 'Value',
        [Usuario] 'Text'
    FROM
        [dbo].[Usuario]
    WHERE
		[IdEstatus] = 1 AND
        [IdRol] = 3;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[VerificarMatricula]
    @IdUsuario bigint
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[Matricula]
    WHERE [IdUsuario] = @IdUsuario;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarClientes]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [IdUsuario],
        [Cedula],
        [Correo],
        [Nombre],
        [Apellido1],
        [Apellido2],
        [Telefono],
        [Direccion],
        [IdEstatus],
        [IdRol],
        [Usuario],
        [PwUsuario],
        [FechaCreacion],
        [FechaUltimaActividad]
    FROM
        [dbo].[Usuario]
    WHERE
		[IdEstatus] = 1 AND
        [IdRol] = 3;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarUsuariosMatriculados]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
		U.[IdUsuario],
        U.[Usuario],
        U.[Nombre],
        U.[Apellido1],
        U.[Apellido2],
        U.[Cedula],
        M.[FechaMatricula],
        M.[DiaPago],
        C.[Nombre] AS Curso,
        MD.[Nombre] AS Modalidad,
        NC.[Nombre] AS Nivel,
        H.[Dia] AS Horario
    FROM
        [dbo].[Usuario] U
    INNER JOIN
        [dbo].[Matricula] M ON U.[IdUsuario] = M.[IdUsuario]
    INNER JOIN
        [dbo].[Curso] C ON M.[IdCurso] = C.[IdCurso]
    INNER JOIN
        [dbo].[Modalidad] MD ON M.[IdModalidad] = MD.[IdModalidad]
    INNER JOIN
        [dbo].[NivelCurso] NC ON M.[IdNivel] = NC.[IdNivelCurso]
    INNER JOIN
        [dbo].[Horario] H ON M.[IdHorario] = H.[IdHorario];
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[EliminarMatriculaPorUsuario]
    @IdUsuario bigint
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Matricula]
    WHERE [IdUsuario] = @IdUsuario;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertarGrupo]
    @IdEstatus bigint,
    @Descripcion varchar(50),
    @IdCurso bigint
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Grupo] ([IdEstatus], [Descripcion], [IdCurso])
    VALUES (@IdEstatus, @Descripcion, @IdCurso);
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[InsertarGrupoEstudiantes]
    @IdUsuario bigint,
    @IdGrupo bigint
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[GrupoEstudiantes] ([IdUsuario], [IdGrupo])
    VALUES (@IdUsuario, @IdGrupo);
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[UsuariosPorCursoMatriculado]
    @IdCurso bigint
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        U.[IdUsuario],
        U.[Cedula],
        U.[Correo],
        U.[Nombre],
        U.[Apellido1],
        U.[Apellido2],
        U.[Telefono],
        U.[Direccion],
        U.[IdEstatus],
        U.[IdRol],
        U.[Usuario],
        U.[FechaCreacion],
        U.[FechaUltimaActividad]
    FROM
        [dbo].[Usuario] U
    INNER JOIN
        [dbo].[Matricula] M ON U.[IdUsuario] = M.[IdUsuario]
    WHERE
        M.[IdCurso] = @IdCurso;
END;
GO

CREATE OR ALTER PROCEDURE [dbo].[ConsultarGrupos]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        G.[IdGrupo],
        G.[IdEstatus],
        G.[Descripcion],
		G.[IdCurso],
        C.[Nombre] AS NombreCurso
    FROM
        [dbo].[Grupo] G
    INNER JOIN
        [dbo].[Curso] C ON G.[IdCurso] = C.[IdCurso];
END;
GO
