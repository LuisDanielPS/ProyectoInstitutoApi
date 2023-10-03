

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
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [bigint] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](20) NULL,
	[Correo] [varchar](50) NULL,
	[Nombre] [varchar](15) NULL,
	[Apellido1] [varchar](15) NULL,
	[Apellido2] [varchar](15) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Telefono] [varchar](15) NULL,
	[Direccion] [varchar](100) NULL,
	[IdEstatus] [bigint] NULL,
	[IdRol] [bigint] NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[Estatus]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[Grupo]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[Horario]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[Matricula]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[IdMatricula] [bigint] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](20) NULL,
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
/****** Object:  Table [dbo].[Modalidad]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[NivelCurso]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[Oficina]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oficina](
	[IdOficina] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NULL,
	[Apellido1] [varchar](15) NULL,
	[Apellido2] [varchar](15) NULL,
	[IdUsuario] [bigint] NULL,
	[Telefono] [varchar](15) NULL,
	[IdEstatus] [bigint] NULL,
	[Correo] [varchar](50) NULL,
	[IdUsuarioModificacion] [bigint] NULL,
	[FechaCreacion] [datetime] NULL,
	[FechaModificacion] [datetime] NULL,
	[IdRol] [bigint] NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[IdOficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreMatricula]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 27/9/2023 19:18:03 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Usuario] [varchar](15) NULL,
	[PwUsuario] [varchar](50) NULL,
	[IdCliente] [varchar](20) NULL,
	[IdRol] [bigint] NULL,
	[FechaCreacion] [datetime] NULL,
	[IdEstatus] [bigint] NULL,
	[FechaUltimaActividad] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [FechaNacimiento], [Telefono], [Direccion], [IdEstatus], [IdRol]) VALUES (41, N'116810507', N'estebanmoreirar@gmail.com', N'ESTEBAN', N'MOREIRA', N'RODRIGUEZ', CAST(N'1997-06-26T20:33:00.000' AS DateTime), N'60506812', N'Heredia', 1, 1)
INSERT [dbo].[Cliente] ([IdCliente], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [FechaNacimiento], [Telefono], [Direccion], [IdEstatus], [IdRol]) VALUES (42, N'114410916', N'bsanabria10916@ufide.ac.cr', N'BRYAN', N'SANABRIA', N'JIMENEZ', CAST(N'2023-09-12T20:35:00.000' AS DateTime), N'12345678', N'asdad', 1, 1)
INSERT [dbo].[Cliente] ([IdCliente], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [FechaNacimiento], [Telefono], [Direccion], [IdEstatus], [IdRol]) VALUES (43, N'402610160', N'abriceno10160@ufide.ac.cr', N'ALEXIA', N'BRICENO', N'BARRANTES', CAST(N'2023-09-04T20:36:00.000' AS DateTime), N'12345678', N'asdf', 1, 1)
INSERT [dbo].[Cliente] ([IdCliente], [Cedula], [Correo], [Nombre], [Apellido1], [Apellido2], [FechaNacimiento], [Telefono], [Direccion], [IdEstatus], [IdRol]) VALUES (44, N'117020275', N'sfajardo20275@ufide.ac.cr', N'SARAY', N'FAJARDO', N'GRIJALBA', CAST(N'2023-09-06T20:37:00.000' AS DateTime), N'12345678', N'asdasd', 1, 1)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
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

INSERT [dbo].[Matricula] ([IdMatricula], [Cedula], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10014, N'116810507', 1, 2, 1, 1, CAST(500.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 1, N'Pagado', 1)
INSERT [dbo].[Matricula] ([IdMatricula], [Cedula], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10015, N'114410916', 2, 2, 2, 2, CAST(400.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 5, N'Hola Holaa', 1)
INSERT [dbo].[Matricula] ([IdMatricula], [Cedula], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10016, N'117020275', 1, 1, 1, 3, CAST(7800.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 10, N'pago', 1)
INSERT [dbo].[Matricula] ([IdMatricula], [Cedula], [IdCurso], [IdModalidad], [IdNivel], [IdHorario], [Monto], [FechaMatricula], [DiaPago], [Comentario], [IdEstatus]) VALUES (10017, N'402610160', 1, 1, 2, 1, CAST(8400.00 AS Decimal(10, 2)), CAST(N'2023-09-27T00:00:00.000' AS DateTime), 7, N'Pago', 1)
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

INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [PwUsuario], [IdCliente], [IdRol], [FechaCreacion], [IdEstatus], [FechaUltimaActividad]) VALUES (38, N'emoreira', N'EZM+Ob0/F6l8ayXVeYaRzA==', N'41', 1, CAST(N'2023-09-20T20:33:19.800' AS DateTime), 1, CAST(N'2023-09-27T18:56:54.460' AS DateTime))
INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [PwUsuario], [IdCliente], [IdRol], [FechaCreacion], [IdEstatus], [FechaUltimaActividad]) VALUES (39, N'bsanabria', N'S7FlitIbM9s=', N'42', 1, CAST(N'2023-09-20T20:35:36.110' AS DateTime), 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [PwUsuario], [IdCliente], [IdRol], [FechaCreacion], [IdEstatus], [FechaUltimaActividad]) VALUES (40, N'abriceno', N'COzsQhjdWlw=', N'43', 1, CAST(N'2023-09-20T20:36:44.943' AS DateTime), 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [Usuario], [PwUsuario], [IdCliente], [IdRol], [FechaCreacion], [IdEstatus], [FechaUltimaActividad]) VALUES (41, N'sfajardo', N'KGJMdR6ugh4=', N'44', 1, CAST(N'2023-09-20T20:37:37.467' AS DateTime), 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Oficina]  WITH CHECK ADD  CONSTRAINT [FK_Oficina_Estatus] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[Estatus] ([IdEstatus])
GO
ALTER TABLE [dbo].[Oficina] CHECK CONSTRAINT [FK_Oficina_Estatus]
GO
ALTER TABLE [dbo].[Oficina]  WITH CHECK ADD  CONSTRAINT [FK_Oficina_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Oficina] CHECK CONSTRAINT [FK_Oficina_Rol]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCliente]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarCliente]
	@IdCliente BIGINT
AS
BEGIN
	Select * from Cliente
	Where IdCliente = @IdCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarClientes]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarClientes] 
	
AS
BEGIN
	SELECT C.IdCliente, M.Cedula, C.Nombre, C.Telefono, U.Nombre as Curso, X.Nombre as Modalidad, N.Nombre as Nivel, M.FechaMatricula as Fecha, E.Nombre as Estatus
	FROM Matricula as M
	JOIN Cliente as C on C.Cedula = M.Cedula
	LEFT JOIN Curso as U on U.IdCurso = M.IdCurso
	LEFT JOIN Modalidad as X on X.IdModalidad = M.IdModalidad
	LEFT JOIN NivelCurso as N on N.IdNivelCurso = M.IdNivel
	LEFT JOIN Estatus as E on E.IdEstatus = M.IdEstatus
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCursos]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarCursos]
AS
BEGIN
	select * from Curso;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarEstatus]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ConsultarEstatus]
AS
BEGIN
	Select * from Estatus;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarGrupos]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ConsultarGrupos]
AS
BEGIN
	select * from Grupo;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarHorarios]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[ConsultarHorarios]
AS
BEGIN
	select * from Horario;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMatricula]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarMatricula]
	@IdMatricula BIGINT
AS
BEGIN
	SELECT M.IdMatricula, M.Cedula, C.Nombre, M.IdCurso, M.IdModalidad, M.IdNivel, M.IdHorario, M.Monto, M.FechaMatricula, M.DiaPago, M.Comentario, M.IdEstatus
	FROM Matricula as M
	JOIN Cliente as C on C.Cedula = M.Cedula
	LEFT JOIN Curso as U on U.IdCurso = M.IdCurso
	LEFT JOIN Modalidad as X on X.IdModalidad = M.IdModalidad
	LEFT JOIN Horario as H on H.IdHorario = M.IdHorario
	LEFT JOIN NivelCurso as N on N.IdNivelCurso = M.IdNivel
	where M.IdMatricula = @IdMatricula
		OR M.Cedula = @IdMatricula;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarMatriculas]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarMatriculas]
	
AS
BEGIN
	SELECT M.IdMatricula, M.Cedula, C.Nombre, C.Telefono, U.Nombre as Curso, X.Nombre as Modalidad, N.Nombre as Nivel, M.Monto, M.FechaMatricula as Fecha, E.Nombre as Estatus
	FROM Matricula as M
	JOIN Cliente as C on C.Cedula = M.Cedula
	LEFT JOIN Curso as U on U.IdCurso = M.IdCurso
	LEFT JOIN Modalidad as X on X.IdModalidad = M.IdModalidad
	LEFT JOIN NivelCurso as N on N.IdNivelCurso = M.IdNivel
	LEFT JOIN Estatus as E on E.IdEstatus = M.IdEstatus

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarModalidad]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarModalidad]
AS
BEGIN
	select * from Modalidad;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarNivel]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarNivel]
AS
BEGIN
	select * from NivelCurso;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarPreMatricula]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ConsultarPreMatricula]
AS
BEGIN

SELECT PreMatricula.IdPrematricula, PreMatricula.CorreoElectronico, PreMatricula.Telefono, PreMatricula.FechaPrematricula as Fecha,
		PreMatricula.Nombre, PreMatricula.Apellido1, PreMatricula.Apellido2, Curso.Nombre as Curso, 
		Modalidad.Nombre as Modalidad, NivelCurso.Nombre as Nivel, Estatus.Nombre as Estatus
FROM PreMatricula
JOIN Curso ON Curso.IdCurso = PreMatricula.IdCurso
JOIN Modalidad ON Modalidad.IdModalidad = PreMatricula.IdModalidad
JOIN NivelCurso ON NivelCurso.IdNivelCurso = PreMatricula.IdNivel
JOIN Estatus ON Estatus.IdEstatus = PreMatricula.IdEstatus
where PreMatricula.IdEstatus = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarioId]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuarioId]
    @IdUsuario BIGINT
AS
BEGIN
    SELECT
        C.cedula,
        C.correo,
        C.Nombre,
        C.Apellido1,
        C.Apellido2,
        C.FechaNacimiento,
        C.Telefono,
		C.Direccion,
		U.IdEstatus,
        U.Usuario,
        U.IdUsuario,
        R.Nombre AS Rol
    FROM
        Usuario U
    INNER JOIN
        Cliente C ON U.IdCliente = C.IdCliente
    INNER JOIN
        Rol R ON U.IdRol = R.IdRol
    WHERE
        U.IdUsuario = @IdUsuario;
END;
GO
/****** Object:  StoredProcedure [dbo].[ConsultarUsuarios]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarUsuarios]
AS
BEGIN
	
	SELECT
    C.cedula,
    C.correo,
    C.Nombre,
    C.Apellido1,
    C.Apellido2,
    C.FechaNacimiento,
    C.Telefono,
    U.Usuario,
	U.IdUsuario,
    R.Nombre AS Rol
	FROM
		Usuario U
	INNER JOIN
		Cliente C ON U.IdCliente = C.IdCliente
	INNER JOIN
		Rol R ON U.IdRol = R.IdRol;
END
GO
/****** Object:  StoredProcedure [dbo].[CREAR_ROL]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREAR_ROL]
	@Nombre VARCHAR(20),
	@IdUsuario BIGINT
AS
BEGIN
	INSERT INTO [dbo].[Rol]
           ([Nombre]
           ,[IdUsuarioModificacion]
           ,[FechaCreacion]
           ,[FechaModificacion])
     VALUES
           (@Nombre
           ,@IdUsuario
           ,GETDATE()
           ,GETDATE())

END;
GO
/****** Object:  StoredProcedure [dbo].[EDITAR_ROL]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EDITAR_ROL]
	@IdRol BIGINT,
	@Nombre VARCHAR(20),
	@IdUsuario BIGINT
AS
BEGIN
UPDATE [dbo].[Rol]
   SET [Nombre] = @Nombre
      ,[IdUsuarioModificacion] = @IdUsuario
      ,[FechaModificacion] = GETDATE()
 WHERE [IdRol] = @IdRol;

END;
GO
/****** Object:  StoredProcedure [dbo].[ELIMINAR_ROL]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELIMINAR_ROL]
	@IdRol BIGINT

AS
BEGIN
DELETE FROM [dbo].[Rol]
	WHERE [IdRol] = @IdRol;

END;
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
	@IdUsuario BIGINT

AS
BEGIN
DELETE FROM Cliente WHERE
        [IdCliente] = (SELECT IdCliente FROM [dbo].[Usuario] WHERE [IdUsuario] = @IdUsuario);
DELETE FROM Usuario
	WHERE IdUsuario = @IdUsuario;
	

END;
GO
/****** Object:  StoredProcedure [dbo].[InicioSesion]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InicioSesion]
    @nombreUsuario VARCHAR(50),
    @contrasenna VARCHAR(50)
AS
BEGIN
    -- Verificar si el usuario y contraseña coinciden en la tabla "Usuarios"
    IF EXISTS (
        SELECT 1
        FROM Usuario
        WHERE Usuario = @nombreUsuario AND PwUsuario = @contrasenna
    )
    BEGIN
        -- Si hay una coincidencia, retornar la información del usuario
        SELECT U.IdUsuario, U.Usuario, U.IdCliente, U.IdRol, U.IdEstatus, R.Nombre AS NombreRol, U.FechaUltimaActividad
        FROM Usuario as U
		JOIN Rol as R ON U.IdRol = R.IdRol
        WHERE Usuario = @nombreUsuario
		and U.IdEstatus = 1;
		

		UPDATE Usuario
			SET FechaUltimaActividad = GETDATE()
			WHERE Usuario = @nombreUsuario;

    END
END;
GO
/****** Object:  StoredProcedure [dbo].[INSERTAR_ROL]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTAR_ROL]
	
	@NombreRol VARCHAR(20),
    @IdUsuario bigint
AS
BEGIN
	INSERT INTO [dbo].[Rol]
           ([Nombre]
           ,[IdUsuarioModificacion]
           ,[FechaCreacion]
           ,[FechaModificacion])
     VALUES
           (@NombreRol
           ,@IdUsuario
           ,GETDATE()
           ,GETDATE())

END;
GO
/****** Object:  StoredProcedure [dbo].[InsertarCliente]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[InsertarCliente]
		   @Cedula varchar(20),
		   @Correo varchar(50),
		   @Nombre varchar(15),
           @Apellido1 varchar(15),
           @Apellido2 varchar(15),
		   @FechaNacimiento datetime,
           @Telefono varchar(15),
           @Direccion varchar(100),
           @IdEstatus bigint,
		   @IdRol bigint
AS
BEGIN
	INSERT INTO [dbo].[Cliente]
           ([Cedula]
           ,[Correo]
           ,[Nombre]
           ,[Apellido1]
           ,[Apellido2]
           ,[FechaNacimiento]
           ,[Telefono]
           ,[Direccion]
           ,[IdEstatus]
		   ,[IdRol])
     VALUES
           (@Cedula,
		   @Correo,
		   @Nombre,
           @Apellido1,
           @Apellido2,
		   @FechaNacimiento,
           @Telefono,
           @Direccion,
           @IdEstatus,
		   @IdRol)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarPrematricula]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertarPrematricula]
			@CorreoElectronico varchar(100),
			@Telefono varchar(15),
			@Nombre varchar(15),
			@Apellido1 varchar(15),
			@Apellido2 varchar(15),
			@IdCurso bigint,
			@IdModalidad bigint,
			@IdNivel bigint,
			@IdEstatus bigint,
			@FechaPrematricula datetime
AS
BEGIN
	INSERT INTO PreMatricula
           ([CorreoElectronico]
           ,[Telefono]
           ,[Nombre]
           ,[Apellido1]
           ,[Apellido2]
           ,[IdCurso]
           ,[IdModalidad]
           ,[IdNivel]
           ,[IdEstatus]
           ,[FechaPrematricula])
     VALUES(
           	@CorreoElectronico,
			@Telefono,
			@Nombre,
			@Apellido1,
			@Apellido2,
			@IdCurso,
			@IdModalidad,
			@IdNivel,
			@IdEstatus,
			@FechaPrematricula)
END
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_ROLES]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[LISTAR_ROLES]
	
AS
BEGIN
	SELECT * FROM Rol

END;
GO
/****** Object:  StoredProcedure [dbo].[ModificarCliente]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarCliente]
    @IdUsuario BIGINT,
    @Cedula VARCHAR(20),
    @Correo VARCHAR(50),
    @Nombre VARCHAR(50),
    @Apellido1 VARCHAR(50),
    @Apellido2 VARCHAR(50),
    @FechaNacimiento DATE,
    @Telefono VARCHAR(20),
    @Direccion VARCHAR(100),
    @IdEstatus BIGINT,
    @IdRol BIGINT
AS
BEGIN
    UPDATE [dbo].[Cliente]
    SET
        [Cedula] = @Cedula,
        [Correo] = @Correo,
        [Nombre] = @Nombre,
        [Apellido1] = @Apellido1,
        [Apellido2] = @Apellido2,
        [FechaNacimiento] = @FechaNacimiento,
        [Telefono] = @Telefono,
        [Direccion] = @Direccion,
        [IdEstatus] = @IdEstatus,
        [IdRol] = @IdRol
    WHERE
        [IdCliente] = (SELECT IdCliente FROM [dbo].[Usuario] WHERE [IdUsuario] = @IdUsuario);
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistarMatricula]    Script Date: 27/9/2023 19:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistarMatricula]
		   @Cedula varchar(20),
           @IdCurso bigint,
           @IdModalidad bigint,
           @IdNivel bigint,
           @IdHorario bigint,
           @Monto decimal(10,2),
           @FechaMatricula datetime,
           @DiaPago int,
           @Comentario varchar(500),
           @IdEstatus bigint
AS
BEGIN
	INSERT INTO [dbo].[Matricula]
           ([Cedula]
           ,[IdCurso]
           ,[IdModalidad]
           ,[IdNivel]
           ,[IdHorario]
           ,[Monto]
           ,[FechaMatricula]
           ,[DiaPago]
           ,[Comentario]
           ,[IdEstatus])
     VALUES
           (
		   @Cedula,
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
END
GO
USE [master]
GO
ALTER DATABASE [CCIH_DB] SET  READ_WRITE 
GO
