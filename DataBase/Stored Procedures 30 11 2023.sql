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