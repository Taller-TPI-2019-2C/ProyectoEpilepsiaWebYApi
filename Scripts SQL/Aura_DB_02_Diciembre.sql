USE [DB_A4EFB7_aura]
GO
/****** Object:  Table [dbo].[Alerta]    Script Date: 02/12/2019 17:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alerta](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Tipo_Alerta] [int] NULL,
	[Id_Usuario_Paciente] [bigint] NOT NULL,
	[Id_Usuario_Tutor] [bigint] NOT NULL,
	[Tiempo] [datetime] NULL,
	[Notas] [varchar](max) NULL,
 CONSTRAINT [PK_Alerta_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PacienteId] [bigint] NULL,
	[Nombre] [varchar](max) NULL,
	[PeriodicidadHoras] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[UltimaVez] [datetime] NULL,
 CONSTRAINT [PK_Medicacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_Episodio]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Episodio](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Duracion] [decimal](6, 2) NULL,
	[Id_Usuario] [bigint] NOT NULL,
 CONSTRAINT [PK_Registro_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](max) NOT NULL,
	[Id_Usuario] [bigint] NOT NULL,
 CONSTRAINT [PK_Telefono_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Token_Login]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token_Login](
	[Id_Usuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Login_Api] [varchar](max) NULL,
 CONSTRAINT [PK_Token_Login_Id] PRIMARY KEY CLUSTERED 
(
	[Id_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TokenTutor]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokenTutor](
	[TutorID] [bigint] NOT NULL,
	[API_Token] [varchar](max) NOT NULL,
 CONSTRAINT [PK_TokenTutor] PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tratamiento]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tratamiento](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha_Inicio] [datetime] NOT NULL,
	[Fecha_Fin] [datetime] NULL,
	[Medicamento] [varchar](max) NULL,
	[Toma_Cada] [varchar](max) NULL,
	[Dosis] [varchar](max) NULL,
	[Id_Usuario] [bigint] NOT NULL,
 CONSTRAINT [PK_Tratamiendo_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TutorPaciente]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorPaciente](
	[TutorID] [bigint] NOT NULL,
	[PacienteID] [bigint] NOT NULL,
 CONSTRAINT [PK_TutorPaciente] PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC,
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 02/12/2019 17:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NULL,
	[Apellido] [varchar](max) NULL,
	[Email] [varchar](max) NOT NULL,
	[Contrasenia] [varchar](max) NOT NULL,
	[FechaNacimiento] [datetime] NULL,
	[Estado] [bit] NULL,
	[Paciente] [bit] NULL,
	[Token] [varchar](max) NULL,
 CONSTRAINT [PK_Usuario_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alerta] ON 

INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1260, 1, 30, 31, CAST(N'2019-11-13T14:09:26.433' AS DateTime), N'La frecuencia cardiaca registrada fue de 69')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1261, 1, 30, 31, CAST(N'2019-11-13T14:09:28.463' AS DateTime), N'La frecuencia cardiaca registrada fue de 71')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1262, 1, 30, 31, CAST(N'2019-11-13T14:09:30.493' AS DateTime), N'La frecuencia cardiaca registrada fue de 64')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1263, 1, 30, 31, CAST(N'2019-11-13T14:09:32.513' AS DateTime), N'La frecuencia cardiaca registrada fue de 62')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1264, 1, 30, 31, CAST(N'2019-11-13T14:09:34.433' AS DateTime), N'La frecuencia cardiaca registrada fue de 67')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1265, 1, 30, 31, CAST(N'2019-11-13T14:09:36.447' AS DateTime), N'La frecuencia cardiaca registrada fue de 68')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1266, 1, 30, 31, CAST(N'2019-11-13T14:09:38.620' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1267, 1, 30, 31, CAST(N'2019-11-13T14:09:42.463' AS DateTime), N'La frecuencia cardiaca registrada fue de 71')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1268, 1, 30, 31, CAST(N'2019-11-13T14:09:43.480' AS DateTime), N'La frecuencia cardiaca registrada fue de 72')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1269, 1, 30, 31, CAST(N'2019-11-13T14:09:49.493' AS DateTime), N'La frecuencia cardiaca registrada fue de 72')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1270, 1, 30, 31, CAST(N'2019-11-13T14:12:00.447' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1271, 1, 30, 31, CAST(N'2019-11-13T14:12:12.950' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1272, 1, 30, 31, CAST(N'2019-11-13T14:12:15.260' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1273, 1, 30, 31, CAST(N'2019-11-13T14:12:21.260' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1274, 1, 30, 31, CAST(N'2019-11-13T14:20:05.500' AS DateTime), N'La frecuencia cardiaca registrada fue de 65')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1275, 1, 30, 31, CAST(N'2019-11-13T14:20:27.250' AS DateTime), N'La frecuencia cardiaca registrada fue de 61')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1276, 1, 30, 31, CAST(N'2019-11-13T14:20:29.267' AS DateTime), N'La frecuencia cardiaca registrada fue de 62')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1277, 1, 30, 31, CAST(N'2019-11-13T14:20:35.267' AS DateTime), N'La frecuencia cardiaca registrada fue de 62')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1278, 1, 30, 31, CAST(N'2019-11-13T14:22:18.703' AS DateTime), N'algo')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1279, 1, 30, 31, CAST(N'2019-11-13T14:33:09.520' AS DateTime), N'prueba')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1280, 1, 30, 31, CAST(N'2019-11-13T14:33:35.397' AS DateTime), N'prueba')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1281, 1, 30, 31, CAST(N'2019-11-13T19:37:28.153' AS DateTime), N'prueba')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1282, 1, 30, 31, CAST(N'2019-11-13T14:38:24.023' AS DateTime), N'La frecuencia cardiaca registrada fue de 71')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1283, 1, 30, 31, CAST(N'2019-11-13T14:38:26.553' AS DateTime), N'La frecuencia cardiaca registrada fue de 73')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1284, 1, 30, 31, CAST(N'2019-11-13T14:38:29.727' AS DateTime), N'La frecuencia cardiaca registrada fue de 77')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1285, 1, 30, 31, CAST(N'2019-11-13T14:38:32.070' AS DateTime), N'La frecuencia cardiaca registrada fue de 78')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1286, 1, 30, 31, CAST(N'2019-11-13T14:38:36.507' AS DateTime), N'La frecuencia cardiaca registrada fue de 80')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1287, 1, 30, 31, CAST(N'2019-11-13T14:38:37.430' AS DateTime), N'La frecuencia cardiaca registrada fue de 73')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1288, 1, 30, 31, CAST(N'2019-11-13T14:38:38.477' AS DateTime), N'La frecuencia cardiaca registrada fue de 76')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1289, 1, 30, 31, CAST(N'2019-11-13T14:38:39.553' AS DateTime), N'La frecuencia cardiaca registrada fue de 75')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1290, 1, 30, 31, CAST(N'2019-11-13T14:38:40.633' AS DateTime), N'La frecuencia cardiaca registrada fue de 76')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1291, 1, 30, 31, CAST(N'2019-11-13T14:38:41.757' AS DateTime), N'La frecuencia cardiaca registrada fue de 78')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1292, 1, 30, 31, CAST(N'2019-11-13T19:39:31.840' AS DateTime), N'prueba33')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1293, 1, 30, 31, CAST(N'2019-11-13T14:40:06.290' AS DateTime), N'pruebaTestApi')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1294, 1, 30, 31, CAST(N'2019-11-13T14:42:28.743' AS DateTime), N'La frecuencia cardiaca registrada fue de 93')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1295, 1, 30, 31, CAST(N'2019-11-13T14:42:30.570' AS DateTime), N'La frecuencia cardiaca registrada fue de 94')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1296, 1, 30, 31, CAST(N'2019-11-13T14:42:37.617' AS DateTime), N'La frecuencia cardiaca registrada fue de 94')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1297, 2, 30, 31, CAST(N'2019-11-13T14:42:40.947' AS DateTime), N'pruebaTestApi')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1298, 1, 30, 31, CAST(N'2019-11-13T14:57:05.297' AS DateTime), N'algo')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1299, 1, 30, 31, CAST(N'2019-11-13T16:39:35.353' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1300, 1, 30, 31, CAST(N'2019-11-13T16:39:40.057' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1301, 1, 30, 31, CAST(N'2019-11-13T16:39:46.057' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1302, 1, 30, 31, CAST(N'2019-11-13T16:39:51.997' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1303, 1, 30, 31, CAST(N'2019-11-13T16:39:58.073' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1304, 1, 30, 31, CAST(N'2019-11-13T16:40:03.167' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1305, 1, 30, 31, CAST(N'2019-11-15T18:42:46.157' AS DateTime), N'La frecuencia cardiaca registrada fue de 74')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1306, 1, 30, 31, CAST(N'2019-11-15T18:42:47.560' AS DateTime), N'La frecuencia cardiaca registrada fue de 80')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1307, 1, 30, 31, CAST(N'2019-11-15T18:42:59.670' AS DateTime), N'La frecuencia cardiaca registrada fue de 117')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1308, 1, 30, 31, CAST(N'2019-11-15T18:43:01.453' AS DateTime), N'La frecuencia cardiaca registrada fue de 118')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1309, 1, 30, 31, CAST(N'2019-11-15T18:43:07.593' AS DateTime), N'La frecuencia cardiaca registrada fue de 118')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1310, 1, 30, 31, CAST(N'2019-11-15T18:43:13.627' AS DateTime), N'La frecuencia cardiaca registrada fue de 118')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1311, 1, 30, 31, CAST(N'2019-11-15T18:43:19.547' AS DateTime), N'La frecuencia cardiaca registrada fue de 118')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1312, 1, 30, 31, CAST(N'2019-11-15T18:43:25.750' AS DateTime), N'La frecuencia cardiaca registrada fue de 118')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1313, 1, 30, 31, CAST(N'2019-11-15T18:43:31.547' AS DateTime), N'La frecuencia cardiaca registrada fue de 118')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1314, 1, 30, 31, CAST(N'2019-11-15T18:43:35.547' AS DateTime), N'La frecuencia cardiaca registrada fue de 109')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1315, 1, 30, 31, CAST(N'2019-11-15T18:43:37.560' AS DateTime), N'La frecuencia cardiaca registrada fue de 113')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1316, 1, 30, 31, CAST(N'2019-11-15T18:43:39.467' AS DateTime), N'La frecuencia cardiaca registrada fue de 111')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1317, 1, 30, 31, CAST(N'2019-11-15T18:43:41.560' AS DateTime), N'La frecuencia cardiaca registrada fue de 112')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1318, 1, 30, 31, CAST(N'2019-11-15T18:43:47.577' AS DateTime), N'La frecuencia cardiaca registrada fue de 112')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1319, 1, 30, 31, CAST(N'2019-11-15T18:43:58.780' AS DateTime), N'La frecuencia cardiaca registrada fue de 112')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1320, 1, 30, 31, CAST(N'2019-11-15T18:44:03.513' AS DateTime), N'La frecuencia cardiaca registrada fue de 108')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1321, 1, 30, 31, CAST(N'2019-11-15T18:44:06.483' AS DateTime), N'La frecuencia cardiaca registrada fue de 105')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1322, 1, 30, 31, CAST(N'2019-11-15T18:44:08.467' AS DateTime), N'La frecuencia cardiaca registrada fue de 106')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1323, 1, 30, 31, CAST(N'2019-11-15T18:44:10.500' AS DateTime), N'La frecuencia cardiaca registrada fue de 105')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1324, 1, 30, 31, CAST(N'2019-11-15T18:44:16.467' AS DateTime), N'La frecuencia cardiaca registrada fue de 105')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1325, 1, 30, 31, CAST(N'2019-11-15T18:44:22.547' AS DateTime), N'La frecuencia cardiaca registrada fue de 105')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1326, 1, 30, 31, CAST(N'2019-11-15T18:44:28.483' AS DateTime), N'La frecuencia cardiaca registrada fue de 105')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1327, 1, 30, 31, CAST(N'2019-11-15T18:44:34.483' AS DateTime), N'La frecuencia cardiaca registrada fue de 101')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1328, 1, 30, 31, CAST(N'2019-11-15T18:44:36.483' AS DateTime), N'La frecuencia cardiaca registrada fue de 100')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1329, 1, 30, 31, CAST(N'2019-11-15T18:44:38.437' AS DateTime), N'La frecuencia cardiaca registrada fue de 103')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1330, 1, 30, 31, CAST(N'2019-11-15T18:44:45.483' AS DateTime), N'La frecuencia cardiaca registrada fue de 102')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1331, 1, 30, 31, CAST(N'2019-11-15T18:44:47.500' AS DateTime), N'La frecuencia cardiaca registrada fue de 103')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1332, 1, 30, 31, CAST(N'2019-11-15T18:44:53.467' AS DateTime), N'La frecuencia cardiaca registrada fue de 103')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1333, 1, 30, 31, CAST(N'2019-11-15T18:45:23.703' AS DateTime), N'La frecuencia cardiaca registrada fue de 97')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1334, 1, 30, 31, CAST(N'2019-11-15T18:45:29.563' AS DateTime), N'La frecuencia cardiaca registrada fue de 97')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1335, 1, 30, 31, CAST(N'2019-11-15T18:45:31.547' AS DateTime), N'La frecuencia cardiaca registrada fue de 96')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1336, 1, 30, 31, CAST(N'2019-11-15T18:45:46.670' AS DateTime), N'La frecuencia cardiaca registrada fue de 94')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1337, 1, 30, 31, CAST(N'2019-11-15T18:45:48.517' AS DateTime), N'La frecuencia cardiaca registrada fue de 93')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1338, 1, 30, 31, CAST(N'2019-11-15T18:45:52.547' AS DateTime), N'La frecuencia cardiaca registrada fue de 90')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1339, 1, 30, 31, CAST(N'2019-11-15T18:45:54.517' AS DateTime), N'La frecuencia cardiaca registrada fue de 91')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1340, 1, 30, 31, CAST(N'2019-11-15T18:46:02.517' AS DateTime), N'La frecuencia cardiaca registrada fue de 92')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1341, 1, 30, 31, CAST(N'2019-11-15T18:46:04.467' AS DateTime), N'La frecuencia cardiaca registrada fue de 93')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1342, NULL, 2, 2, CAST(N'2019-12-11T00:00:00.000' AS DateTime), N'asad')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1343, 1, 30, 31, CAST(N'2019-11-26T15:34:13.627' AS DateTime), N'La frecuencia cardiaca registrada fue de 67')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1344, 1, 30, 31, CAST(N'2019-11-26T15:34:14.517' AS DateTime), N'La frecuencia cardiaca registrada fue de 64')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1345, 1, 30, 31, CAST(N'2019-11-26T15:34:46.110' AS DateTime), N'La frecuencia cardiaca registrada fue de 63')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1346, 1, 30, 31, CAST(N'2019-11-26T15:34:47.220' AS DateTime), N'La frecuencia cardiaca registrada fue de 63')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1347, 1, 30, 31, CAST(N'2019-11-26T15:34:47.827' AS DateTime), N'La frecuencia cardiaca registrada fue de 63')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1348, 1, 30, 31, CAST(N'2019-11-26T15:34:48.437' AS DateTime), N'La frecuencia cardiaca registrada fue de 63')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1349, 1, 30, 31, CAST(N'2019-11-26T15:34:52.093' AS DateTime), N'La frecuencia cardiaca registrada fue de 70')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1350, 1, 30, 31, CAST(N'2019-11-26T15:34:57.953' AS DateTime), N'La frecuencia cardiaca registrada fue de 68')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1351, 1, 30, 31, CAST(N'2019-11-26T15:34:58.487' AS DateTime), N'La frecuencia cardiaca registrada fue de 68')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1352, 1, 30, 31, CAST(N'2019-11-26T15:35:33.173' AS DateTime), N'La frecuencia cardiaca registrada fue de 68')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1353, 1, 30, 31, CAST(N'2019-11-26T15:36:40.657' AS DateTime), N'La frecuencia cardiaca registrada fue de 68')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1354, 1, 30, 31, CAST(N'2019-11-26T15:36:41.390' AS DateTime), N'La frecuencia cardiaca registrada fue de 65')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1355, 1, 30, 31, CAST(N'2019-11-26T15:36:46.533' AS DateTime), N'La frecuencia cardiaca registrada fue de 64')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1356, 1, 30, 31, CAST(N'2019-11-26T15:37:28.327' AS DateTime), N'La frecuencia cardiaca registrada fue de 66')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1357, 1, 30, 31, CAST(N'2019-11-26T15:37:29.970' AS DateTime), N'La frecuencia cardiaca registrada fue de 65')
INSERT [dbo].[Alerta] ([Id], [Tipo_Alerta], [Id_Usuario_Paciente], [Id_Usuario_Tutor], [Tiempo], [Notas]) VALUES (1358, 1, 30, 31, CAST(N'2019-11-26T15:37:30.533' AS DateTime), N'La frecuencia cardiaca registrada fue de 65')
GO
SET IDENTITY_INSERT [dbo].[Alerta] OFF
SET IDENTITY_INSERT [dbo].[Medicamento] ON 

INSERT [dbo].[Medicamento] ([Id], [PacienteId], [Nombre], [PeriodicidadHoras], [Activo], [UltimaVez]) VALUES (4, 2, N'Focusín', 6, 1, CAST(N'2019-11-03T16:09:30.557' AS DateTime))
INSERT [dbo].[Medicamento] ([Id], [PacienteId], [Nombre], [PeriodicidadHoras], [Activo], [UltimaVez]) VALUES (5, 2, N'Ritalín', 8, 1, CAST(N'2019-11-03T16:09:38.527' AS DateTime))
SET IDENTITY_INSERT [dbo].[Medicamento] OFF
INSERT [dbo].[TokenTutor] ([TutorID], [API_Token]) VALUES (3, N'abc')
INSERT [dbo].[TutorPaciente] ([TutorID], [PacienteID]) VALUES (3, 15)
INSERT [dbo].[TutorPaciente] ([TutorID], [PacienteID]) VALUES (5, 2)
INSERT [dbo].[TutorPaciente] ([TutorID], [PacienteID]) VALUES (6, 2)
INSERT [dbo].[TutorPaciente] ([TutorID], [PacienteID]) VALUES (7, 2)
INSERT [dbo].[TutorPaciente] ([TutorID], [PacienteID]) VALUES (17, 18)
INSERT [dbo].[TutorPaciente] ([TutorID], [PacienteID]) VALUES (28, 27)
INSERT [dbo].[TutorPaciente] ([TutorID], [PacienteID]) VALUES (31, 30)
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (1, N'pepe', N'paciente', N'pepe@paciente.com', N'123', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (2, N'pompin', N'pompin', N'pepe@gg.com', N'123456', NULL, NULL, 1, N'dXxKLqnCT7E:APA91bGkO2SOKGv3xnNTxfraGW9tgV9t6S_3phJdx7ZDYesOIPZbYPoheoKZ-aUG121A_qC3r7nNBLi6WW3Q56ox1fe0AftovNjYpU9ecWQd_5T3XXyDnaoxfGleZPdy4JiQP072JhF1')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (3, N'tutor', N'tutor', N'tutor@gg.com', N'123', NULL, NULL, 0, N'abc')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (4, N'paciente', N'paciente', N'paciente@gg.com', N'123', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (5, N'tutor2', N'tutor2', N'tutor2@gg.com', N'123', NULL, NULL, 0, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (6, N'tutor3', N'tutor3', N'tutor3@gg.com', N'123', NULL, NULL, 0, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (7, N'tutor4', N'tutor4', N'tutor4@gg.com', N'123', NULL, NULL, 0, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (8, N'test', N'hosting', N'test@hosting.com', N'123', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (9, N'Dtoke', N'Arkano', N'Cacha@kodigo.bnet', N'123', NULL, NULL, 0, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (10, N'NombreFromAPI', N'ApellidoFromAPI', N'pepe45@gg.com', N'123', CAST(N'2019-10-21T16:30:00.637' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (11, N'NombreFromAPI', N'ApellidoFromAPI', N'pepe450@gg.com', N'123', CAST(N'2019-10-21T16:34:27.690' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (12, N'NombreFromAPI', N'ApellidoFromAPI', N'usercontoken@gg.com', N'123', CAST(N'2019-10-21T17:12:53.930' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (13, N'NombreFromAPI', N'ApellidoFromAPI', N'usercontokendesdepublicado@gg.com', N'123', CAST(N'2019-10-21T13:18:47.380' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (14, N'NombreFromAPI', N'ApellidoFromAPI', N'usuario@gg.com', N'123', CAST(N'2019-10-21T13:43:11.290' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (15, N'prueba', N'Unt', N'untutor@gg.com', N'123', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (16, N'diego', N'algo', N'diego@hotmai.com', N'algo', CAST(N'2019-10-23T11:02:25.263' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (17, N'a', N'b', N'diego.sejas@errepar.com', N'Testssshhh', CAST(N'2019-10-23T13:00:28.120' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (18, N'a', N'b', N'diego.sejas3@errepar.com', N'Testssshhh', CAST(N'2019-10-23T15:37:35.343' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (19, N'mama', N'papa', N'pfalse@gg.com', N'123', CAST(N'2019-10-24T18:12:02.043' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (20, N'mama', N'papa', N'ptrue@gg.com', N'123', CAST(N'2019-10-24T18:13:04.563' AS DateTime), NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (21, N'gustavo', N'alvarez', N'diego1@gmail.com', N'diego', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (22, N'Diego', N'Algo', N'algo@gmail.com', N'diego', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (23, N'Diego', N'Algo2', N'diego3@gmail.com', N'diego', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (24, N'Jaja', N'Jajajaja', N'aoaoa@gmail.com', N'algo', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (25, N'Ajjaja', N'Akkaka', N'jajja@gmail.com', N'algp', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (26, N'Papapa', N'Pepepe', N'pepe@gmail.com', N'algo', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (27, N'Jajajja', N'Kakaka', N'iaiaiai@gmail.com', N'algo', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (28, N'Diego', N'Sejas', N'sejas@gmail.com', N'diego', NULL, NULL, 0, N'cdGU1RbsZqA:APA91bF6qs-zTemAaKzBswZxtH5s4xTWHiefqZ-7KXm5-aB1LJvNv82s0ckkE7QixTh7qEgqfvnDN4eMprbfPp4pLhba3K6-L0cpOEqjbVUdqOd_UU0yj4b1q0JI8Z3mrv_WHcuwCBh4')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (29, N'Gogogo', N'Gogofo', N'gogog@gmail.com', N'sejas', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (30, N'Diego', N'Sejas', N'sejas22@gmail.com', N'diego', NULL, NULL, 1, N'cXFEydqUphA:APA91bEqrc_9emZ_mygDU6ON5eVHAP0tUihWMDShr2Nrb8TO-HpJlCQWiwlL0ktOWHuu7JGoXe0Slt1ELo7zw7jtZJ0jZdl_VYDVGjPgZvph0laW6XP__D5jocNRBnYaVKqLIuHDXQ-p')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (31, N'Diego', N'Sejas', N'diego@gmail.com', N'diego', NULL, NULL, 0, N'csL2Sgbf86M:APA91bGLMgwYZbtzRiK7vrKV8hwL2Ave0FSin8GR5IUdSPI3jV8HaSTZtR8hHuT9-rKJzC2zsvPl8P_20S67jfT1cn5lq-5YlCecSBkrSCuwi20ubHUsEZzRyYabuW6YncVeExzGVnuF')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (32, N'José Antonio', N'Guinovart', N'darius05g4@hotmail.com', N'Terrateniente1', NULL, NULL, 0, N'cRgquc5mB7k:APA91bHshCjMSn57SKYjlVTkgyE1lYepNREj_WiZGrObYA_ZkorOketinqCiN3sS0GM26eoqpjMk3PNKt_up1hh3eMHchYK6afycRHQgCgZ0yOGxRmfYrTnEOYtaLBCG1CmsazpBklR1')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (33, N'novi', N'novi', N'novip@gg.com', N'novip', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (34, N'novit', N'novit', N'novit@gg.com', N'novit', NULL, NULL, 0, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (35, N'Diego', N'Sejas', N'sejas2019@gmail.com', N'diego', NULL, NULL, 1, N'')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (36, N'Gustavo', N'Sejas', N'gustavo2019@gmail.com', N'diego', NULL, NULL, 0, N'')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (37, N'José Antonio', N'Guinovart', N'darius05g4@gmail.com', N'Terrateniente1', NULL, NULL, 1, N'cnjWhxDvBIM:APA91bFEiFcXPVY2rVqBwl__C1T9UicNAzq-ZEaPsBuqr1M_AR4HCFiMsNGidHHaXj1aKH4hVZNWy2bDM2lWsu3m1Hwo5LjtdcsouiRwPgDB2hepnkW29vnoK4376UWlg7AA9ACqu139')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (38, N'Aaaa', N'Bbbb', N'a@b.com', N'1234', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (39, N'Aaaa', N'Sssss', N'abc@d.com', N'1234', NULL, NULL, 1, NULL)
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (40, N'Maira', N'Sejas', N'maida.castillo2017@gmail.com', N'maira', NULL, NULL, 1, N'eRR3iahkyS8:APA91bFkM9Zt8uXfmzpUQ3_UIub0jAw3eO84wyuokLsN8dvKoq2BQJNpqe_1ePe-nC4Dq7okE-PE-MSe6DWYSCD-agg7CXNlMSJLEBzT1a2CLZSHQBpsipBYsuGwjz_P6XTzBjN-puX1')
INSERT [dbo].[Usuario] ([Id], [Nombre], [Apellido], [Email], [Contrasenia], [FechaNacimiento], [Estado], [Paciente], [Token]) VALUES (10032, N'Regtest', N'Regtest', N'regtest@test.com', N'123', NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('FALSE') FOR [Estado]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((0)) FOR [Paciente]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ('') FOR [Token]
GO
ALTER TABLE [dbo].[Alerta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Paciente] FOREIGN KEY([Id_Usuario_Paciente])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Alerta] CHECK CONSTRAINT [FK_Usuario_Paciente]
GO
ALTER TABLE [dbo].[Alerta]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Tutor] FOREIGN KEY([Id_Usuario_Tutor])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Alerta] CHECK CONSTRAINT [FK_Usuario_Tutor]
GO
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicacion] FOREIGN KEY([PacienteId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [FK_Medicacion]
GO
ALTER TABLE [dbo].[Registro_Episodio]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Registro_Episodio] CHECK CONSTRAINT [FK_Registro_Usuario]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Usuario]
GO
ALTER TABLE [dbo].[Token_Login]  WITH CHECK ADD  CONSTRAINT [FK_Token_Login_Id] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Token_Login] CHECK CONSTRAINT [FK_Token_Login_Id]
GO
ALTER TABLE [dbo].[TokenTutor]  WITH CHECK ADD  CONSTRAINT [FK_TokenTutorUsuario] FOREIGN KEY([TutorID])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[TokenTutor] CHECK CONSTRAINT [FK_TokenTutorUsuario]
GO
ALTER TABLE [dbo].[Tratamiento]  WITH CHECK ADD  CONSTRAINT [FK_Tratamiento_Usuario] FOREIGN KEY([Id_Usuario])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Tratamiento] CHECK CONSTRAINT [FK_Tratamiento_Usuario]
GO
ALTER TABLE [dbo].[TutorPaciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[TutorPaciente] CHECK CONSTRAINT [FK_Paciente]
GO
ALTER TABLE [dbo].[TutorPaciente]  WITH CHECK ADD  CONSTRAINT [FK_Tutor] FOREIGN KEY([TutorID])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[TutorPaciente] CHECK CONSTRAINT [FK_Tutor]
GO
