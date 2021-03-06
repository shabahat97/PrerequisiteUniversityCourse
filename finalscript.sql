USE [master]
GO
/****** Object:  Database [StudentStreamingDB]    Script Date: 2/25/2021 4:56:51 PM ******/
CREATE DATABASE [StudentStreamingDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentStreamingDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StudentStreamingDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentStreamingDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StudentStreamingDB_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudentStreamingDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentStreamingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentStreamingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudentStreamingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentStreamingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentStreamingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentStreamingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentStreamingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentStreamingDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentStreamingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentStreamingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentStreamingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentStreamingDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentStreamingDB', N'ON'
GO
USE [StudentStreamingDB]
GO
/****** Object:  StoredProcedure [dbo].[get_SelectedCourse]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[get_SelectedCourse]
@CourseId int
AS
BEGIN
SELECT CourseID,CourseName FROM Course where CourseID=@CourseId;
END




GO
/****** Object:  Table [dbo].[AcademicStudentResult]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcademicStudentResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Grade] [varchar](5) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[Crhrs] [int] NOT NULL,
	[TermID] [int] NOT NULL,
 CONSTRAINT [PK_AcademicStudentResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](200) NULL,
	[Password] [varchar](200) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
	[CourseCreatedDate] [datetime] NOT NULL,
	[CrHrs] [nvarchar](50) NULL,
	[CourseCode] [nvarchar](50) NULL,
	[ClassType] [nvarchar](50) NULL,
	[ThemeColor] [nvarchar](50) NULL,
	[BeginsAt] [datetime] NULL,
	[EndsAt] [datetime] NULL,
	[CourseType] [varchar](100) NULL,
	[RoomName] [nvarchar](50) NULL,
	[No_Of_Seats] [int] NULL,
	[TermID] [int] NULL,
	[PrerequisiteID] [int] NULL,
	[TestName] [nvarchar](50) NULL,
	[TestTermName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course_has_PreRequisite]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_has_PreRequisite](
	[CourseID] [int] NOT NULL,
	[PrerequisiteID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prerequisites]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prerequisites](
	[PrerequisiteID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_Prerequisite] PRIMARY KEY CLUSTERED 
(
	[PrerequisiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Capacity] [int] NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](200) NULL,
	[APNo] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentCourseSelection]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentCourseSelection](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](100) NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourseSelection] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Grade] [varchar](5) NOT NULL,
	[Total] [decimal](18, 0) NOT NULL,
	[Crhrs] [int] NOT NULL,
	[TermID] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Term]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[TermID] [int] IDENTITY(1,1) NOT NULL,
	[TermName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[TermID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TimeTable]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](1000) NULL,
	[Credits] [nvarchar](1000) NULL,
	[ClassType] [nvarchar](1000) NULL,
	[CourseType] [nvarchar](1000) NULL,
	[BeginsAt] [datetime] NULL,
	[EndsAt] [datetime] NULL,
	[ThemeColor] [nvarchar](1000) NULL,
	[StudentId] [int] NULL,
	[RoomName] [nvarchar](1000) NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 2/25/2021 4:56:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tutor](
	[TutorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
 CONSTRAINT [PK_Tutor] PRIMARY KEY CLUSTERED 
(
	[TutorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[StudentResult]  WITH CHECK ADD  CONSTRAINT [FK_StudentResult_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentResult] CHECK CONSTRAINT [FK_StudentResult_Course]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Student]
GO
USE [master]
GO
ALTER DATABASE [StudentStreamingDB] SET  READ_WRITE 
GO
