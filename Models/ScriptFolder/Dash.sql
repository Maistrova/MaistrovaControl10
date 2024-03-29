USE [master]
GO
/****** Object:  Database [DepoMaistrova]    Script Date: 06.03.2023 12:19:30 ******/
CREATE DATABASE [DepoMaistrova]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DepoMaistrova', FILENAME = N'D:\User\DepoMaistrova.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'DepoMaistrova_log', FILENAME = N'D:\User\DepoMaistrova_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DepoMaistrova] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DepoMaistrova].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DepoMaistrova] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DepoMaistrova] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DepoMaistrova] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DepoMaistrova] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DepoMaistrova] SET ARITHABORT OFF 
GO
ALTER DATABASE [DepoMaistrova] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DepoMaistrova] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DepoMaistrova] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DepoMaistrova] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DepoMaistrova] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DepoMaistrova] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DepoMaistrova] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DepoMaistrova] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DepoMaistrova] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DepoMaistrova] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DepoMaistrova] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DepoMaistrova] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DepoMaistrova] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DepoMaistrova] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DepoMaistrova] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DepoMaistrova] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DepoMaistrova] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DepoMaistrova] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DepoMaistrova] SET  MULTI_USER 
GO
ALTER DATABASE [DepoMaistrova] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DepoMaistrova] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DepoMaistrova] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DepoMaistrova] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DepoMaistrova] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DepoMaistrova', N'ON'
GO
ALTER DATABASE [DepoMaistrova] SET QUERY_STORE = OFF
GO
USE [DepoMaistrova]
GO
/****** Object:  Table [dbo].[FloorsTable]    Script Date: 06.03.2023 12:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FloorsTable](
	[PersonalNumberFloors] [int] IDENTITY(1,1) NOT NULL,
	[TitleFloors] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FloorsTable] PRIMARY KEY CLUSTERED 
(
	[PersonalNumberFloors] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportTable]    Script Date: 06.03.2023 12:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTable](
	[IdReport] [int] NOT NULL,
	[IdWork] [int] NOT NULL,
	[IdTrolly] [int] NOT NULL,
	[IdStatus] [int] NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
 CONSTRAINT [PK_ReportTable] PRIMARY KEY CLUSTERED 
(
	[IdReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusWorkTable]    Script Date: 06.03.2023 12:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusWorkTable](
	[PersonalNumberStatusWork] [int] IDENTITY(1,1) NOT NULL,
	[TitleStatusWork] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusWorkTable] PRIMARY KEY CLUSTERED 
(
	[PersonalNumberStatusWork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrolleyTable]    Script Date: 06.03.2023 12:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrolleyTable](
	[PersonalNumberTrolley] [int] NOT NULL,
	[FloorsTrolley] [int] NOT NULL,
 CONSTRAINT [PK_TrolleyTable] PRIMARY KEY CLUSTERED 
(
	[PersonalNumberTrolley] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeWorkTable]    Script Date: 06.03.2023 12:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeWorkTable](
	[PersonalNumberTypeWork] [int] IDENTITY(1,1) NOT NULL,
	[TitleTypeWork] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeWorkTable] PRIMARY KEY CLUSTERED 
(
	[PersonalNumberTypeWork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTable]    Script Date: 06.03.2023 12:19:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTable](
	[PersonalNumberWork] [int] IDENTITY(1,1) NOT NULL,
	[TypeWork] [int] NOT NULL,
	[TitleWork] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_WorkTable] PRIMARY KEY CLUSTERED 
(
	[PersonalNumberWork] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FloorsTable] ON 

INSERT [dbo].[FloorsTable] ([PersonalNumberFloors], [TitleFloors]) VALUES (1, N'Одноэтажный')
INSERT [dbo].[FloorsTable] ([PersonalNumberFloors], [TitleFloors]) VALUES (2, N'Двухэтажный')
SET IDENTITY_INSERT [dbo].[FloorsTable] OFF
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (0, 13, 123458, 1, CAST(N'2023-02-08' AS Date), CAST(N'2023-02-11' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (1, 1, 123456, 1, CAST(N'2022-02-01' AS Date), CAST(N'2022-03-01' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (2, 2, 123457, 2, CAST(N'2022-02-02' AS Date), CAST(N'2022-03-02' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (3, 3, 123458, 1, CAST(N'2022-02-03' AS Date), CAST(N'2022-03-03' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (4, 4, 123459, 2, CAST(N'2022-02-04' AS Date), CAST(N'2022-03-04' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (5, 5, 123460, 1, CAST(N'2022-02-05' AS Date), CAST(N'2022-03-05' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (6, 6, 123461, 2, CAST(N'2022-02-06' AS Date), CAST(N'2022-03-06' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (7, 7, 123462, 1, CAST(N'2022-02-07' AS Date), CAST(N'2022-03-07' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (8, 8, 123463, 2, CAST(N'2022-02-08' AS Date), CAST(N'2022-03-08' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (9, 9, 123464, 1, CAST(N'2022-02-09' AS Date), CAST(N'2022-03-09' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (10, 10, 123465, 2, CAST(N'2022-02-10' AS Date), CAST(N'2022-03-10' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (11, 11, 123466, 1, CAST(N'2022-02-11' AS Date), CAST(N'2022-03-11' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (12, 12, 123467, 2, CAST(N'2022-02-12' AS Date), CAST(N'2022-03-12' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (13, 13, 123468, 1, CAST(N'2022-02-13' AS Date), CAST(N'2022-03-13' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (14, 14, 123469, 2, CAST(N'2022-02-14' AS Date), CAST(N'2022-03-14' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (15, 15, 123470, 1, CAST(N'2022-02-15' AS Date), CAST(N'2022-03-15' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (16, 16, 123471, 2, CAST(N'2022-02-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (17, 17, 123472, 1, CAST(N'2022-02-17' AS Date), CAST(N'2022-03-17' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (18, 18, 123473, 2, CAST(N'2022-02-18' AS Date), CAST(N'2022-03-18' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (19, 1, 123474, 1, CAST(N'2022-02-19' AS Date), CAST(N'2022-03-19' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (20, 2, 123475, 2, CAST(N'2022-02-20' AS Date), CAST(N'2022-03-20' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (21, 3, 123476, 1, CAST(N'2022-02-21' AS Date), CAST(N'2022-03-21' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (22, 4, 123477, 2, CAST(N'2022-02-22' AS Date), CAST(N'2022-03-22' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (23, 5, 123478, 1, CAST(N'2022-02-23' AS Date), CAST(N'2022-03-23' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (24, 6, 123479, 2, CAST(N'2022-02-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (25, 7, 123480, 1, CAST(N'2022-02-25' AS Date), CAST(N'2022-03-25' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (26, 8, 123481, 2, CAST(N'2022-02-26' AS Date), CAST(N'2022-03-26' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (27, 9, 123482, 1, CAST(N'2022-02-27' AS Date), CAST(N'2022-03-27' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (28, 10, 123483, 2, CAST(N'2022-02-28' AS Date), CAST(N'2022-03-28' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (29, 11, 123484, 1, CAST(N'2022-03-01' AS Date), CAST(N'2022-03-29' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (30, 12, 123485, 2, CAST(N'2022-03-02' AS Date), CAST(N'2022-03-30' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (31, 13, 123486, 1, CAST(N'2022-03-03' AS Date), CAST(N'2022-03-31' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (32, 14, 123487, 2, CAST(N'2022-03-04' AS Date), CAST(N'2022-04-01' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (33, 15, 123488, 1, CAST(N'2022-03-05' AS Date), CAST(N'2022-04-02' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (34, 16, 123489, 2, CAST(N'2022-03-06' AS Date), CAST(N'2022-04-03' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (35, 17, 123490, 1, CAST(N'2022-03-07' AS Date), CAST(N'2022-04-04' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (36, 18, 123491, 2, CAST(N'2022-03-08' AS Date), CAST(N'2022-04-05' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (37, 1, 123492, 1, CAST(N'2022-03-09' AS Date), CAST(N'2022-04-06' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (38, 2, 123493, 2, CAST(N'2022-03-10' AS Date), CAST(N'2022-04-07' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (39, 3, 123494, 1, CAST(N'2022-03-11' AS Date), CAST(N'2022-04-08' AS Date))
INSERT [dbo].[ReportTable] ([IdReport], [IdWork], [IdTrolly], [IdStatus], [DateStart], [DateEnd]) VALUES (40, 4, 123495, 2, CAST(N'2022-03-12' AS Date), CAST(N'2022-04-09' AS Date))
SET IDENTITY_INSERT [dbo].[StatusWorkTable] ON 

INSERT [dbo].[StatusWorkTable] ([PersonalNumberStatusWork], [TitleStatusWork]) VALUES (1, N'Работа')
INSERT [dbo].[StatusWorkTable] ([PersonalNumberStatusWork], [TitleStatusWork]) VALUES (2, N'Простой')
SET IDENTITY_INSERT [dbo].[StatusWorkTable] OFF
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123456, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123457, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123458, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123459, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123460, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123461, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123462, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123463, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123464, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123465, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123466, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123467, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123468, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123469, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123470, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123471, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123472, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123473, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123474, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123475, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123476, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123477, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123478, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123479, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123480, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123481, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123482, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123483, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123484, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123485, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123486, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123487, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123488, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123489, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123490, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123491, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123492, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123493, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123494, 1)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123495, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (123500, 2)
INSERT [dbo].[TrolleyTable] ([PersonalNumberTrolley], [FloorsTrolley]) VALUES (324236, 1)
SET IDENTITY_INSERT [dbo].[TypeWorkTable] ON 

INSERT [dbo].[TypeWorkTable] ([PersonalNumberTypeWork], [TitleTypeWork]) VALUES (1, N'Косметический')
INSERT [dbo].[TypeWorkTable] ([PersonalNumberTypeWork], [TitleTypeWork]) VALUES (2, N'Ремонтный')
SET IDENTITY_INSERT [dbo].[TypeWorkTable] OFF
SET IDENTITY_INSERT [dbo].[WorkTable] ON 

INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (1, 1, N'Покраска салона')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (2, 1, N'Аокраска полов')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (3, 1, N'Покраска стен')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (4, 1, N'Покраска вагонетки')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (5, 1, N'Смена пола')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (6, 1, N'Смена седеньев')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (7, 1, N'Смена лампочек')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (8, 1, N'Смена калонок')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (9, 1, N'Покраска потолка')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (10, 1, N'Смена потолка')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (11, 2, N'Смена ктормозных колодок')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (12, 2, N'Смена вагонетки')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (13, 2, N'Смена колёс')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (14, 2, N'Смена армотизаторов вагонетки')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (15, 2, N'Смена колёсной пары вагонетки')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (16, 2, N'Смена поручней')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (17, 2, N'Смена богажника для сумок')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (18, 2, N'Смена кровати для пассажиров')
INSERT [dbo].[WorkTable] ([PersonalNumberWork], [TypeWork], [TitleWork]) VALUES (19, 1, N'Test')
SET IDENTITY_INSERT [dbo].[WorkTable] OFF
ALTER TABLE [dbo].[ReportTable]  WITH CHECK ADD  CONSTRAINT [FK_ReportTable_StatusWorkTable] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[StatusWorkTable] ([PersonalNumberStatusWork])
GO
ALTER TABLE [dbo].[ReportTable] CHECK CONSTRAINT [FK_ReportTable_StatusWorkTable]
GO
ALTER TABLE [dbo].[ReportTable]  WITH CHECK ADD  CONSTRAINT [FK_ReportTable_TrolleyTable] FOREIGN KEY([IdTrolly])
REFERENCES [dbo].[TrolleyTable] ([PersonalNumberTrolley])
GO
ALTER TABLE [dbo].[ReportTable] CHECK CONSTRAINT [FK_ReportTable_TrolleyTable]
GO
ALTER TABLE [dbo].[ReportTable]  WITH CHECK ADD  CONSTRAINT [FK_ReportTable_WorkTable] FOREIGN KEY([IdWork])
REFERENCES [dbo].[WorkTable] ([PersonalNumberWork])
GO
ALTER TABLE [dbo].[ReportTable] CHECK CONSTRAINT [FK_ReportTable_WorkTable]
GO
ALTER TABLE [dbo].[TrolleyTable]  WITH CHECK ADD  CONSTRAINT [FK_TrolleyTable_FloorsTable] FOREIGN KEY([FloorsTrolley])
REFERENCES [dbo].[FloorsTable] ([PersonalNumberFloors])
GO
ALTER TABLE [dbo].[TrolleyTable] CHECK CONSTRAINT [FK_TrolleyTable_FloorsTable]
GO
ALTER TABLE [dbo].[WorkTable]  WITH CHECK ADD  CONSTRAINT [FK_WorkTable_TypeWorkTable1] FOREIGN KEY([TypeWork])
REFERENCES [dbo].[TypeWorkTable] ([PersonalNumberTypeWork])
GO
ALTER TABLE [dbo].[WorkTable] CHECK CONSTRAINT [FK_WorkTable_TypeWorkTable1]
GO
USE [master]
GO
ALTER DATABASE [DepoMaistrova] SET  READ_WRITE 
GO
