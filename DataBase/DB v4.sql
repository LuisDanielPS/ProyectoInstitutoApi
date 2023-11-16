USE [master]
GO
/****** Object:  Database [Instituto]    Script Date: 16/11/2023 17:11:21 ******/
CREATE DATABASE [Instituto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Instituto', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Instituto.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Instituto_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Instituto_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Instituto] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [Instituto] SET QUERY_STORE = ON
GO
ALTER DATABASE [Instituto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Instituto]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[Curso]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[Estatus]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[Grupo]    Script Date: 16/11/2023 17:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupo](
	[IdGrupo] [bigint] IDENTITY(1,1) NOT NULL,
	[IdEstatus] [bigint] NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[Matricula]    Script Date: 16/11/2023 17:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[IdMatricula] [bigint] IDENTITY(1,1) NOT NULL,
	[IdCliente] [bigint] NULL,
	[IdCurso] [bigint] NULL,
	[IdModalidad] [bigint] NULL,
	[IdNivel] [bigint] NULL,
	[IdHorario] [bigint] NULL,
	[Monto] [decimal](10, 2) NULL,
	[FechaMatricula] [datetime] NULL,
	[DiaPago] [int] NULL,
	[Comentario] [varchar](500) NULL,
	[IdEstatus] [bigint] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[IdMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modalidad]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[NivelCurso]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[PreMatricula]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/11/2023 17:11:21 ******/
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

INSERT [dbo].[Grupo] ([IdGrupo], [IdEstatus]) VALUES (1, 1)
INSERT [dbo].[Grupo] ([IdGrupo], [IdEstatus]) VALUES (2, 1)
INSERT [dbo].[Grupo] ([IdGrupo], [IdEstatus]) VALUES (3, 1)
SET IDENTITY_INSERT [dbo].[Grupo] OFF
GO
SET IDENTITY_INSERT [dbo].[Horario] ON 

INSERT [dbo].[Horario] ([IdHorario], [Dia]) VALUES (1, N'L - M 8AM/10:30AM')
INSERT [dbo].[Horario] ([IdHorario], [Dia]) VALUES (2, N'K - J 8AM/10:30AM')
INSERT [dbo].[Horario] ([IdHorario], [Dia]) VALUES (3, N'K - J 6PM/8:30PM')
SET IDENTITY_INSERT [dbo].[Horario] OFF
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([IdMatricula], [IdCliente], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10014, 116810507, 1, 2, 1, 1, CAST(500.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 1, N'Pagado', 1)
INSERT [dbo].[Matricula] ([IdMatricula], [IdCliente], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10015, 114410916, 2, 2, 2, 2, CAST(400.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 5, N'Hola Holaa', 1)
INSERT [dbo].[Matricula] ([IdMatricula], [IdCliente], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10016, 117020275, 1, 1, 1, 3, CAST(7800.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 10, N'pago', 1)
INSERT [dbo].[Matricula] ([IdMatricula], [IdCliente], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10017, 402610160, 1, 1, 2, 1, CAST(8400.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 7, N'Pago', 1)
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
SET IDENTITY_INSERT [dbo].[PreMatricula] ON 

INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (1, N'prueba@prueba.com', N'60504875', N'Daniel', N'Moreira', N'Rodriguez', 1, 1, 2, 2, CAST(N'2023-08-07T02:33:51.970' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (2, N'estebanmoreirar@gmail.com', N'45678912', N'Esteban', N'Moreira', N'Rodriguez', 2, 2, 1, 2, CAST(N'2023-08-07T03:00:26.243' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (4, N'prueba@prueba.com', N'60504875', N'Kimberly', N'Moreira', N'Rodriguez', 1, 2, 1, 2, CAST(N'2023-08-08T17:43:01.360' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (5, N'estebanmoreirar@gmail.com', N'60506812', N'Esteban', N'Moreira', N'Moreira', 1, 2, 1, 2, CAST(N'2023-08-22T16:49:58.300' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (6, N'estebanmoreirar@gmail.com', N'86960578', N'Esteban', N'Moreira', N'R', 1, 2, 1, 2, CAST(N'2023-08-22T18:46:05.077' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (7, N'estebanmoreirar@gmail.com', N'60506812', N'Esteban', N'guyighi', N'R', 1, 2, 2, 2, CAST(N'2023-09-20T21:13:23.320' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (8, N'estebanmoreirar@gmail.com', N'86960578', N'Esteban', N'MOREIRA', N'ROJAS', 1, 1, 1, 2, CAST(N'2023-09-24T21:27:14.330' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (9, N'estebanmoreirar@gmail.com', N'60506812', N'Kimberly', N'MENDOZA', N'ROJAS', 1, 2, 1, 2, CAST(N'2023-09-27T08:42:36.727' AS DateTime))
INSERT [dbo].[PreMatricula] ([IdPrematricula], [CorreoElectronico], [Telefono], [Nombre], [Apellido1], [Apellido2], [IdCurso], [IdModalidad], [IdNivel], [IdEstatus], [FechaPrematricula]) VALUES (10, N'estebanmoreirar@gmail.com', N'60506812', N'KIMBERLY', N'MENDOZA', N'CABEZAS', 2, 2, 2, 2, CAST(N'2023-09-27T18:56:32.870' AS DateTime))
SET IDENTITY_INSERT [dbo].[PreMatricula] OFF
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

INSERT [dbo].[Usuario] ([IdUsuario], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [Telefono], [Direccion], [IdEstatus], [IdRol], [Usuario], [PwUsuario], [FechaCreacion], [FechaUltimaActividad]) VALUES (56, N'116810507', N'emoreira10507@ufide.ac.cr', N'Esteban', N'Moreira', N'Rodriguez', N'60506812', N'Heredia', 1, 2, N'emore6812', N'HWm81/K2kHj24uiKq2EcXg==', CAST(N'2023-11-15T12:59:20.190' AS DateTime), CAST(N'2023-11-15T12:59:20.190' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [Telefono], [Direccion], [IdEstatus], [IdRol], [Usuario], [PwUsuario], [FechaCreacion], [FechaUltimaActividad]) VALUES (58, N'2444444', N'estebanmoreirar@gmail.com', N'Esteban', N'Moreira', N'Rodriguez', N'60506812', N'Heredia', 1, 2, N'emore6812', N'HWm81/K2kHj24uiKq2EcXg==', CAST(N'2023-11-16T17:09:59.523' AS DateTime), CAST(N'2023-11-16T17:09:59.523' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
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
/****** Object:  StoredProcedure [dbo].[ConsultarUsuario]    Script Date: 16/11/2023 17:11:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarUsuario]
	@usuario varchar(25)
AS
BEGIN
	SELECT [IdUsuario]
	  ,[Cedula]
      ,[Correo]
      ,[Nombre]
      ,[Apellido1]
      ,[Apellido2]
      ,[FechaNacimiento]
      ,[Telefono]
      ,[Direccion]
      ,[IdEstatus]
      ,[IdRol]
      ,[Usuario]
      ,[FechaCreacion]
      ,[FechaUltimaActividad]
  FROM [dbo].[Usuario]
  where [Usuario] = @usuario;

END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 16/11/2023 17:11:21 ******/
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
    AND [PwUsuario] = @PwUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  StoredProcedure [dbo].[RestablecerClave]    Script Date: 16/11/2023 17:11:21 ******/
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
/****** Object:  StoredProcedure [dbo].[VerificarCorreo]    Script Date: 16/11/2023 17:11:21 ******/
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
USE [master]
GO
ALTER DATABASE [Instituto] SET  READ_WRITE 
GO
