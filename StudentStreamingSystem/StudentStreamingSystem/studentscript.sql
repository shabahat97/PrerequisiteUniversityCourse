USE [StudentStreamingDBB]
GO
/****** Object:  StoredProcedure [dbo].[get_SelectedCourse]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[AcademicStudentResult]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 2/24/2021 3:36:36 PM ******/
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
	[Programme] [nvarchar](50) not NULL,
	[Campus] [nvarchar](50) not NULL,
	[Streams] [nvarchar](50) not NULL,
	[CourseNo] [nvarchar](50) NULL,
	[ClassType] [nvarchar](50) NULL,
	[ThemeColor] [nvarchar](50) NULL,
	[BeginsAt] [datetime] NULL,
	[EndsAt] [datetime] NULL,
	[CourseType] [varchar](100) NULL,
	[RoomName] [nvarchar](50) NULL,
	[No_Of_Seats] [int] NULL,
	[TermID] [int] NULL,
	[PrerequisiteID] [int] NULL,
 CONSTRAINT [PK_dbo.Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Course_has_PreRequisite]    Script Date: 2/24/2021 3:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_has_PreRequisite](
	[CourseID] [int] NOT NULL,
	[PrerequisiteID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prerequisites]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[Rooms]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[StudentCourseSelection]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[StudentResult]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[Term]    Script Date: 2/24/2021 3:36:36 PM ******/
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
/****** Object:  Table [dbo].[TimeTable]    Script Date: 2/24/2021 3:36:36 PM ******/
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
	[Campus] [nvarchar](1000) NULL,
 CONSTRAINT [PK_TimeTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 2/24/2021 3:36:36 PM ******/
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
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [Email], [Password]) VALUES (1, N'shabahat@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseCreatedDate], [CrHrs], [CourseCode], [ClassType], [ThemeColor], [BeginsAt], [EndsAt], [CourseType], [RoomName], [No_Of_Seats], [TermID], [PrerequisiteID]) VALUES (1, N'IT4100 IT Essentials ', CAST(0x0000ACD801211D26 AS DateTime), N'3', N'IT4100 ', N'Lecture', N'green', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'Compulsory', N'B101', 20, 1, 1)
INSERT [dbo].[Course] ([CourseID], [CourseName], [CourseCreatedDate], [CrHrs], [CourseCode], [ClassType], [ThemeColor], [BeginsAt], [EndsAt], [CourseType], [RoomName], [No_Of_Seats], [TermID], [PrerequisiteID]) VALUES (1003, N'Fyp IT Essential', CAST(0x0000ACD801211D26 AS DateTime), N'3', N'ITFYP', N'Lecture', N'green', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'Compulsory', N'B102', 19, 1, 1)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Prerequisites] ON 

INSERT [dbo].[Prerequisites] ([PrerequisiteID], [Name], [Description], [Credits]) VALUES (1, N'OAAD', N'OAAD course', 3)
INSERT [dbo].[Prerequisites] ([PrerequisiteID], [Name], [Description], [Credits]) VALUES (2, N'None', N'None', 0)
SET IDENTITY_INSERT [dbo].[Prerequisites] OFF
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [Name], [Capacity]) VALUES (1, N'1', 16)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [Email], [APNo]) VALUES (1, N'shabahatalichishti@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentCourseSelection] ON 

INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (3, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (4, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (5, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (6, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (7, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (8, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (9, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (10, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (11, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (12, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (13, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (14, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (15, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (16, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (17, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (18, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (19, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (20, N'Fyp IT Essential', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B102', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (21, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (22, N'Fyp IT Essential', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B102', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (23, N'IT4100 IT Essentials ', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B101', 1)
INSERT [dbo].[StudentCourseSelection] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentID], [RoomName], [TermID]) VALUES (24, N'Fyp IT Essential', 3, N'Lecture', N'Compulsory', CAST(0x0000AC4B009450C0 AS DateTime), CAST(0x0000AC4B00AD08E0 AS DateTime), N'green', 1, N'B102', 1)
SET IDENTITY_INSERT [dbo].[StudentCourseSelection] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([ID], [StudentID], [CourseID], [Grade], [Total], [Crhrs], [TermID]) VALUES (1, 1, 1, N'A', CAST(87 AS Decimal(18, 0)), 3, 1)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Term] ON 

INSERT [dbo].[Term] ([TermID], [TermName]) VALUES (1, N'Spring 2021')
SET IDENTITY_INSERT [dbo].[Term] OFF
SET IDENTITY_INSERT [dbo].[TimeTable] ON 

INSERT [dbo].[TimeTable] ([ID], [CourseName], [Credits], [ClassType], [CourseType], [BeginsAt], [EndsAt], [ThemeColor], [StudentId], [RoomName], [Campus]) VALUES (1, N'CS7502 Special Topic in Cyber Security', N'15', N'Lab', N'Compulsory', CAST(0x0000AC5000E975A0 AS DateTime), CAST(0x0000AC5000EEF3E0 AS DateTime), NULL, 1, N'B130', N'Petone')
SET IDENTITY_INSERT [dbo].[TimeTable] OFF
SET IDENTITY_INSERT [dbo].[Tutor] ON 

INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (1, N'Aristotle Santos', N'Santos@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (2, N'Clement Sudhakar', N'Sudhakar@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (3, N'Diana Eyes', N'Eyes@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (4, N'Dr Waqar Khan', N'Khan@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (5, N'Dr. Anthony Allsobrook', N'Santos@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (6, N'Dr. Dax Roberts', N'Roberts@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (7, N'Dr. Reza Hajmoosaei', N'Hajmoosaei@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (8, N'Dr. Steve McKinlay', N'McKinlay@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (9, N'Dr. Yuliya Khrypko', N'Khrypko@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (10, N'Drew Duncan', N'Duncan@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (11, N'Glenda Shaw', N'Shaw@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (12, N'Ian Hunter', N'Hunter@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (13, N'Jeff Echano', N'Echano@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (14, N'Manish Singh', N'Singh@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (15, N'Nick Tullock', N'Tullock@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (16, N'Paul Bryant', N'Bryant@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (17, N'Richa Panjabi', N'Panjabi@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (18, N'Robert Sutcliffe', N'Sutcliffe@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (19, N'Sandeep Vankadari', N'Vankadari@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (20, N'Steve Cosgrove', N'Cosgrove@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (21, N'Sue Scott', N'Scott@gmail.com')
INSERT [dbo].[Tutor] ([TutorID], [Name], [Email]) VALUES (22, N'Terry Jeon', N'Jeon@gmail.com')
SET IDENTITY_INSERT [dbo].[Tutor] OFF
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Prerequisites] FOREIGN KEY([PrerequisiteID])
REFERENCES [dbo].[Prerequisites] ([PrerequisiteID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Courses_Prerequisites]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Term] FOREIGN KEY([TermID])
REFERENCES [dbo].[Term] ([TermID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Courses_Term]
GO
ALTER TABLE [dbo].[StudentCourseSelection]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseSelection_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentCourseSelection] CHECK CONSTRAINT [FK_StudentCourseSelection_Student]
GO
ALTER TABLE [dbo].[StudentCourseSelection]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseSelection_Term] FOREIGN KEY([TermID])
REFERENCES [dbo].[Term] ([TermID])
GO
ALTER TABLE [dbo].[StudentCourseSelection] CHECK CONSTRAINT [FK_StudentCourseSelection_Term]
GO
ALTER TABLE [dbo].[TimeTable]  WITH CHECK ADD  CONSTRAINT [FK_TimeTable_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[TimeTable] CHECK CONSTRAINT [FK_TimeTable_Student]
GO
USE [master]
GO
ALTER DATABASE [StudentStreamingDBB] SET  READ_WRITE 
GO
