USE [master]
GO
CREATE DATABASE [Instituto]
GO
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
/****** Object:  Table [dbo].[Bitacora]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Calificaciones]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[IdCalificacion] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[IdCurso] [bigint] NOT NULL,
	[PrimerParcial] [varchar](50) NULL,
	[SegundoParcial] [varchar](50) NULL,
	[TercerParcial] [varchar](50) NULL,
	[NotaFinal] [varchar](50) NULL,
 CONSTRAINT [PK_Calificaciones] PRIMARY KEY CLUSTERED 
(
	[IdCalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Estatus]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Grupo]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[GrupoEstudiantes]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Matricula]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Modalidad]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[NivelCurso]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Profesor]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[IdProfesor] [bigint] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido1] [varchar](50) NOT NULL,
	[Apellido2] [varchar](50) NULL,
	[Correo] [varchar](100) NOT NULL,
	[Telefono] [varchar](15) NULL,
	[Especializacion] [varchar](100) NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProfesor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/12/2023 17:55:08 ******/
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
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([IdCurso], [Nombre]) VALUES (1, N'Ingles')
INSERT [dbo].[Curso] ([IdCurso], [Nombre]) VALUES (2, N'Portuguese')
INSERT [dbo].[Curso] ([IdCurso], [Nombre]) VALUES (3, N'Lesco')
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Estatus] ON 

INSERT [dbo].[Estatus] ([IdEstatus], [Nombre]) VALUES (1, N'Activo')
INSERT [dbo].[Estatus] ([IdEstatus], [Nombre]) VALUES (2, N'Inactivo')
INSERT [dbo].[Estatus] ([IdEstatus], [Nombre]) VALUES (3, N'Aprobado')
INSERT [dbo].[Estatus] ([IdEstatus], [Nombre]) VALUES (4, N'Reprobado')
INSERT [dbo].[Estatus] ([IdEstatus], [Nombre]) VALUES (5, N'Al Dia')
INSERT [dbo].[Estatus] ([IdEstatus], [Nombre]) VALUES (6, N'Con Atraso')
SET IDENTITY_INSERT [dbo].[Estatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Grupo] ON 

INSERT [dbo].[Grupo] ([IdGrupo], [IdEstatus], [Descripcion], [IdCurso]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[Grupo] ([IdGrupo], [IdEstatus], [Descripcion], [IdCurso]) VALUES (2, 1, NULL, NULL)
INSERT [dbo].[Grupo] ([IdGrupo], [IdEstatus], [Descripcion], [IdCurso]) VALUES (3, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Grupo] OFF
GO
SET IDENTITY_INSERT [dbo].[Horario] ON 

INSERT [dbo].[Horario] ([IdHorario], [Dia]) VALUES (1, N'L - M 8AM/10:30AM')
INSERT [dbo].[Horario] ([IdHorario], [Dia]) VALUES (2, N'K - J 8AM/10:30AM')
INSERT [dbo].[Horario] ([IdHorario], [Dia]) VALUES (3, N'K - J 6PM/8:30PM')
SET IDENTITY_INSERT [dbo].[Horario] OFF
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([IdMatricula], [IdUsuario], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (2, 3, 2, 1, 1, 1, CAST(97648.00 AS Decimal(10, 2)), CAST(N'2023-12-12T04:04:48.483' AS DateTime), CAST(N'2024-02-12T04:04:48.483' AS DateTime), N'Pago', 1)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
GO
SET IDENTITY_INSERT [dbo].[Modalidad] ON 

INSERT [dbo].[Modalidad] ([IdModalidad], [Nombre]) VALUES (1, N'Virtual')
INSERT [dbo].[Modalidad] ([IdModalidad], [Nombre]) VALUES (2, N'Prescencial')
SET IDENTITY_INSERT [dbo].[Modalidad] OFF
GO
SET IDENTITY_INSERT [dbo].[NivelCurso] ON 

INSERT [dbo].[NivelCurso] ([IdNivelCurso], [Nombre]) VALUES (1, N'Intensivo')
INSERT [dbo].[NivelCurso] ([IdNivelCurso], [Nombre]) VALUES (2, N'Semi-Intensivo')
SET IDENTITY_INSERT [dbo].[NivelCurso] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [Nombre], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (1, N'Administrador', 1, CAST(N'2023-07-20T23:23:52.957' AS DateTime), CAST(N'2023-07-20T23:23:52.957' AS DateTime))
INSERT [dbo].[Rol] ([IdRol], [Nombre], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (2, N'Usuario', 1, CAST(N'2023-07-21T17:42:26.377' AS DateTime), CAST(N'2023-07-22T20:57:55.303' AS DateTime))
INSERT [dbo].[Rol] ([IdRol], [Nombre], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (3, N'Cliente', 1, CAST(N'2023-07-22T21:29:04.390' AS DateTime), CAST(N'2023-07-22T21:29:04.390' AS DateTime))
INSERT [dbo].[Rol] ([IdRol], [Nombre], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (5, N'Profesor', 0, CAST(N'2023-09-23T12:25:38.273' AS DateTime), CAST(N'2023-09-23T12:25:38.273' AS DateTime))
INSERT [dbo].[Rol] ([IdRol], [Nombre], [IdUsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (6, N'Oficina', 0, CAST(N'2023-09-23T12:26:30.173' AS DateTime), CAST(N'2023-09-23T12:26:30.173' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [Telefono], [Direccion], [IdEstatus], [IdRol], [Usuario], [PwUsuario], [FechaCreacion], [FechaUltimaActividad]) VALUES (3, N'116810507', N'emoreira10507@ufide.ac.cr', N'ESTEBAN', N'MOREIRA', N'RODRIGUEZ', N'60506812', N'Carta', 1, 1, N'emore6812', N'HWm81/K2kHj24uiKq2EcXg==', CAST(N'2023-12-11T23:13:28.737' AS DateTime), CAST(N'2023-12-11T23:13:28.737' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [Telefono], [Direccion], [IdEstatus], [IdRol], [Usuario], [PwUsuario], [FechaCreacion], [FechaUltimaActividad]) VALUES (4, N'402310609', N'emoreira10507@ufide.ac.c', N'KIMBERLY', N'MENDOZA', N'CABEZAS', N'60506812', N'Heredia', 2, 2, N'kmend6812', N'HWm81/K2kHj24uiKq2EcXg==', CAST(N'2023-12-12T04:28:23.790' AS DateTime), CAST(N'2023-12-12T04:28:23.790' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Profesor__60695A19A7F14194]    Script Date: 12/12/2023 04:31:06 ******/
ALTER TABLE [dbo].[Profesor] ADD UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Profesor__B4ADFE38FB41F312]    Script Date: 12/12/2023 04:31:06 ******/
ALTER TABLE [dbo].[Profesor] ADD UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Profesor] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Profesor] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Cursor] FOREIGN KEY([IdCurso])
REFERENCES [dbo].[Curso] ([IdCurso])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Cursor]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Usuario]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol1] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol1]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarContrasena]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarContrasena]
	@IdUsuario bigint,
	@PwUsuarioAnterior varchar(50),
	@PwUsuario varchar(50)
AS
BEGIN
	IF EXISTS(SELECT IdUsuario
			  FROM dbo.Usuario
			  WHERE IdUsuario = @IdUsuario
			  AND PwUsuario = @PwUsuarioAnterior)
	BEGIN
		UPDATE dbo.Usuario
		SET PwUsuario = @PwUsuario
		WHERE IdUsuario = @IdUsuario
	END
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoUsuario]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ActualizarEstadoUsuario]
    @IdUsuario bigint
AS
BEGIN

    UPDATE [dbo].[Usuario]
    SET [IdEstatus] = (Case When IdEstatus =1 then 2 else 1 end)
    WHERE [IdUsuario] = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarRolUsuario]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[AgregarCalificaciones]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[AgregarCalificaciones]
    @IdUsuario bigint,
    @IdCurso bigint,
    @PrimerParcial varchar(50),
    @SegundoParcial varchar(50),
    @TercerParcial varchar(50),
    @NotaFinal varchar(50)
AS
BEGIN

    INSERT INTO [dbo].[Calificaciones] (
        [IdUsuario],
        [IdCurso],
        [PrimerParcial],
        [SegundoParcial],
        [TercerParcial],
        [NotaFinal]
    )
    VALUES (
        @IdUsuario,
        @IdCurso,
        @PrimerParcial,
        @SegundoParcial,
        @TercerParcial,
        @NotaFinal
    );
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCalificaciones]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarCalificaciones]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        C.[IdCalificacion],
        U.[IdUsuario],
        U.[Nombre] + ' ' + U.[Apellido1] + ' ' + U.[Apellido2] AS [nombreUsuario],
        C.[IdCurso],
        CRS.[Nombre] AS [nombreCurso],
        C.[PrimerParcial],
        C.[SegundoParcial],
        C.[TercerParcial],
        C.[NotaFinal]
    FROM
        [dbo].[Calificaciones] C
    INNER JOIN
        [dbo].[Usuario] U ON C.[IdUsuario] = U.[IdUsuario]
    INNER JOIN
        [dbo].[Curso] CRS ON C.[IdCurso] = CRS.[IdCurso];
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCalificacionesPorUsuario]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarCalificacionesPorUsuario]
    @IdUsuario bigint
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        C.[IdCalificacion],
        C.[IdUsuario],
        C.[IdCurso],
        C.[PrimerParcial],
        C.[SegundoParcial],
        C.[TercerParcial],
        C.[NotaFinal],
        Cu.[Nombre] AS [nombreCurso]
    FROM
        [dbo].[Calificaciones] AS C
    INNER JOIN
        [dbo].[Curso] AS Cu ON C.[IdCurso] = Cu.[IdCurso]
    WHERE
        C.[IdUsuario] = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCalificacionPorId]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarCalificacionPorId]
    @IdCalificacion bigint
AS
BEGIN

    SELECT
        [IdCalificacion],
        [IdUsuario],
        [IdCurso],
        [PrimerParcial],
        [SegundoParcial],
        [TercerParcial],
        [NotaFinal]
    FROM
        [dbo].[Calificaciones]
    WHERE
        [IdCalificacion] = @IdCalificacion;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarClientes]    Script Date: 14/12/2023 17:55:08 ******/
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
		[IdEstatus] = 1 AND IdRol = 3;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCursos]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarCursosPorUsuario]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarCursosPorUsuario]
    @IdUsuario bigint
AS
BEGIN

    SELECT
        M.[IdCurso] 'Value',
        C.[Nombre] 'Text'
    FROM
        [dbo].[Matricula] M
    INNER JOIN
        [dbo].[Curso] C ON M.[IdCurso] = C.[IdCurso]
    WHERE
        M.[IdUsuario] = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEstudiantesPorGrupo]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarGrupos]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarHorarios]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarModalidades]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarNiveles]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarRoles]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 14/12/2023 17:55:08 ******/
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
  where [idUsuario] = @idUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuariosMatriculados]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuariosPorRol]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarUsuariosPorRol]
AS
BEGIN
    SET NOCOUNT ON;

SELECT
    [IdUsuario] AS 'Value',
    Cedula + ' ' + [Nombre] + ' ' + [Apellido1] + ' ' + [Apellido2] AS 'Text'
FROM
    [dbo].[Usuario]
WHERE
    [IdEstatus] = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditarCalificacion]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[EditarCalificacion]
    @IdUsuario bigint,
    @IdCurso bigint,
    @PrimerParcial varchar(50),
    @SegundoParcial varchar(50),
    @TercerParcial varchar(50),
    @NotaFinal varchar(50)
AS
BEGIN

    UPDATE [dbo].[Calificaciones]
    SET
        [PrimerParcial] = @PrimerParcial,
        [SegundoParcial] = @SegundoParcial,
        [TercerParcial] = @TercerParcial,
        [NotaFinal] = @NotaFinal
    WHERE
        [IdUsuario] = @IdUsuario
        AND [IdCurso] = @IdCurso;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditarUsuario]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditarUsuario]
	@IdUsuario bigint,
	@Cedula varchar(20),
	@Correo varchar(50),
	@Nombre varchar(15),
	@Apellido1 varchar(15),
	@Apellido2 varchar(15),
	@Telefono varchar(15),
	@Direccion varchar(100)
AS
BEGIN
	UPDATE [dbo].[Usuario]
   SET [Cedula] = @Cedula
      ,[Correo] = @Correo
      ,[Nombre] = @Nombre
      ,[Apellido1] = @Apellido1
      ,[Apellido2] = @Apellido2
      ,[Telefono] = @Telefono
      ,[Direccion] = @Direccion
 WHERE IdUsuario = @IdUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarMatriculaPorUsuario]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarGrupo]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarGrupoEstudiantes]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertarMatricula]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ListaUsuarios]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ListaUsuarios]
	@IdUsuario BIGINT
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
		IdUsuario != @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[RestablecerClave]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_ActivarProfesor]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActivarProfesor]
    @IdProfesor BIGINT
AS
BEGIN
    UPDATE Profesor SET Activo = 1 WHERE IdProfesor = @IdProfesor
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ActualizarProfesor]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ActualizarProfesor]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_DesactivarProfesor]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DesactivarProfesor]
    @IdProfesor BIGINT
AS
BEGIN
    UPDATE Profesor SET Activo = 0 WHERE IdProfesor = @IdProfesor
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProfesor]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertarProfesor]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarProfesores]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ListarProfesores]
AS
BEGIN
    SELECT * FROM Profesor WHERE Activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[UsuariosPorCursoMatriculado]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidarExistenciaCalificacion]    Script Date: 14/12/2023 17:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ValidarExistenciaCalificacion]
    @IdUsuario bigint,
    @IdCurso bigint
AS
BEGIN

    SELECT *
    FROM [dbo].[Calificaciones]
    WHERE [IdUsuario] = @IdUsuario
    AND [IdCurso] = @IdCurso
END;
GO
/****** Object:  StoredProcedure [dbo].[VerificarCorreo]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[VerificarMatricula]    Script Date: 14/12/2023 17:55:08 ******/
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
/****** Object:  StoredProcedure [dbo].[VerificarUsuarioPorGrupo]    Script Date: 14/12/2023 17:55:08 ******/
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
