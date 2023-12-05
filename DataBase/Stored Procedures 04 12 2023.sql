CREATE TABLE Profesor (
    IdProfesor BIGINT IDENTITY(1,1) PRIMARY KEY,
    Cedula VARCHAR(20) UNIQUE NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50),
    Correo VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(15),
    Especializacion VARCHAR(100),
    Activo BIT NOT NULL DEFAULT 1, -- 1 para activo, 0 para inactivo
    FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
    FechaModificacion DATETIME
);

CREATE PROCEDURE sp_InsertarProfesor
    @Cedula VARCHAR(20),
    @Nombre VARCHAR(50),
    @Apellido1 VARCHAR(50),
    @Apellido2 VARCHAR(50),
    @Correo VARCHAR(100),
    @Telefono VARCHAR(15),
    @Especializacion VARCHAR(100)
AS
BEGIN
    INSERT INTO Profesor(Cedula, Nombre, Apellido1, Apellido2, Correo, Telefono, Especializacion)
    VALUES(@Cedula, @Nombre, @Apellido1, @Apellido2, @Correo, @Telefono, @Especializacion)
END

CREATE PROCEDURE sp_ActualizarProfesor
    @IdProfesor BIGINT,
    @Nombre VARCHAR(50),
    @Apellido1 VARCHAR(50),
    @Apellido2 VARCHAR(50),
    @Correo VARCHAR(100),
    @Telefono VARCHAR(15),
    @Especializacion VARCHAR(100),
    @Activo BIT
AS
BEGIN
    UPDATE Profesor
    SET Nombre = @Nombre,
        Apellido1 = @Apellido1,
        Apellido2 = @Apellido2,
        Correo = @Correo,
        Telefono = @Telefono,
        Especializacion = @Especializacion,
        Activo = @Activo,
        FechaModificacion = GETDATE()
    WHERE IdProfesor = @IdProfesor
END

CREATE PROCEDURE sp_ListarProfesores
AS
BEGIN
    SELECT * FROM Profesor WHERE Activo = 1
END

CREATE PROCEDURE sp_DesactivarProfesor
    @IdProfesor BIGINT
AS
BEGIN
    UPDATE Profesor SET Activo = 0 WHERE IdProfesor = @IdProfesor
END

CREATE PROCEDURE sp_ActivarProfesor
    @IdProfesor BIGINT
AS
BEGIN
    UPDATE Profesor SET Activo = 1 WHERE IdProfesor = @IdProfesor
END




