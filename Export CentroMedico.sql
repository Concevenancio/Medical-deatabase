USE [master]
GO
/****** Object:  Database [CentroMedico]    Script Date: 05/08/2024 02:27:05 p. m. ******/
CREATE DATABASE [CentroMedico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CentroMedico', FILENAME = N'D:\SQLDATA\CentroMedico\CentroMedico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CentroMedico_log', FILENAME = N'D:\SQLDATA\CentroMedico\CentroMedico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CentroMedico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CentroMedico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CentroMedico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CentroMedico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CentroMedico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CentroMedico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CentroMedico] SET ARITHABORT OFF 
GO
ALTER DATABASE [CentroMedico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CentroMedico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CentroMedico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CentroMedico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CentroMedico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CentroMedico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CentroMedico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CentroMedico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CentroMedico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CentroMedico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CentroMedico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CentroMedico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CentroMedico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CentroMedico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CentroMedico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CentroMedico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CentroMedico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CentroMedico] SET RECOVERY FULL 
GO
ALTER DATABASE [CentroMedico] SET  MULTI_USER 
GO
ALTER DATABASE [CentroMedico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CentroMedico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CentroMedico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CentroMedico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CentroMedico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CentroMedico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CentroMedico', N'ON'
GO
ALTER DATABASE [CentroMedico] SET QUERY_STORE = ON
GO
ALTER DATABASE [CentroMedico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CentroMedico]
GO
/****** Object:  UserDefinedDataType [dbo].[medico]    Script Date: 05/08/2024 02:27:05 p. m. ******/
CREATE TYPE [dbo].[medico] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[observacion]    Script Date: 05/08/2024 02:27:05 p. m. ******/
CREATE TYPE [dbo].[observacion] FROM [varchar](1000) NULL
GO
/****** Object:  UserDefinedDataType [dbo].[paciente]    Script Date: 05/08/2024 02:27:05 p. m. ******/
CREATE TYPE [dbo].[paciente] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [dbo].[turno]    Script Date: 05/08/2024 02:27:05 p. m. ******/
CREATE TYPE [dbo].[turno] FROM [int] NOT NULL
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concepto](
	[idConcepto] [tinyint] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidad]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[especialidad] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historia]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historia](
	[idHistoria] [int] IDENTITY(1,1) NOT NULL,
	[fechaHistoria] [datetime] NOT NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_idHistoria] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoriaPaciente]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoriaPaciente](
	[idHistoria] [int] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_HistoriaPaciente] PRIMARY KEY CLUSTERED 
(
	[idHistoria] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [dbo].[medico] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Medico__4E03DEBA7B3D9ADB] PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicoEspecialidad]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicoEspecialidad](
	[idMedico] [dbo].[medico] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMedico] ASC,
	[idEspecialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [dbo].[paciente] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[fNacimiento] [date] NOT NULL,
	[domicilio] [varchar](50) NULL,
	[idPais] [char](3) NULL,
	[telefono] [varchar](20) NULL,
	[email] [varchar](30) NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
(
	[idPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[concepto] [tinyint] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[monto] [money] NOT NULL,
	[estado] [tinyint] NULL,
	[observacion] [dbo].[observacion] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagoPaciente]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagoPaciente](
	[idPago] [int] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idTurno] [int] NOT NULL,
 CONSTRAINT [PK__PagoPaci__82C033A99EA929DF] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC,
	[idPaciente] ASC,
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idPais] [char](3) NOT NULL,
	[pais] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[idPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[select]    Script Date: 05/08/2024 02:27:05 p. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[select](
	[campo1] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 05/08/2024 02:27:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [dbo].[turno] IDENTITY(1,1) NOT NULL,
	[fechaTurno] [datetime] NULL,
	[estado] [smallint] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK__Turno__AA068B019ACE1EE6] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoEstado]    Script Date: 05/08/2024 02:27:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoEstado](
	[idEstado] [smallint] NOT NULL,
	[descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnoPaciente]    Script Date: 05/08/2024 02:27:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnoPaciente](
	[idTurno] [int] NOT NULL,
	[idPaciente] [dbo].[paciente] NOT NULL,
	[idMedico] [dbo].[medico] NOT NULL,
 CONSTRAINT [PK_TurnoPaciente] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC,
	[idPaciente] ASC,
	[idMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Concepto] ON 
GO
INSERT [dbo].[Concepto] ([idConcepto], [descripcion]) VALUES (1, N'Laboratotio')
GO
INSERT [dbo].[Concepto] ([idConcepto], [descripcion]) VALUES (2, N'Radiografia')
GO
SET IDENTITY_INSERT [dbo].[Concepto] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidad] ON 
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [especialidad]) VALUES (1, N'Traumatologia')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [especialidad]) VALUES (2, N'Clínica Médica')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [especialidad]) VALUES (3, N'Gastroenterología')
GO
INSERT [dbo].[Especialidad] ([idEspecialidad], [especialidad]) VALUES (4, N'Pediatría')
GO
SET IDENTITY_INSERT [dbo].[Especialidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Medico] ON 
GO
INSERT [dbo].[Medico] ([idMedico], [nombre], [apellido]) VALUES (1, N'', N'Castelo')
GO
INSERT [dbo].[Medico] ([idMedico], [nombre], [apellido]) VALUES (2, N'Conce', N'')
GO
SET IDENTITY_INSERT [dbo].[Medico] OFF
GO
SET IDENTITY_INSERT [dbo].[Paciente] ON 
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (1, N'Jorge', N'Ramirez ', CAST(N'2019-01-18' AS Date), NULL, N'COL', N'6185975864', N'mail@mail.com', N'hola')
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (2, N'Carlos', N'Lopez', CAST(N'2002-02-19' AS Date), NULL, N'MEX', NULL, NULL, N'sin observacion')
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (3, N'Claudio', N'Lopez', CAST(N'2019-02-18' AS Date), N'Piedras 2056', N'ARG', NULL, N'clopez@gmail.com', N'sin observacion')
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (13, N'Jose', N'Perez', CAST(N'1999-04-15' AS Date), N'Lavalle 2563', N'COL', NULL, N'jose@gmail.com', N'sin observacion')
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (14, N'Marcela', N'torres', CAST(N'1978-02-15' AS Date), N'Belgrano 1563', N'MEX', N'158598787', N'marcela@gmail.com', N'sin observacion')
GO
INSERT [dbo].[Paciente] ([idPaciente], [nombre], [apellido], [fNacimiento], [domicilio], [idPais], [telefono], [email], [observacion]) VALUES (15, N'Jose', N'Perez', CAST(N'1999-04-15' AS Date), N'Lavalle 2563', N'COL', NULL, N'jose@gmail.com', N'sin observacion')
GO
SET IDENTITY_INSERT [dbo].[Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[Pago] ON 
GO
INSERT [dbo].[Pago] ([idPago], [concepto], [fecha], [monto], [estado], [observacion]) VALUES (1, 1, CAST(N'2019-02-15T00:00:00.000' AS DateTime), 4500.0000, 1, N'observacion')
GO
INSERT [dbo].[Pago] ([idPago], [concepto], [fecha], [monto], [estado], [observacion]) VALUES (2, 2, CAST(N'2019-05-20T00:00:00.000' AS DateTime), 6800.0000, 1, N'observacion')
GO
INSERT [dbo].[Pago] ([idPago], [concepto], [fecha], [monto], [estado], [observacion]) VALUES (3, 1, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 5600.0000, 1, N'observacion')
GO
SET IDENTITY_INSERT [dbo].[Pago] OFF
GO
INSERT [dbo].[PagoPaciente] ([idPago], [idPaciente], [idTurno]) VALUES (1, 1, 5)
GO
INSERT [dbo].[PagoPaciente] ([idPago], [idPaciente], [idTurno]) VALUES (2, 3, 8)
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'ARG', N'Argentina')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'BRA', N'Brasil')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'COL', N'Colombia')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'ESP', N'España')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'MEX', N'Mexico')
GO
INSERT [dbo].[Pais] ([idPais], [pais]) VALUES (N'PER', N'Perú')
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (5, CAST(N'2023-03-15T00:00:00.000' AS DateTime), 1, N'Paciente en ayunas')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (8, CAST(N'2023-07-12T00:00:00.000' AS DateTime), 6, N'Paciente en ayunas')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (9, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 6, N'Paciente demallado')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (10, CAST(N'2023-07-12T00:00:00.000' AS DateTime), 2, N'Paciente en ayunas')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (11, CAST(N'2023-04-28T00:00:00.000' AS DateTime), 2, N'Paciente demallado')
GO
INSERT [dbo].[Turno] ([idTurno], [fechaTurno], [estado], [observacion]) VALUES (13, CAST(N'2019-01-22T10:00:00.000' AS DateTime), 3, N'Turno pendiente de aprobacion')
GO
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
INSERT [dbo].[TurnoEstado] ([idEstado], [descripcion]) VALUES (1, N'Pendiente')
GO
INSERT [dbo].[TurnoEstado] ([idEstado], [descripcion]) VALUES (2, N'Realizado')
GO
INSERT [dbo].[TurnoEstado] ([idEstado], [descripcion]) VALUES (3, N'Cancelado')
GO
INSERT [dbo].[TurnoEstado] ([idEstado], [descripcion]) VALUES (4, N'Rechazado')
GO
INSERT [dbo].[TurnoEstado] ([idEstado], [descripcion]) VALUES (5, N'Postergado')
GO
INSERT [dbo].[TurnoEstado] ([idEstado], [descripcion]) VALUES (6, N'Anulado')
GO
INSERT [dbo].[TurnoEstado] ([idEstado], [descripcion]) VALUES (7, N'Derivado')
GO
INSERT [dbo].[TurnoPaciente] ([idTurno], [idPaciente], [idMedico]) VALUES (5, 1, 1)
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Historia] FOREIGN KEY([idHistoria])
REFERENCES [dbo].[Historia] ([idHistoria])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Historia]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Medico]
GO
ALTER TABLE [dbo].[HistoriaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistoriaPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[HistoriaPaciente] CHECK CONSTRAINT [FK_HistoriaPaciente_Paciente]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Especialidad]
GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_MedicoEspecialidad_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_MedicoEspecialidad_Medico]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Pais] FOREIGN KEY([idPais])
REFERENCES [dbo].[Pais] ([idPais])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Pais]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Concepto] FOREIGN KEY([concepto])
REFERENCES [dbo].[Concepto] ([idConcepto])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Concepto]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Paciente]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Pago]
GO
ALTER TABLE [dbo].[PagoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_PagoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[PagoPaciente] CHECK CONSTRAINT [FK_PagoPaciente_Turno]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_TurnoEstado] FOREIGN KEY([estado])
REFERENCES [dbo].[TurnoEstado] ([idEstado])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_TurnoEstado]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Medico]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Paciente]
GO
ALTER TABLE [dbo].[TurnoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TurnoPaciente_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[TurnoPaciente] CHECK CONSTRAINT [FK_TurnoPaciente_Turno]
GO
/****** Object:  StoredProcedure [dbo].[S_paciente]    Script Date: 05/08/2024 02:27:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[S_paciente] (
	@idPaciente int
)
AS


SELECT apellido,nombre,idPais,observacion,
	(SELECT Pais  FROM Pais ps WHERE ps.idPais = pa.idPais) descPais
FROM Paciente pa WHERE idPaciente = @idPaciente



GO
USE [master]
GO
ALTER DATABASE [CentroMedico] SET  READ_WRITE 
GO
