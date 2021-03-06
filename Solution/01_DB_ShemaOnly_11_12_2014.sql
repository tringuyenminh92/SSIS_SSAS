USE [master]
GO
/****** Object:  Database [ERP_BH]    Script Date: 11/12/2014 6:02:15 PM ******/
CREATE DATABASE [ERP_BH] ON  PRIMARY 
( NAME = N'ERP_BH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ERP_BH.mdf' , SIZE = 22784KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ERP_BH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ERP_BH_log.LDF' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ERP_BH] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERP_BH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERP_BH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERP_BH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERP_BH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERP_BH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERP_BH] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERP_BH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ERP_BH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERP_BH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERP_BH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERP_BH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERP_BH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERP_BH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERP_BH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERP_BH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERP_BH] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ERP_BH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERP_BH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERP_BH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERP_BH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERP_BH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERP_BH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERP_BH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERP_BH] SET RECOVERY FULL 
GO
ALTER DATABASE [ERP_BH] SET  MULTI_USER 
GO
ALTER DATABASE [ERP_BH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ERP_BH] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ERP_BH', N'ON'
GO
USE [ERP_BH]
GO
/****** Object:  Table [dbo].[Banhang]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banhang](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Banhang_id]  DEFAULT (newid()),
	[maqd] [nvarchar](255) NULL,
	[tench] [nvarchar](255) NULL,
	[makh] [uniqueidentifier] NULL,
	[tenkh] [nvarchar](255) NULL,
	[thang] [nvarchar](255) NULL,
	[quy] [nvarchar](255) NULL,
	[nam] [nvarchar](255) NULL,
 CONSTRAINT [PK_Banhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BanhangTmp]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanhangTmp](
	[maqd] [nvarchar](255) NULL,
	[tench] [nvarchar](255) NULL,
	[makh] [nvarchar](255) NULL,
	[tenkh] [nvarchar](255) NULL,
	[thang] [nvarchar](255) NULL,
	[quy] [nvarchar](255) NULL,
	[nam] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cuahang]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuahang](
	[tench] [nvarchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Cuahang_id]  DEFAULT (newid()),
 CONSTRAINT [PK_Cuahang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhsanhHanghoaGoc]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhsanhHanghoaGoc](
	[mahh] [nvarchar](50) NULL,
	[tenhh] [nvarchar](50) NULL,
	[chungloai] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimCuahang]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCuahang](
	[tench] [nvarchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DimCuahang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimHanghoa]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimHanghoa](
	[id] [uniqueidentifier] NOT NULL,
	[mahh] [nvarchar](255) NULL,
	[tenhh] [nvarchar](255) NULL,
	[chungloai] [nvarchar](255) NULL,
 CONSTRAINT [PK_DimHanghoa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimKhachhang]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimKhachhang](
	[id] [uniqueidentifier] NOT NULL,
	[makh] [nvarchar](255) NULL,
	[tenkh] [nvarchar](255) NULL,
	[phai] [nvarchar](255) NULL,
 CONSTRAINT [PK_DimKhachhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimKhuvuc]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimKhuvuc](
	[id] [uniqueidentifier] NOT NULL,
	[makv] [nvarchar](255) NULL,
	[thanhpho] [nvarchar](255) NULL,
	[quocgia] [nvarchar](255) NULL,
	[vungmien] [nvarchar](255) NULL,
 CONSTRAINT [PK_DimKhuvuc] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimThoigian]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimThoigian](
	[thang] [int] NULL,
	[quy] [int] NULL,
	[nam] [int] NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DimThoigian] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[saledetailid] [uniqueidentifier] NOT NULL,
	[saleid] [uniqueidentifier] NOT NULL,
	[mahh] [uniqueidentifier] NOT NULL,
	[makh] [uniqueidentifier] NOT NULL,
	[thoigianid] [uniqueidentifier] NOT NULL,
	[soluong] [int] NULL,
	[dongia] [float] NULL,
	[thanhtien] [float] NULL,
	[makv] [uniqueidentifier] NULL,
	[mach] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[saledetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hanghoa]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hanghoa](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Hanghoa_id]  DEFAULT (newid()),
	[mahh] [nvarchar](255) NULL,
	[tenhh] [nvarchar](255) NULL,
	[chungloai] [nvarchar](255) NULL,
	[ghichu] [nvarchar](255) NULL,
 CONSTRAINT [PK_Hanghoa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HanghoaTmp]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HanghoaTmp](
	[tenhh] [nvarchar](255) NULL,
	[ghichu] [nvarchar](255) NULL,
	[mahh] [nvarchar](255) NULL,
	[chungloai] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Khachhang_id]  DEFAULT (newid()),
	[makh] [nvarchar](255) NULL,
	[tenkh] [nvarchar](255) NULL,
	[phai] [nvarchar](255) NULL,
	[makv] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachhangTmp]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachhangTmp](
	[makh] [nvarchar](255) NULL,
	[tenkh] [nvarchar](255) NULL,
	[phai] [nvarchar](255) NULL,
	[makv] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khuvuc]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khuvuc](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Khuvuc_id]  DEFAULT (newid()),
	[makv] [nvarchar](255) NULL,
	[thanhpho] [nvarchar](255) NULL,
	[quocgia] [nvarchar](255) NULL,
	[vungmien] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuvucTmp]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuvucTmp](
	[makv] [nvarchar](255) NULL,
	[quocgia] [nvarchar](255) NULL,
	[vungmien] [nvarchar](255) NULL,
	[thanhpho] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleDetail]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetail](
	[mahh] [uniqueidentifier] NULL,
	[soluong] [nvarchar](255) NULL,
	[dongia] [nvarchar](255) NULL,
	[thanhtien] [nvarchar](255) NULL,
	[masale] [nvarchar](255) NULL,
	[saleid] [uniqueidentifier] NULL,
	[saledetailid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_SaleDetail_saledetailid]  DEFAULT (newid()),
 CONSTRAINT [PK_SaleDetail] PRIMARY KEY CLUSTERED 
(
	[saledetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleDetailTmp]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetailTmp](
	[mahh] [nvarchar](255) NULL,
	[makh] [nvarchar](255) NULL,
	[soluong] [nvarchar](255) NULL,
	[dongia] [nvarchar](255) NULL,
	[thanhtien] [nvarchar](255) NULL,
	[masale] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Thoigian]    Script Date: 11/12/2014 6:02:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thoigian](
	[thang] [int] NULL,
	[quy] [int] NULL,
	[nam] [int] NULL,
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Thoigian_id]  DEFAULT (newid()),
 CONSTRAINT [PK_Thoigian] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [ERP_BH] SET  READ_WRITE 
GO
