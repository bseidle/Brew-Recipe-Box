USE [master]
GO
ALTER DATABASE [BrewDb] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
/****** Object:  Database [BrewDb]    Script Date: 10/18/2012 7:38:06 AM ******/
DROP DATABASE [BrewDb]
GO
/****** Object:  Database [BrewDb]    Script Date: 10/17/2012 12:26:02 PM ******/
CREATE DATABASE [BrewDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BrewDb', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.EXPRESS2012\MSSQL\DATA\BrewDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BrewDb_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.EXPRESS2012\MSSQL\DATA\BrewDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BrewDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BrewDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BrewDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BrewDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BrewDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BrewDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BrewDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BrewDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BrewDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BrewDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BrewDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BrewDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BrewDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BrewDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BrewDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BrewDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BrewDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BrewDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BrewDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BrewDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BrewDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BrewDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BrewDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BrewDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BrewDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BrewDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BrewDb] SET  MULTI_USER 
GO
ALTER DATABASE [BrewDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BrewDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BrewDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BrewDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BrewDb]
GO
/****** Object:  Table [dbo].[BrewLog]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrewLog](
	[BrewLogId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_BrewLog] PRIMARY KEY CLUSTERED 
(
	[BrewLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BrewLogEntry]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrewLogEntry](
	[BrewLogEntryId] [int] IDENTITY(1,1) NOT NULL,
	[BrewLogDate] [datetime] NULL,
	[BrewLogText] [text] NULL,
	[BrewLogId] [int] NULL,
 CONSTRAINT [PK_BrewEntryLog] PRIMARY KEY CLUSTERED 
(
	[BrewLogEntryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Recipe](
	[RecipeId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeName] [varchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Recipe] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecipeIngredient]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeIngredient](
	[RecipeIngredientId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NULL,
	[IngredientId] [int] NULL,
	[IngredientQuantity] [decimal](18, 0) NULL,
	[IngredientDuration] [int] NULL,
	[UnitId] [int] NULL,
 CONSTRAINT [PK_RecipeIngredient] PRIMARY KEY CLUSTERED 
(
	[RecipeIngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RecipeStep]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipeStep](
	[RecipeStepId] [int] IDENTITY(1,1) NOT NULL,
	[RecipeId] [int] NULL,
	[StepId] [int] NULL,
 CONSTRAINT [PK_RecipeStep] PRIMARY KEY CLUSTERED 
(
	[RecipeStepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Step]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Step](
	[StepId] [int] IDENTITY(1,1) NOT NULL,
	[StepName] [varchar](50) NOT NULL,
	[StepTypeId] [int] NULL,
	[StepNote] [text] NULL,
 CONSTRAINT [PK_Step] PRIMARY KEY CLUSTERED 
(
	[StepId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitId] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [varchar](50) NULL,
	[UnitSymbol] [varchar](50) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
	[UserRoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleName] [varchar](50) NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSettings]    Script Date: 12/11/2012 7:35:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserSettings](
	[UserSettingId] [int] IDENTITY(1,1) NOT NULL,
	[UserSettingKey] [varchar](50) NULL,
	[UserSettingValue] [varchar](50) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserSetting] PRIMARY KEY CLUSTERED 
(
	[UserSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
GO
CREATE TABLE [dbo].[Ingredient](
	[IngredientId] [int] IDENTITY(1,1) NOT NULL,
	[IngredientTypeId] [int] NOT NULL,
	[IngredientName] [varchar](50) NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientProperties]    Script Date: 12/11/2012 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientProperties](
	[IngredientPropertyId] [int] IDENTITY(1,1) NOT NULL,
	[IngredientId] [int] NOT NULL,
	[IngredientPropertyValue] [decimal](18, 0) NULL,
	[IngredientTypePropertyId] [int] NOT NULL,
 CONSTRAINT [PK_IngredientProperties] PRIMARY KEY CLUSTERED 
(
	[IngredientPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IngredientSubType]    Script Date: 12/11/2012 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientSubType](
	[IngredientSubTypeId] [int] IDENTITY(1,1) NOT NULL,
	[IngredientSubTypeName] [varchar](50) NULL,
	[IngredientTypeId] [int] NOT NULL,
 CONSTRAINT [PK_IngredientSubType] PRIMARY KEY CLUSTERED 
(
	[IngredientSubTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientType]    Script Date: 12/11/2012 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientType](
	[IngredientTypeId] [int] IDENTITY(1,1) NOT NULL,
	[IngredientSubTypeId] [int] NOT NULL,
	[IngredientTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_IngredientType] PRIMARY KEY CLUSTERED 
(
	[IngredientTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IngredientTypeProperties]    Script Date: 12/11/2012 9:42:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IngredientTypeProperties](
	[IngredientTypePropertyId] [int] IDENTITY(1,1) NOT NULL,
	[IngredientTypeId] [int] NOT NULL,
	[IngredientTypePropertyName] [varchar](50) NULL,
 CONSTRAINT [PK_IngredientTypeProperties] PRIMARY KEY CLUSTERED 
(
	[IngredientTypePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Ingredient_IngredientType] FOREIGN KEY([IngredientTypeId])
REFERENCES [dbo].[IngredientType] ([IngredientTypeId])
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [FK_Ingredient_IngredientType]
GO
ALTER TABLE [dbo].[IngredientProperties]  WITH CHECK ADD  CONSTRAINT [FK_IngredientProperties_Ingredient] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([IngredientId])
GO
ALTER TABLE [dbo].[IngredientProperties] CHECK CONSTRAINT [FK_IngredientProperties_Ingredient]
GO
ALTER TABLE [dbo].[IngredientProperties]  WITH CHECK ADD  CONSTRAINT [FK_IngredientProperties_IngredientTypeProperties] FOREIGN KEY([IngredientTypePropertyId])
REFERENCES [dbo].[IngredientTypeProperties] ([IngredientTypePropertyId])
GO
ALTER TABLE [dbo].[IngredientProperties] CHECK CONSTRAINT [FK_IngredientProperties_IngredientTypeProperties]
GO
ALTER TABLE [dbo].[IngredientSubType]  WITH CHECK ADD  CONSTRAINT [FK_IngredientSubType_IngredientType] FOREIGN KEY([IngredientTypeId])
REFERENCES [dbo].[IngredientType] ([IngredientTypeId])
GO
ALTER TABLE [dbo].[IngredientSubType] CHECK CONSTRAINT [FK_IngredientSubType_IngredientType]
GO
ALTER TABLE [dbo].[IngredientTypeProperties]  WITH CHECK ADD  CONSTRAINT [FK_IngredientTypeProperties_IngredientType] FOREIGN KEY([IngredientTypeId])
REFERENCES [dbo].[IngredientType] ([IngredientTypeId])
GO
ALTER TABLE [dbo].[IngredientTypeProperties] CHECK CONSTRAINT [FK_IngredientTypeProperties_IngredientType]
GO
ALTER TABLE [dbo].[BrewLog]  WITH CHECK ADD  CONSTRAINT [FK_BrewLog_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[BrewLog] CHECK CONSTRAINT [FK_BrewLog_Recipe]
GO
ALTER TABLE [dbo].[BrewLog]  WITH CHECK ADD  CONSTRAINT [FK_BrewLog_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[BrewLog] CHECK CONSTRAINT [FK_BrewLog_User]
GO
ALTER TABLE [dbo].[BrewLogEntry]  WITH CHECK ADD  CONSTRAINT [FK_BrewLog_BrewLogEntry] FOREIGN KEY([BrewLogId])
REFERENCES [dbo].[BrewLog] ([BrewLogId])
GO
ALTER TABLE [dbo].[BrewLogEntry] CHECK CONSTRAINT [FK_BrewLog_BrewLogEntry]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Recipe_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Recipe_User]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Ingredient] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([IngredientId])
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Ingredient]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Recipe]
GO
ALTER TABLE [dbo].[RecipeIngredient]  WITH CHECK ADD  CONSTRAINT [FK_RecipeIngredient_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[RecipeIngredient] CHECK CONSTRAINT [FK_RecipeIngredient_Unit]
GO
ALTER TABLE [dbo].[RecipeStep]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStep_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipe] ([RecipeId])
GO
ALTER TABLE [dbo].[RecipeStep] CHECK CONSTRAINT [FK_RecipeStep_Recipe]
GO
ALTER TABLE [dbo].[RecipeStep]  WITH CHECK ADD  CONSTRAINT [FK_RecipeStep_Step] FOREIGN KEY([StepId])
REFERENCES [dbo].[Step] ([StepId])
GO
ALTER TABLE [dbo].[RecipeStep] CHECK CONSTRAINT [FK_RecipeStep_Step]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_UserRole] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[UserRole] ([UserRoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_UserRole]
GO
ALTER TABLE [dbo].[UserSettings]  WITH CHECK ADD  CONSTRAINT [FK_User_UserSettings] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserSettings] CHECK CONSTRAINT [FK_User_UserSettings]
GO
