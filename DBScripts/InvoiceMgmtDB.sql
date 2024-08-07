USE [master]
GO
/****** Object:  Database [InvoiceMgmt]    Script Date: 7/5/2024 9:24:12 PM ******/
CREATE DATABASE [InvoiceMgmt] ON  PRIMARY 
( NAME = N'InvoiceMgmt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\InvoiceMgmt.mdf' , SIZE = 5376KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InvoiceMgmt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\InvoiceMgmt_log.LDF' , SIZE = 504KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InvoiceMgmt] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InvoiceMgmt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InvoiceMgmt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET ARITHABORT OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [InvoiceMgmt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InvoiceMgmt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InvoiceMgmt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InvoiceMgmt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InvoiceMgmt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InvoiceMgmt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [InvoiceMgmt] SET  MULTI_USER 
GO
ALTER DATABASE [InvoiceMgmt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InvoiceMgmt] SET DB_CHAINING OFF 
GO
USE [InvoiceMgmt]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/5/2024 9:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[companyId] [uniqueidentifier] NOT NULL,
	[firstName] [nvarchar](500) NOT NULL,
	[LastName] [nvarchar](500) NOT NULL,
	[addressLine] [nvarchar](100) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[states] [nvarchar](50) NOT NULL,
	[pincode] [nvarchar](30) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[email_id] [nvarchar](50) NOT NULL,
	[createdOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErroLog]    Script Date: 7/5/2024 9:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErroLog](
	[id] [int] IDENTITY(1000,1) NOT NULL,
	[methodName] [nvarchar](200) NOT NULL,
	[errorMsg] [nvarchar](max) NOT NULL,
	[loggedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 7/5/2024 9:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[invoiceNo] [int] IDENTITY(1000,1) NOT NULL,
	[companyId] [uniqueidentifier] NOT NULL,
	[customerId] [int] NOT NULL,
	[invoiceDate] [datetime] NULL,
	[subTotal] [decimal](18, 2) NOT NULL,
	[gstRate] [decimal](18, 2) NOT NULL,
	[totalAmt] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoiceNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemsDetails]    Script Date: 7/5/2024 9:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsDetails](
	[invoiceNo] [int] NOT NULL,
	[itemName] [nvarchar](500) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 7/5/2024 9:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[companyId] [uniqueidentifier] NOT NULL,
	[companyName] [nvarchar](100) NULL,
	[addressLine] [nvarchar](500) NULL,
	[city] [nvarchar](50) NULL,
	[states] [nvarchar](50) NULL,
	[pincode] [nvarchar](30) NULL,
	[phone] [nvarchar](10) NULL,
	[email_id] [nvarchar](100) NULL,
	[createdOn] [datetime] NULL,
	[gstNo] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[ErroLog] ADD  DEFAULT (getdate()) FOR [loggedDate]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [invoiceDate]
GO
ALTER TABLE [dbo].[UserAccount] ADD  DEFAULT (getdate()) FOR [createdOn]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([companyId])
REFERENCES [dbo].[UserAccount] ([companyId])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([companyId])
REFERENCES [dbo].[UserAccount] ([companyId])
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([customerId])
GO
ALTER TABLE [dbo].[ItemsDetails]  WITH CHECK ADD FOREIGN KEY([invoiceNo])
REFERENCES [dbo].[Invoices] ([invoiceNo])
GO
USE [master]
GO
ALTER DATABASE [InvoiceMgmt] SET  READ_WRITE 
GO
