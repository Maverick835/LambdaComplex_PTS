USE [master]
GO
/****** Object:  Database [LambdaComplex]    Script Date: 26-03-2024 10:39:50 AM ******/
CREATE DATABASE [LambdaComplex]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LambdaComplex', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LambdaComplex.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LambdaComplex_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\LambdaComplex_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LambdaComplex] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LambdaComplex].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LambdaComplex] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LambdaComplex] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LambdaComplex] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LambdaComplex] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LambdaComplex] SET ARITHABORT OFF 
GO
ALTER DATABASE [LambdaComplex] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LambdaComplex] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LambdaComplex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LambdaComplex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LambdaComplex] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LambdaComplex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LambdaComplex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LambdaComplex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LambdaComplex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LambdaComplex] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LambdaComplex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LambdaComplex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LambdaComplex] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LambdaComplex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LambdaComplex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LambdaComplex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LambdaComplex] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LambdaComplex] SET RECOVERY FULL 
GO
ALTER DATABASE [LambdaComplex] SET  MULTI_USER 
GO
ALTER DATABASE [LambdaComplex] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LambdaComplex] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LambdaComplex] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LambdaComplex] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LambdaComplex] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LambdaComplex] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LambdaComplex', N'ON'
GO
ALTER DATABASE [LambdaComplex] SET QUERY_STORE = ON
GO
ALTER DATABASE [LambdaComplex] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LambdaComplex]
GO
/****** Object:  User [Server_Admin]    Script Date: 26-03-2024 10:39:50 AM ******/
CREATE USER [Server_Admin] FOR LOGIN [Server_Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl]    Script Date: 26-03-2024 10:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl](
	[ID] [varchar](36) NOT NULL,
	[EventDescription] [varchar](50) NULL,
	[EventDate] [datetime] NULL,
	[CreatedBy] [varchar](36) NOT NULL,
	[ModifiedBy] [varchar](36) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[EventPriority] [varchar](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LambdaComplex_User_Mst_Tbl]    Script Date: 26-03-2024 10:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LambdaComplex_User_Mst_Tbl](
	[ID] [varchar](36) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[EmailID] [varchar](200) NOT NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Role] [varchar](20) NULL,
	[MobileNumber] [char](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ([ID], [EventDescription], [EventDate], [CreatedBy], [ModifiedBy], [IsDeleted], [CreatedOn], [ModifiedOn], [EventPriority]) VALUES (N'03F5BA35-E358-41B0-BB66-93A0463D7662', N'my other event', CAST(N'2024-03-28T00:00:00.000' AS DateTime), N'6DCBDB95-9B96-4E07-A2DE-F6FC6E371812', N'6DCBDB95-9B96-4E07-A2DE-F6FC6E371812', 1, CAST(N'2024-03-26T10:33:10.823' AS DateTime), CAST(N'2024-03-26T10:33:19.170' AS DateTime), N'LOW')
INSERT [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ([ID], [EventDescription], [EventDate], [CreatedBy], [ModifiedBy], [IsDeleted], [CreatedOn], [ModifiedOn], [EventPriority]) VALUES (N'64F4321C-E3DF-4874-B569-112DCF69E8D9', N'My event', CAST(N'2024-03-27T00:00:00.000' AS DateTime), N'6DCBDB95-9B96-4E07-A2DE-F6FC6E371812', N'6DCBDB95-9B96-4E07-A2DE-F6FC6E371812', 1, CAST(N'2024-03-26T10:03:31.017' AS DateTime), CAST(N'2024-03-26T10:30:12.840' AS DateTime), N'LOW')
INSERT [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ([ID], [EventDescription], [EventDate], [CreatedBy], [ModifiedBy], [IsDeleted], [CreatedOn], [ModifiedOn], [EventPriority]) VALUES (N'B339DA99-688B-4720-8172-B1C3BAFAB179', N'My event', CAST(N'2024-03-27T00:00:00.000' AS DateTime), N'6DCBDB95-9B96-4E07-A2DE-F6FC6E371812', N'6DCBDB95-9B96-4E07-A2DE-F6FC6E371812', 0, CAST(N'2024-03-26T10:32:55.257' AS DateTime), CAST(N'2024-03-26T10:32:55.257' AS DateTime), N'LOW')
GO
INSERT [dbo].[LambdaComplex_User_Mst_Tbl] ([ID], [FirstName], [LastName], [Password], [UserName], [EmailID], [IsDeleted], [CreatedOn], [ModifiedOn], [Role], [MobileNumber]) VALUES (N'DE73D226-5B97-4800-B00A-71002378397E', N'Rishit', N'Selia', N'HIM~1»£Õ¬«n{·ªtÎ…ÔVV^õsvw²', N'Rishit.Selia', N'Rishit.Selia@gmail.com', 0, CAST(N'2024-03-12T22:54:20.747' AS DateTime), CAST(N'2024-03-24T11:38:30.993' AS DateTime), N'Admin', N'9099433022')
INSERT [dbo].[LambdaComplex_User_Mst_Tbl] ([ID], [FirstName], [LastName], [Password], [UserName], [EmailID], [IsDeleted], [CreatedOn], [ModifiedOn], [Role], [MobileNumber]) VALUES (N'6DCBDB95-9B96-4E07-A2DE-F6FC6E371812', N'Muneer', N'Ahmad', N'HIM~1»£Õ¬«n{·ªtÎ…ÔVV^õsvw²', N'Muneer.Ahmad', N'Muneer.Ahmad@gmail.com', 0, CAST(N'2024-03-25T09:25:09.920' AS DateTime), CAST(N'2024-03-25T09:25:09.920' AS DateTime), N'Dev', N'9090909090')
INSERT [dbo].[LambdaComplex_User_Mst_Tbl] ([ID], [FirstName], [LastName], [Password], [UserName], [EmailID], [IsDeleted], [CreatedOn], [ModifiedOn], [Role], [MobileNumber]) VALUES (N'2907AAE4-860A-430F-8DAB-62E1998911EA', N'Berlin', N'Singh', N'HIM~1»£Õ¬«n{·ªtÎ…ÔVV^õsvw²', N'Berlin.Singh', N'Berlin.Singh@gmail.com', 0, CAST(N'2024-03-25T09:25:50.130' AS DateTime), CAST(N'2024-03-25T09:25:50.130' AS DateTime), N'Dev', N'9090909090')
INSERT [dbo].[LambdaComplex_User_Mst_Tbl] ([ID], [FirstName], [LastName], [Password], [UserName], [EmailID], [IsDeleted], [CreatedOn], [ModifiedOn], [Role], [MobileNumber]) VALUES (N'8334276F-F2DB-42A8-A2B2-0558A1CD87D8', N'Afraa', N'Shariff', N'HIM~1»£Õ¬«n{·ªtÎ…ÔVV^õsvw²', N'Afraa.Shariff', N'Afraa.Shariff@gmail.com', 0, CAST(N'2024-03-25T09:26:18.760' AS DateTime), CAST(N'2024-03-25T09:26:18.760' AS DateTime), N'Lead', N'9090909090')
INSERT [dbo].[LambdaComplex_User_Mst_Tbl] ([ID], [FirstName], [LastName], [Password], [UserName], [EmailID], [IsDeleted], [CreatedOn], [ModifiedOn], [Role], [MobileNumber]) VALUES (N'48A23EE3-CBE6-4104-8D91-C435EBA89A84', N'Rajmukut', N'Gogoi', N'HIM~1»£Õ¬«n{·ªtÎ…ÔVV^õsvw²', N'Rajmukut.Gogoi', N'Rajmukut.Gogoi@gmail.com', 0, CAST(N'2024-03-25T09:26:38.097' AS DateTime), CAST(N'2024-03-25T09:26:38.097' AS DateTime), N'Dev', N'9090909090')
GO
ALTER TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ADD  DEFAULT ('') FOR [EventDescription]
GO
ALTER TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ADD  DEFAULT (getdate()) FOR [EventDate]
GO
ALTER TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[LambdaComplex_CalendarEvent_Trn_Tbl] ADD  DEFAULT ('MID') FOR [EventPriority]
GO
ALTER TABLE [dbo].[LambdaComplex_User_Mst_Tbl] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[LambdaComplex_User_Mst_Tbl] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LambdaComplex_User_Mst_Tbl] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[LambdaComplex_User_Mst_Tbl] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
USE [master]
GO
ALTER DATABASE [LambdaComplex] SET  READ_WRITE 
GO
