USE [master]
GO

CREATE DATABASE [Instituto]}

ALTER DATABASE [Instituto] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Instituto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Instituto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Instituto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Instituto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Instituto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Instituto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Instituto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Instituto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Instituto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Instituto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Instituto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Instituto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Instituto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Instituto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Instituto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Instituto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Instituto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Instituto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Instituto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Instituto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Instituto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Instituto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Instituto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Instituto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Instituto] SET  MULTI_USER 
GO
ALTER DATABASE [Instituto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Instituto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Instituto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Instituto] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Instituto] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Instituto] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Instituto', N'ON'
GO
ALTER DATABASE [Instituto] SET QUERY_STORE = ON
GO
ALTER DATABASE [Instituto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Instituto]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[IdBitacora] [bigint] IDENTITY(1,1) NOT NULL,
	[FechaHora] [datetime] NULL,
	[Mensaje] [varchar](5000) NULL,
	[Origen] [varchar](5000) NULL,
	[IdUsuario] [bigint] NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[IdCurso] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[IdCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estatus]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estatus](
	[IdEstatus] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
 CONSTRAINT [PK_Estatus] PRIMARY KEY CLUSTERED 
(
	[IdEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupo]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[IdGrupo] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEstatus] [bigint] NULL,
	[Descripcion] [varchar](50) NULL,
	[IdCurso] [bigint] NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GrupoEstudiantes]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GrupoEstudiantes](
	[IdGrupoE] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[IdGrupo] [bigint] NOT NULL,
 CONSTRAINT [PK_GrupoEstudiantes] PRIMARY KEY CLUSTERED 
(
	[IdGrupoE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[IdHorario] [bigint] IDENTITY(1,1) NOT NULL,
	[Dia] [varchar](50) NULL,
 CONSTRAINT [PK_Horario] PRIMARY KEY CLUSTERED 
(
	[IdHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[IdMatricula] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NULL,
	[IdCurso] [bigint] NULL,
	[IdModalidad] [bigint] NULL,
	[IdNivel] [bigint] NULL,
	[IdHorario] [bigint] NULL,
	[Monto] [decimal](10, 2) NULL,
	[FechaMatricula] [datetime] NULL,
	[DiaPago] [datetime] NULL,
	[Comentario] [varchar](500) NULL,
	[IdEstatus] [bigint] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[IdMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modalidad]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modalidad](
	[IdModalidad] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Modalidad] PRIMARY KEY CLUSTERED 
(
	[IdModalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NivelCurso]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NivelCurso](
	[IdNivelCurso] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_NivelCurso] PRIMARY KEY CLUSTERED 
(
	[IdNivelCurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreMatricula]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreMatricula](
	[IdPrematricula] [bigint] IDENTITY(1,1) NOT NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[Telefono] [varchar](15) NULL,
	[Nombre] [varchar](15) NULL,
	[Apellido1] [varchar](15) NULL,
	[Apellido2] [varchar](15) NULL,
	[IdCurso] [bigint] NULL,
	[IdModalidad] [bigint] NULL,
	[IdNivel] [bigint] NULL,
	[IdEstatus] [bigint] NULL,
	[FechaPrematricula] [datetime] NULL,
 CONSTRAINT [PK_PreMatricula] PRIMARY KEY CLUSTERED 
(
	[IdPrematricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[IdUsuarioModificacion] [bigint] NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](20) NULL,
	[Correo] [varchar](50) NULL,
	[Nombre] [varchar](15) NULL,
	[Apellido1] [varchar](15) NULL,
	[Apellido2] [varchar](15) NULL,
	[Telefono] [varchar](15) NULL,
	[Direccion] [varchar](100) NULL,
	[IdEstatus] [bigint] NULL,
	[IdRol] [bigint] NULL,
	[Usuario] [varchar](20) NULL,
	[PwUsuario] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaUltimaActividad] [datetime] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Grupo_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Grupo] CHECK CONSTRAINT [FK_Grupo_Curso]
GO
ALTER TABLE [dbo].[Grupo]  WITH CHECK ADD  CONSTRAINT [FK_Grupo_Estado] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[Estatus] ([IdEstatus])
GO
ALTER TABLE [dbo].[Grupo] CHECK CONSTRAINT [FK_Grupo_Estado]
GO
ALTER TABLE [dbo].[GrupoEstudiantes]  WITH CHECK ADD  CONSTRAINT [FK_Grupo_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[GrupoEstudiantes] CHECK CONSTRAINT [FK_Grupo_Usuario]
GO
ALTER TABLE [dbo].[GrupoEstudiantes]  WITH CHECK ADD  CONSTRAINT [FK_GrupoEstudiantes_Grupo] FOREIGN KEY([IdGrupo])
REFERENCES [dbo].[Grupo] ([IdGrupo])
GO
ALTER TABLE [dbo].[GrupoEstudiantes] CHECK CONSTRAINT [FK_GrupoEstudiantes_Grupo]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Curso]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Estatus] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[Estatus] ([IdEstatus])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Estatus]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Horario] FOREIGN KEY([IdHorario])
REFERENCES [dbo].[Horario] ([IdHorario])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Horario]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Modalidad] FOREIGN KEY([IdModalidad])
REFERENCES [dbo].[Modalidad] ([IdModalidad])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Modalidad]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_NivelCurso] FOREIGN KEY([IdNivel])
REFERENCES [dbo].[NivelCurso] ([IdNivelCurso])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_NivelCurso]
GO
ALTER TABLE [dbo].[PreMatricula]  WITH CHECK ADD  CONSTRAINT [FK_PreMatricula_Curso] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[PreMatricula] CHECK CONSTRAINT [FK_PreMatricula_Curso]
GO
ALTER TABLE [dbo].[PreMatricula]  WITH CHECK ADD  CONSTRAINT [FK_PreMatricula_Estatus] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[Estatus] ([IdEstatus])
GO
ALTER TABLE [dbo].[PreMatricula] CHECK CONSTRAINT [FK_PreMatricula_Estatus]
GO
ALTER TABLE [dbo].[PreMatricula]  WITH CHECK ADD  CONSTRAINT [FK_PreMatricula_Modalidad] FOREIGN KEY([IdModalidad])
REFERENCES [dbo].[Modalidad] ([IdModalidad])
GO
ALTER TABLE [dbo].[PreMatricula] CHECK CONSTRAINT [FK_PreMatricula_Modalidad]
GO
ALTER TABLE [dbo].[PreMatricula]  WITH CHECK ADD  CONSTRAINT [FK_PreMatricula_NivelCurso] FOREIGN KEY([IdNivel])
REFERENCES [dbo].[NivelCurso] ([IdNivelCurso])
GO
ALTER TABLE [dbo].[PreMatricula] CHECK CONSTRAINT [FK_PreMatricula_NivelCurso]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Estatus1] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[Estatus] ([IdEstatus])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Estatus1]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol1] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol1]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoUsuario]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEstadoUsuario]
    @IdUsuario bigint
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Usuario]
    SET [IdEstatus] = 2
    WHERE [IdUsuario] = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[ActualizarRolUsuario]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ActualizarRolUsuario]
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
/****** Object:  StoredProcedure [dbo].[ConsultarClientes]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarClientes]
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
/****** Object:  StoredProcedure [dbo].[ConsultarCursos]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarCursos]
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
/****** Object:  StoredProcedure [dbo].[ConsultarEstudiantesPorGrupo]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarEstudiantesPorGrupo]
    @IdGrupo bigint
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
        [dbo].[GrupoEstudiantes] GE ON U.[IdUsuario] = GE.[IdUsuario]
    WHERE
        GE.[IdGrupo] = @IdGrupo;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarGrupos]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarGrupos]
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
/****** Object:  StoredProcedure [dbo].[ConsultarHorarios]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarHorarios]
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
/****** Object:  StoredProcedure [dbo].[ConsultarModalidades]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarModalidades]
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
/****** Object:  StoredProcedure [dbo].[ConsultarNiveles]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarNiveles]
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
/****** Object:  StoredProcedure [dbo].[ConsultarRoles]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarRoles]
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuario]
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuariosMatriculados]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarUsuariosMatriculados]
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuariosPorRol]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarUsuariosPorRol]
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
/****** Object:  StoredProcedure [dbo].[EliminarMatriculaPorUsuario]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[EliminarMatriculaPorUsuario]
    @IdUsuario bigint
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Matricula]
    WHERE [IdUsuario] = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IniciarSesion]
    @Usuario varchar(20),
    @PwUsuario varchar(50)
AS
BEGIN
    SELECT *
    FROM [dbo].[Usuario]
    WHERE [Usuario] = @Usuario
    AND [PwUsuario] = @PwUsuario
	AND IdEstatus = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarGrupo]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertarGrupo]
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
/****** Object:  StoredProcedure [dbo].[InsertarGrupoEstudiantes]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertarGrupoEstudiantes]
    @IdUsuario bigint,
    @IdGrupo bigint
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[GrupoEstudiantes] ([IdUsuario], [IdGrupo])
    VALUES (@IdUsuario, @IdGrupo);
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarMatricula]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertarMatricula]
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
/****** Object:  StoredProcedure [dbo].[ListaUsuarios]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ListaUsuarios]
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
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarUsuario]
    @Correo VARCHAR(50),
	@Cedula VARCHAR(50),
    @Nombre VARCHAR(15),
    @Apellido1 VARCHAR(15),
    @Apellido2 VARCHAR(15),
    @Telefono VARCHAR(15),
    @Direccion VARCHAR(100),
    @IdEstatus BIGINT,
    @IdRol BIGINT,
    @Usuario VARCHAR(20),
    @PwUsuario VARCHAR(50)
AS
BEGIN
    INSERT INTO [dbo].[Usuario] (
        [Correo],
		[Cedula],
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
    )
    VALUES (
        @Correo,
		@Cedula,
        @Nombre,
        @Apellido1,
        @Apellido2,
        @Telefono,
        @Direccion,
        @IdEstatus,
        @IdRol,
        @Usuario,
        @PwUsuario,
        GETDATE(),
        GETDATE()
    );
END
GO
/****** Object:  StoredProcedure [dbo].[RestablecerClave]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RestablecerClave]
	@IdUsuario bigint,
	@Contrasenna varchar(25)
AS
BEGIN
	UPDATE [dbo].[Usuario]
   SET [PwUsuario] = @Contrasenna
 WHERE @IdUsuario = @IdUsuario;

END
GO
/****** Object:  StoredProcedure [dbo].[UsuariosPorCursoMatriculado]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UsuariosPorCursoMatriculado]
    @IdCurso bigint
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @Nombre varchar(50) = '';

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
        @Nombre AS [NombreRol]
    FROM
        [dbo].[Usuario] U
    INNER JOIN
        [dbo].[Matricula] M ON U.[IdUsuario] = M.[IdUsuario]
    WHERE
        M.[IdCurso] = @IdCurso;
END;
GO
/****** Object:  StoredProcedure [dbo].[VerificarCorreo]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VerificarCorreo]
    @Correo varchar(50)
AS
BEGIN
    SELECT *
    FROM [dbo].[Usuario]
    WHERE [Correo] =  @Correo;
END
GO
/****** Object:  StoredProcedure [dbo].[VerificarMatricula]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[VerificarMatricula]
    @IdUsuario bigint
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [dbo].[Matricula]
    WHERE [IdUsuario] = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[VerificarUsuarioPorGrupo]    Script Date: 04/12/2023 10:06:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[VerificarUsuarioPorGrupo]
    @IdUsuario bigint,
    @IdGrupo bigint
AS
BEGIN
    SET NOCOUNT ON;

	SELECT *
	FROM [dbo].[GrupoEstudiantes]
	WHERE [IdUsuario] = @IdUsuario
	AND [IdGrupo] = @IdGrupo

END;
GO
USE [master]
GO
ALTER DATABASE [Instituto] SET  READ_WRITE 
GO
