USE [master]
GO
/****** Object:  Database [ERP_BH]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[BanhangTmp]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[Cuahang]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[DanhsanhHanghoaGoc]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[DimCuahang]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[DimHanghoa]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[DimKhachhang]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[DimKhuvuc]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[DimThoigian]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[FactSales]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[HanghoaTmp]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[KhachhangTmp]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[KhuvucTmp]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[SaleDetailTmp]    Script Date: 11/12/2014 7:11:56 PM ******/
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
/****** Object:  Table [dbo].[tbBanhang]    Script Date: 11/12/2014 7:11:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbBanhang](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Banhang_id]  DEFAULT (newid()),
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
/****** Object:  Table [dbo].[tbChitietBanhang]    Script Date: 11/12/2014 7:11:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbChitietBanhang](
	[mahh] [uniqueidentifier] NULL,
	[soluong] [nvarchar](255) NULL,
	[dongia] [nvarchar](255) NULL,
	[thanhtien] [nvarchar](255) NULL,
	[saledetailid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_SaleDetail_saledetailid]  DEFAULT (newid()),
 CONSTRAINT [PK_SaleDetail] PRIMARY KEY CLUSTERED 
(
	[saledetailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbHanghoa]    Script Date: 11/12/2014 7:11:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHanghoa](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Hanghoa_id]  DEFAULT (newid()),
	[tenhh] [nvarchar](255) NULL,
	[chungloai] [nvarchar](255) NULL,
	[ghichu] [nvarchar](255) NULL,
 CONSTRAINT [PK_Hanghoa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbKhachhang]    Script Date: 11/12/2014 7:11:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbKhachhang](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Khachhang_id]  DEFAULT (newid()),
	[tenkh] [nvarchar](255) NULL,
	[phai] [nvarchar](255) NULL,
	[makv] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbKhuvuc]    Script Date: 11/12/2014 7:11:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbKhuvuc](
	[id] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Khuvuc_id]  DEFAULT (newid()),
	[thanhpho] [nvarchar](255) NULL,
	[quocgia] [nvarchar](255) NULL,
	[vungmien] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Thoigian]    Script Date: 11/12/2014 7:11:56 PM ******/
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
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0011', N'Cửa hàng thực phẩm số 1', N'Cus0131', N'Cus0131', N'1', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0016', N'Cửa hàng thực phẩm số 2', N'Cus0131', N'Cus0131', N'7', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0012', N'Cửa hàng thực phẩm số 3', N'Cus0132', N'Cus0132', N'1', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0015', N'Cửa hàng thực phẩm số 3', N'Cus0132', N'Cus0132', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0017', N'Cửa hàng thực phẩm số 1', N'Cus0141', N'Cus0141', N'9', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0013', N'Cửa hàng thực phẩm số 2', N'Cus0141', N'Cus0141', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0019', N'Cửa hàng thực phẩm số 2', N'Cus0142', N'Cus0142', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0014', N'Cửa hàng thực phẩm số 3', N'Cus0142', N'Cus0142', N'4', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0025', N'Cửa hàng thực phẩm số 1', N'Cus0151', N'Cus0151', N'7', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0024', N'Cửa hàng thực phẩm số 1', N'Cus0151', N'Cus0151', N'6', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0023', N'Cửa hàng thực phẩm số 2', N'Cus0152', N'Cus0152', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0027', N'Cửa hàng thực phẩm số 2', N'Cus0152', N'Cus0152', N'9', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0028', N'Cửa hàng thực phẩm số 2', N'Cus0153', N'Cus0153', N'10', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0026', N'Cửa hàng thực phẩm số 1', N'Cus0153', N'Cus0153', N'8', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0030', N'Cửa hàng thực phẩm số 2', N'Cus0153', N'Cus0153', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0022', N'Cửa hàng thực phẩm số 3', N'Cus0153', N'Cus0153', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0021', N'Cửa hàng thực phẩm số 1', N'Cus0154', N'Cus0154', N'2', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0029', N'Cửa hàng thực phẩm số 1', N'Cus0154', N'Cus0154', N'11', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0018', N'Cửa hàng thực phẩm số 1', N'Cus0161', N'Cus0161', N'10', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0020', N'Cửa hàng thực phẩm số 3', N'Cus0161', N'Cus0161', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0002', N'Orlando Grocery', N'Cus0111', N'Cus0111', N'1', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0001', N'Royal Blue Grocery', N'Cus0112', N'Cus0112', N'8', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0006', N'Royal Blue Grocery', N'Cus0113', N'Cus0113', N'3', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0004', N'Rainbow Grocery Store', N'Cus0121', N'Cus0121', N'2', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0007', N'Rainbow Grocery Store', N'Cus0121', N'Cus0121', N'11', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0008', N'Rainbow Grocery Store', N'Cus0121', N'Cus0121', N'11', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0003', N'Foodie Store', N'Cus0122', N'Cus0122', N'8', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0005', N'Foodie Store', N'Cus0123', N'Cus0123', N'10', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0009', N'Cửa hàng thực phẩm số 2', N'Cus0124', N'Cus0124', N'5', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0010', N'Cửa hàng thực phẩm số 2', N'Cus0125', N'Cus0125', N'6', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1', N'Cửa hàng Q.10', N'KH001', N'Trịnh Thanh Sang', N'1', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'2', N'Cửa hàng Q.5', N'KH001', N'Trịnh Thanh Sang', N'1', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'3', N'Cửa hàng thực phẩm số 1', N'KH005', N'Trần Phương Dung', N'2', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'4', N'Cửa hàng thực phẩm số 1', N'KH002', N'Lê Anh Minh', N'3', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'5', N'Royal Blue Grocery', N'KH011', N'Lê Thu Hương', N'3', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'6', N'Cửa hàng Q.10', N'KH001', N'Trịnh Thanh Sang', N'3', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'7', N'Cửa hàng Q.5', N'KH001', N'Trịnh Thanh Sang', N'4', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8', N'Rainbow Grocery Store', N'KH014', N'Justin S.', N'4', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'9', N'Cửa hàng thực phẩm số 4', N'KH005', N'Trần Phương Dung', N'5', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'10', N'Cửa hàng thực phẩm số 2', N'KH003', N'Phan Thanh Tú', N'5', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'11', N'Cửa hàng thực phẩm số 3', N'KH004', N'Trương Tấn Khoa', N'6', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'12', N'Orlando Grocery', N'KH012', N'Selena K.', N'6', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'13', N'Cửa hàng thực phẩm số 2', N'KH003', N'Phan Thanh Tú', N'7', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'14', N'Cửa hàng thực phẩm số 3', N'KH010', N'Phạm Ngọc Huy', N'7', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'15', N'Rainbow Grocery Store', N'KH014', N'Justin S.', N'8', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'16', N'Cửa hàng Q.10', N'KH015', N'Christain D.', N'8', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'17', N'Foodie Store', N'KH013', N'Roger L.', N'9', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'18', N'Cửa hàng thực phẩm số 3', N'KH004', N'Trương Tấn Khoa', N'10', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'19', N'Cửa hàng thực phẩm số 4', N'KH006', N'Nguyễn Ngọc Quỳnh', N'11', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'20', N'Cửa hàng thực phẩm số 4', N'KH007', N'Huỳnh Hà Thanh', N'11', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'21', N'Cửa hàng thực phẩm số 3', N'KH008', N'Lê Trọng Tín', N'12', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'22', N'Cửa hàng thực phẩm số 3', N'KH009', N'Nguyễn Thanh Phương', N'12', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'23', N'Cửa hàng Q.10', N'KH015', N'Christain D.', N'12', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'24', N'Cửa hàng thực phẩm số 4', N'KH006', N'Nguyễn Ngọc Quỳnh', N'12', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'25', N'Foodie Store', N'KH013', N'Roger L.', N'12', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'26', N'Cửa hàng Q.10', N'KH001', N'Trịnh Thanh Sang', N'1', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'27', N'Cửa hàng thực phẩm số 1', N'KH005', N'Trần Phương Dung', N'2', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'28', N'Cửa hàng thực phẩm số 1', N'KH002', N'Lê Anh Minh', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'29', N'Royal Blue Grocery', N'KH011', N'Lê Thu Hương', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'30', N'Cửa hàng Q.10', N'KH001', N'Trịnh Thanh Sang', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'31', N'Cửa hàng thực phẩm số 1', N'KH002', N'Lê Anh Minh', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'32', N'Royal Blue Grocery', N'KH014', N'Justin S.', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'33', N'Cửa hàng Q.5', N'KH001', N'Trịnh Thanh Sang', N'4', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'34', N'Rainbow Grocery Store', N'KH014', N'Justin S.', N'4', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'35', N'Cửa hàng thực phẩm số 4', N'KH005', N'Trần Phương Dung', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'36', N'Cửa hàng thực phẩm số 2', N'KH003', N'Phan Thanh Tú', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'37', N'Cửa hàng thực phẩm số 3', N'KH004', N'Trương Tấn Khoa', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'38', N'Orlando Grocery', N'KH012', N'Selena K.', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'39', N'Cửa hàng thực phẩm số 4', N'KH006', N'Nguyễn Ngọc Quỳnh', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'40', N'Cửa hàng thực phẩm số 3', N'KH004', N'Trương Tấn Khoa', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'41', N'Cửa hàng thực phẩm số 2', N'KH003', N'Phan Thanh Tú', N'6', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'42', N'Cửa hàng thực phẩm số 3', N'KH010', N'Phạm Ngọc Huy', N'6', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'43', N'Cửa hàng thực phẩm số 4', N'KH005', N'Trần Phương Dung', N'6', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'44', N'Rainbow Grocery Store', N'KH014', N'Justin S.', N'7', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'45', N'Cửa hàng Q.10', N'KH015', N'Christain D.', N'7', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'46', N'Rainbow Grocery Store', N'KH014', N'Justin S.', N'7', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'47', N'Foodie Store', N'KH013', N'Roger L.', N'8', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'48', N'Cửa hàng thực phẩm số 3', N'KH004', N'Trương Tấn Khoa', N'9', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'49', N'Cửa hàng thực phẩm số 4', N'KH006', N'Nguyễn Ngọc Quỳnh', N'10', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'50', N'Cửa hàng thực phẩm số 4', N'KH007', N'Huỳnh Hà Thanh', N'11', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'51', N'Cửa hàng thực phẩm số 3', N'KH008', N'Lê Trọng Tín', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'52', N'Cửa hàng thực phẩm số 3', N'KH009', N'Nguyễn Thanh Phương', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'53', N'Cửa hàng Q.10', N'KH015', N'Christain D.', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'54', N'Cửa hàng thực phẩm số 4', N'KH006', N'Nguyễn Ngọc Quỳnh', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'55', N'Foodie Store', N'KH013', N'Roger L.', N'12', N'4', N'2014')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 3', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 4', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Rainbow Grocery Store', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.10', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Royal Blue Grocery', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.5', N'470017c2-6767-46a2-adfa-b93fa30618c1')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 2', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Orlando Grocery', N'bc54794a-37e0-449d-8f91-c51d99ac7446')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 1', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Foodie Store', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH001', N'Trà xanh O2', N'Nước giải khát')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH002', N'Coca cola', N'Nước giải khát')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH003', N'Bánh ChocoPie', N'Bánh kẹo')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH004', N'Dầu ăn Tường An', N'Dầu ăn')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH005', N'Bánh AFC', N'Bánh kẹo')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH006', N'Dầu ăn Neptune', N'Dầu ăn')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH007', N'Bia Heineken', N'Nước giải khát')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH008', N'Pepsi', N'Nước giải khát')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH009', N'Cam ép Twister', N'Nước giải khát')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH010', N'Sữa đậu nành Soya', N'Nước giải khát')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH011', N'Bánh Hura', N'Bánh kẹo')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH012', N'Bánh Oreo', N'Bánh kẹo')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH013', N'Bánh Goute', N'Bánh kẹo')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH014', N'Kẹo Alpenliebe', N'Bánh kẹo')
INSERT [dbo].[DanhsanhHanghoaGoc] ([mahh], [tenhh], [chungloai]) VALUES (N'HH015', N'Kẹo Golia', N'Bánh kẹo')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 3', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 4', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Rainbow Grocery Store', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.10', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Royal Blue Grocery', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.5', N'470017c2-6767-46a2-adfa-b93fa30618c1')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 2', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Orlando Grocery', N'bc54794a-37e0-449d-8f91-c51d99ac7446')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 1', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Foodie Store', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'0_Bánh Cosy', N'Bánh Cosy', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'0_Bánh AFC', N'Bánh AFC', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'425c690f-7eb2-496b-8a11-18ae6bb32ef0', N'0_Bánh Custa', N'Bánh Custa', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'0_Pepsi', N'Pepsi', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'0_Bánh Oreo', N'Bánh Oreo', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'0_Dầu ăn Tường An', N'Dầu ăn Tường An', N'0_Dầu ăn')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'415b713a-5445-4ef4-a8db-2c1b9387e207', N'0_Snack khoai tây Slide', N'Snack khoai tây Slide', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'0_Cam ép Twister', N'Cam ép Twister', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'0_Trà xanh O2', N'Trà xanh O2', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'0_Bánh Hura', N'Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'a6127a7b-e761-4658-afcb-42e0c52ed586', N'0_Bánh Solo', N'Bánh Solo', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'0_Kẹo Alpenliebe', N'Kẹo Alpenliebe', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'0_Bánh ChocoPie', N'Bánh ChocoPie', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'0_Kẹo Golia', N'Kẹo Golia', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'da0ca760-2158-43f6-84cb-bc7290172722', N'HH010', N'Sữa đậu nành Soya', N'Nước giải khát')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'0_Bia Heineken', N'Bia Heineken', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'0_Bánh Goute', N'Bánh Goute', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'c4f9bf97-f0b9-4f27-a8e9-d149def351e2', N'0_Snack khoai tây O''star', N'Snack khoai tây O''star', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'HH006', N'Dầu ăn Neptune', N'Dầu ăn')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'0_Coca cola', N'Coca cola', N'0_Nước ngọt')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'a17ffef4-fa29-49d5-9729-070c5dfa1bae', N'KH010', N'Phạm Ngọc Huy', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'77083872-4ff7-44e1-a36d-28c9ce50d792', N'Cus0124', N'Nguyễn Thanh Hằng', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'KH006', N'Nguyễn Ngọc Quỳnh', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'e77966bc-9d7b-4090-9da1-3c69ad37cf7c', N'KH007', N'Huỳnh Hà Thanh', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'KH015', N'Christain D.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'798bf331-281b-4a18-af93-47d3c7c73996', N'KH005', N'Trần Phương Dung', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'Cus0141', N'Phạm Thanh Sơn', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'0cb90f4b-e45f-4278-860f-5be7fe7d9c7c', N'Cus0151', N'Lê Thành Tài', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'Cus0152', N'Trần Thanh Tâm', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'd19a7dd9-cc3c-4ce1-9f2c-724f235b41e0', N'Cus0122', N'Michael N.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'KH014', N'Justin S.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'9b34950d-b3d1-4f54-9a3c-84e98b72554d', N'KH009', N'Nguyễn Thanh Phương', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'KH003', N'Phan Thanh Tú', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'Cus0161', N'Nguyễn Cẩm Tú', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'Cus0132', N'Nguyễn Cao Cường', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'91901ca2-f0b4-4898-b76a-967545e8a103', N'Cus0142', N'Lê Mỹ Dung', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'KH004', N'Trương Tấn Khoa', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'KH002', N'Lê Anh Minh', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'549d189d-f616-42ec-b92a-a4bcafeaa246', N'KH008', N'Lê Trọng Tín', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'663750c3-515b-4c0b-8ab3-b569a2a492ab', N'KH011', N'Lê Thu Hương', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'Cus0131', N'Lê Thanh Bình', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'9eeb9786-9410-466e-ad2a-d334a31bb855', N'Cus0111', N'Jane.L', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'KH013', N'Roger L.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'7820b262-b107-47df-8b45-e243b6caf4fd', N'KH001', N'Trịnh Thanh Sang', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'059887cc-059f-483a-a4d3-e34a0d605aca', N'Cus0154', N'Phan Ngọc Đức', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'0ec69ded-9ef6-4981-936e-ea4f168ebe8c', N'Cus0112', N'Katerine.M', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'Cus0121', N'Richard S.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'8b76d5d2-91ea-4d54-9bd2-f2a641499904', N'KH012', N'Selena K.', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'e69f4363-556a-4734-af67-f7ddae254c91', N'Cus0123', N'Mick D.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'397cf326-8a40-478c-806f-f7f678a2818a', N'Cus0153', N'Trần Bình Minh', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'7a54a96c-9ac9-4068-b5b5-f92239afde96', N'Cus0113', N'John F.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'1bb12005-ab44-49f8-b77c-f9dda57866db', N'Cus0125', N'Lê Như Quỳnh', N'Nữ')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'2831e641-122d-43c1-a6f0-0d52f30915ab', N'KV10', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'e94688cf-d636-43ab-a946-12674ff053a7', N'KV01', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'746eec20-6ce4-487e-95ef-16b32ef7fb7b', N'Bình DươngSouthern VietnamVietnam', N'Bình Dương', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'c3319e1b-8d50-4ece-a122-30516dc874d9', N'KV12', N'San Antonio', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'619ee51d-ccbc-4c54-8090-32de0058febe', N'KV14', N'Atlanta', N'Hoa Kỳ', N'Georgia')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'4a0e0e82-82f7-4390-82bb-3680621d55d0', N'KV06', N'Ninh Bình', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'447833db-13fd-4145-b661-4a5e5cc0977e', N'Nam ĐịnhNorthern VietnamVietnam', N'Nam Định', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'a5bddd27-4585-4355-8911-4cdaafc0839b', N'AustinTexasUSA', N'Austin', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'aa315538-9776-4d7b-ba34-546f134267cd', N'Đồng NaiSouthern VietnamVietnam', N'Đồng Nai', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'5cbdf8d0-a23a-41df-8c50-5868d536302d', N'Hà NộiNorthern VietnamVietnam', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'd811e7f0-d8e1-42d4-ab1a-634877c748e9', N'Cần ThơSouthern VietnamVietnam', N'Cần Thơ', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'686576b5-18d1-4057-a21d-7384e61c9101', N'KV02', N'Bến Tre', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'56109e78-09cc-405b-92f8-792893dddd66', N'KV07', N'Hải Dương', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db', N'Quảng NgãiMiddle VietnamVietnam', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'f9baca32-adde-4f79-b58e-845dae309b03', N'KV11', N'Chicago', N'Hoa Kỳ', N'Illinois')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'9c9e8a7c-6743-4c32-8aa9-8b0e4e81261a', N'Hải PhòngNorthern VietnamVietnam', N'Hải Phòng', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'9023676d-d2e6-4a43-95e4-90247b4f96f3', N'KV09', N'Quảng Trị', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'232ae13d-0cbe-4840-a592-95110cd64772', N'Đà NẵngMiddle VietnamVietnam', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'5e0f3e3f-00b5-49bc-a8e2-96899a6c27e9', N'San FranciscoCaliforniaUSA', N'San Francisco', N'Hoa Kỳ', N'California')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'd0136e76-6551-4418-ab1b-a2a473f39a14', N'KV08', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'OrlandoFloridaUSA', N'Orlando', N'Hoa Kỳ', N'Florida')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'dddb68e1-387f-4173-8223-d0d25c54a1cf', N'KV04', N'Tiền Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'HCMSouthern VietnamVietnam', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'85947907-2819-4811-82fa-e733d5051da8', N'KV13', N'Columbus', N'Hoa Kỳ', N'Ohio')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a', N'KV05', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e', N'HuếMiddle VietnamVietnam', N'Huế', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'BostonNew JerseyUSA', N'Boston', N'Hoa Kỳ', N'New Jersey')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'77be66c7-ce26-4451-a2a4-f948c841de7d', N'KV03', N'Kiên Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'8d3a1e2a-eac3-4a36-8912-016532c406dc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'038bb1cf-5098-4daa-99cf-016ef34eba70')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'07fc968e-e2e7-4c69-b0f2-01e009524419')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'a41effd0-147b-449f-b55d-04665844b87e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'58747156-bbc8-4105-9a1a-04d72cadc3f2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'0ef3b442-738e-4e9d-9810-04da458f757f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e7e37ddf-2971-4fcc-8377-051ad2725554')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'caa4c220-d645-42cf-98a3-052489dc5da4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'ef059dfc-7215-492f-a235-063a1017b872')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'4a7efe8c-34a7-4054-8d07-065d073bca12')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0c8b611c-99b1-4afb-b337-0753063512e8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'72d957e4-a67a-4fec-9e16-093c84475ec3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'95be05c6-8936-42da-ba38-0a0a1bd23d92')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'4cf9ccd5-11ac-4f14-b630-0ac9dc08c9be')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'82cbdae0-a0c6-48f5-bab0-0ae9e41da885')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'c73cdc2b-b43c-4d9e-9162-0c7aee2d4a7d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'4a6baa7d-1c49-40da-9667-0d0222121068')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'86b39573-a8a9-4ebf-92e8-0df7693ef00a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'c09a6de3-80a6-48a7-b6cc-0f42c4d16048')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'9dee53cb-e6bf-421c-aee9-10bcd2a93922')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'ed750054-9929-49db-84b7-14a43d73509e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'593703f2-72e0-48ca-8b92-15366fa2f28c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'aef781e4-7631-4d7a-bcda-156857dabced')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'124d6f1d-b71f-4736-8736-16bca91517ce')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'de70e0df-59a1-4f67-9901-17641cafc1d1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'cfc900b1-f2af-4999-b658-17f6a90c77da')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'82aaf99a-5eb1-448a-ba2b-18245e3d006f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'58c6303b-911f-445a-a709-1a5f7dca7184')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'992a8851-58f4-4871-8453-1a6c4f91cb37')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'815f9a36-eb9a-4fad-9251-1b7c517f0328')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'9292e952-84c4-4ea4-8fd7-1d1bf059317c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'37796d93-4c4d-41e1-846e-1dad6ccd187b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'4f195f4e-0727-490e-92c7-1df871f35d3d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'5ba7621b-f18c-4f49-a71b-1e9e65c2e04c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'0f2674bc-7de4-40be-878e-1f157e453b8d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'ce46750c-41f5-4ea7-984b-1f3a76c0d4d7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'7a96dfd3-14fc-44fc-8eb8-1f57cbca11b9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'a987bdfe-1f29-4cb1-8118-2132b72bb353')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e41732b6-cc9e-4b34-a7d8-23efdcb1274d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e4837ce2-0d1a-4252-b25c-243823900745')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'fd3bd28f-ffbe-4ed5-b2ec-246a996d1c5f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'dfeea4b0-de28-4740-b8e0-24d860fb4f18')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'066bcfdd-78fa-41c8-8993-2500b04ef404')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'e45a99e1-48ae-4cea-abb6-2514f42a0d67')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'20758f94-9980-4c33-a03a-25530017454d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'd7fc8974-1cf4-474b-92ea-25daf074b4a6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'98e5c2bd-b206-494b-9fac-266d2e3a667e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'98841508-78ef-4493-a772-28cf92b743d0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'c88763a9-61a8-476f-9113-29655c0f3abc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'858995d8-8352-4850-b504-297934407021')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'64fee44e-e233-4357-8e3c-299ff8192f08')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1573d13e-26e7-4e44-9e71-2a12e1fc5336')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'73ed2a3e-4be2-4ebf-8434-2a7532fc3774')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'3912f92d-a97c-446e-9bb3-2b022d0a8ed6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'e6fe29f8-dafb-47a7-99aa-2b31d52bf897')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'28706f24-419c-4676-a3f5-2b64af156e4f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'a280cecd-a891-49f6-ba48-2c7a29dd9597')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'7abd75a5-82a5-49dc-b469-2d2aa3150fbf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'01a7b00a-f6cf-42c3-84a3-2ee24980c9df')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'c6bc1167-7bb4-49ad-a54a-30705b67138b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'dc4ca625-b5da-4105-91e9-31797ce98a24')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'c6fb4e14-56ec-4685-b7a4-3202a0db1757')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'20c323ca-2d39-454e-83ff-33184a4d96f9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd9d1efe5-5b27-4437-ae8b-334d14b6c7d8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd8b1033d-a136-471e-b832-3403be6cbede')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'23cb88bc-37e5-423c-b39b-34d101e5a618')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e8dfd0c1-cd27-4853-8c92-34d1568a652f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'98953b8a-b39f-42d4-b292-350e4037f2d7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'88d772ae-3898-4f17-9b24-363581aab9ae')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2c3257e1-2e92-4ad7-8f57-38848a16b7b5')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'eeac4038-ceac-465e-ba1e-38da79129d8c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b65a553-f08e-450f-92c1-38e6b68015bb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'2a9d7442-a18c-4e7d-8499-390d0ec6a7b7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'd660f922-dc5f-4fcc-bc0a-3950d35a2cbc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'f89db42c-2392-46bd-b337-3a2a133d48e7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'8276208a-1acd-4307-9212-3ada006d92a9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'83c71286-5e0a-4ba7-8ffb-3c0fe634aef7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'54dfd49c-8f1b-4ca6-8af9-3c13e9ce9fd0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'c82eca76-6789-411c-82c7-3ddb59810a99')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'5ae1f92d-fb28-4817-b607-3f4b523f6127')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fb0f25ef-eaf5-4250-aca5-3f5efca06402')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'bb043825-4f77-403e-8687-3f609fbc6cf1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'af44fd4d-942a-4a73-ae0e-406a67e79b86')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'4ad137d0-8662-4143-98fb-420f816bd111')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'8c1071ab-659e-44df-89c2-4332afad58c8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'6242709c-5f1e-4900-b2c9-44922e86cb5b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'eecc4cd5-6c7a-487b-bb19-45b1aa53ba12')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'2c47f744-572e-48f6-93d6-46437aaa9b37')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'0d60300d-a5d6-449a-9ee3-47066ce69c89')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'84c6c176-7996-401b-bfd9-478772f4eb5b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fbec1ec7-a677-4cf8-badf-478fadfbcd96')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'48c5873f-93b6-4019-96cd-47abfae73de3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'e06adeff-85b5-4d8d-915c-47f9cf46a8ad')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'9f5a59d5-91e9-4db4-b9c2-498a48765c41')
GO
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'7dbc36bf-f175-49e5-b23f-4b3a8065a426')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'08c56f3e-256a-4db2-8600-4bea73fa98f6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'f320c73a-cb99-463d-b926-4d9613c9d0d7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'e31263ec-4fc3-44e2-95b5-4eb7547c1db3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'cee04111-4015-433a-8947-4f2f1a0e773d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'b283ce60-f7a8-4bbb-8047-4fb895bd5f93')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'4c77ff5e-ff76-42e4-ab01-526dc8848d87')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'8b66dff1-ecf4-4e28-8546-53bde63c4d80')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'a6439344-c1ca-463a-8989-552b42e3fc1f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'35dc9d94-917e-46dc-9757-5883c85af498')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd7e735fe-3621-4ec2-9276-58de05708119')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'140acb6b-75fb-4f2a-9519-5a8d88bd9ad2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'91a02057-6172-4ddc-b3e0-5ca93af2d2cc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'48f76be5-ae61-4d7b-929b-5d97d153309a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'71aaee71-17d4-4a83-a7ec-65028b3b3029')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'ba9cd1d0-f021-4ad9-a300-653a98b1582d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'8ad2af2f-c3d6-4eee-9666-67b595c3fc60')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'14ffc51b-218e-4ddd-982c-6843b1bf148a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'97c03748-1973-41d5-ac23-6854ebc1f553')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'2f58818d-0a2e-4197-b6e2-6948a7a0fd3c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'4d158814-04e3-42c3-88af-69955b9fc2ce')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b327939-6298-405f-8e3a-6a0ef8394db3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'8e220d4c-5ad7-408d-9142-6b70804cfbd4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'8d554208-5aa0-4d4b-bb8d-6d9666b6256a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'db838c05-1176-462e-9960-6ea0f36ee16c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'ac6ce44c-7b46-4f21-ad65-6f55cc98a5e9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'7f03393d-a2c0-4089-9b1c-709b4ea98c68')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'c8eef8b4-47d3-4a93-85f1-70ebe9c8197a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fb77d8cc-da7c-4b4f-800e-71077edb90f3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'bee10db2-a28a-4966-a860-710a6cd755c6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0d6d5aed-79b6-4887-b376-71ea0b1bd225')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'92777e41-6e9b-40e7-a37b-71f0cb1f4946')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0cf6a437-8c53-4920-a45a-71fd3f00f57a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'edefffef-3412-44ec-b8fc-72726f34bec9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1300ff2c-ca2f-4b6f-b065-72924d3318e4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'8297667e-8018-4afa-aaac-72bc011ff70a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'62c2fcae-c7ad-4081-ade2-72f96195b426')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'067c7f3d-ef84-47fc-8401-7454807a8bf1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'c43403e6-a074-4534-8f5e-746fbe8f7cf8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'fab0365c-517d-4f3b-9d51-74f28daa0c6d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'2b7c3b71-f013-4282-81ed-76ced7dce80f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'9dc2614d-f7e4-44b4-b574-77ec89fdab65')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd9d65462-4cfa-4ac0-8f2a-7807743e87ac')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'72281558-32d6-48d6-8989-7874809f326a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'fdb0bc8a-ed9c-4a72-a418-78c50f7bee2f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'418f723a-4e9c-42db-adfb-797b9fcbc013')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'9ccf1188-02e1-4f3d-9d82-7a5bcfdfe291')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'41c132b0-670d-4770-9768-7a81d39270cb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'99e2e249-f7a6-4816-a207-7ac0def4c10f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'7283bb6c-0da2-4a47-8ac3-7de9ede13ccf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'e12bafe4-9a85-4f30-a532-7ebc1c065490')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'2606bff3-4233-41c6-818b-7ef773f3106b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'f1306f0e-1e16-4435-b093-7f4b1d720739')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'63925863-5666-4cf7-9d83-7f6ad00ae4d2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'23144b12-3f7a-427d-982e-7f8cbce1ab27')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4d09333d-cd6a-4b3b-b2ef-80a853031f0e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd4df0201-cfef-4a82-87c9-810c5c414146')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'4da38791-a252-437c-b7ce-826043d93b20')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'd55ec4b2-9eef-4ce7-b870-837ec598e79c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'6ad0b067-91c6-46e4-908d-87bab721ef86')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'd7b73e3f-c4fd-4ccf-8376-89af310c48fb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'4a89abd6-0125-4f8d-a48d-8a0a695a8f3a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'22820aa3-4e03-4b11-8d0b-8a95f345dccd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'd7f7a66d-fb9f-4aed-9493-8b2f3d5b1dec')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'2b22a4f2-15a0-4f79-ad19-8b6dd8bca45e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'532aceec-ae4e-4f75-a194-8b7eb48e9c06')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'b7c7dd5f-20ce-4475-be0c-8c56da0aea9d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a4f18245-7b62-422a-a11f-8d9b893b5b5a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'da37ff22-c6d2-4842-8daf-8d9dfd396e70')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'745f1b99-07e3-42b2-bd92-8e4cbbf5c25a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'0ce9bc0f-07ee-47f1-8a53-8e8688f071d5')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b51c817-4400-4384-aff4-8ed19e54108c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'da2c024e-2738-4cec-8374-90221b7ae7de')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'6e71e277-6666-422c-8d2e-906750be8948')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'9a0b287e-8c84-4b77-bab0-906ca0428ef8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'2c3cb943-a8f4-425d-aef9-90fdfe79cacd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'b81b1831-d933-4d33-841c-92d6889405e9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'a09e8acd-5bbc-4316-b190-937e91a4a3ab')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'ca3c2520-ebb3-4937-8fe8-94e6aa4cddbd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'b0cf8a36-b106-4108-9df8-9593852d6f30')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'0338d84c-9cdf-49d2-932c-962dc6912ab1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'e597232b-6141-4aae-9002-977af580ff30')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'2fe1fe87-ede9-4446-beed-9786d4b953c1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'560dd071-3b0d-4ca4-aabf-9917717d858c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'6bee79f0-944d-468a-9757-99c07993d378')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'5be4ab8f-68d4-450e-983e-9afb75a0e6dc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'369d3e01-43a3-499e-bf1f-9c7441009723')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'1e2aafdb-458e-4cba-a884-9cadabe52f57')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'359272ae-3037-492d-9e9e-9d6a28105334')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'3562740d-0e1a-470c-9480-9de9b2d58340')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'dea2beec-767f-4d6e-93af-9efbe31a2c28')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'2fab63b8-c594-408e-b602-9f06bfe2c104')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'30f46cb7-4ed5-42a7-a685-9f1f03260d03')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'8a4c180b-270a-42a8-8265-a01bd0f91972')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a2b0bfeb-b8e3-43bc-82ad-a17e516ed8c2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5750fa80-4145-45ee-a53b-a1ddd8aeb92c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'5a91c08c-e32c-482a-b360-a1e4698ac5ab')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'15589419-ebe3-439f-9957-a4d2aaf52453')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0e8c3faf-837b-4877-8407-a56740b92bbc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'0e9a1fd3-f78c-4026-a867-a60707d766fb')
GO
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'a3b25f83-1565-47c2-964c-a6ff232387f8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'c689624f-863d-4449-b4fb-a8acb1d26f13')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'4a53da7a-2c4c-4d5f-abc0-a931f01c5cd8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'0bad97ce-79d6-4b44-b91a-a9485a2f01d9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'07f15c55-36a2-4a3f-a5e9-ad3c1dd5f9be')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'dfa4137e-4fa1-4cac-b1f9-ad681d3c010e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'5c60e174-e837-485d-9b49-aeb0a9281ff1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'c25a9927-4216-4b06-8ac3-afd3a56ae61a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'8474843b-89e0-4598-a282-b00bb24af0e0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'13b2a39e-02e6-44a5-8e1a-b00de063622a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'0543c44a-1bbf-46a9-8da3-b0a781b87b9d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'c9aaa55b-5c43-4da2-aa56-b2cac069b510')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'11e249aa-d6f9-45d7-b1c8-b37f2294e1ce')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'712df3c2-bee9-4bdf-9975-b3d2fa36269d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'8dcd7555-04a6-401d-82c3-b50d09177e56')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'a2f0553a-055b-4ffb-88ca-b59e93efe2ca')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'64278c8a-aede-4b6c-8918-b64623b47e78')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'5574e37c-9f93-430b-9db3-b66639b9239c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'3affbd5c-44ec-4274-a85f-b82a9978571d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'9dde8222-5606-4685-8385-b8c8038d120f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'ccc830ba-4e48-43db-9b53-b967b5c4cfcb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'5aa3000b-a5ee-43fb-8b17-ba9732aa7406')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'3aa1fa8c-c32e-4df4-a5a0-bb56fbaaf4b6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'4a357837-3331-45b6-af6d-bdd6edd3cf04')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'787bf088-7d6f-4dde-bd6d-be70be54308a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'092f57ef-f0da-4be6-a0ab-bf5765278263')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'b2c86410-4509-4edc-aa41-bf79f98806ca')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'07c68baa-84f9-486c-913d-bf81d813124b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dfe5fb52-2ade-4a1b-91b1-c06a078e2c37')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'2e34f39f-e3d0-46dd-ac64-c0f6af8c5d26')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'38933e94-400e-48de-9139-c109b57bbccf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'ef458381-9395-4ed2-901d-c118c2e33a49')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'779e0cd8-0fb1-4418-8538-c354c2a342cc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'4731adc7-45d9-4bdc-a42c-c48b2b5f8d5d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'bf80deb6-38c6-4062-a177-c4a97405b6d0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'a0e1a810-07de-4b06-b45d-c4cac942beb4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'bba4917d-6cdb-4b77-9f79-c4ee14e9b5b2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'96336475-14af-488b-9351-c75bc07c81dd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'b6047234-f6c2-4cca-956d-c83d19889df3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'515ddb9f-fa5e-4289-93e1-c9681e335727')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'98758005-240e-4494-99af-c9aa8cbb04ec')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'cf664e3d-0f25-4b86-83c5-cb2a3c84f24e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'c6e2a460-8f0c-4352-b344-cb6714c140c2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5db27fe9-15d4-4df0-bbd2-cc329ebd3ff7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'fe55aede-a8b8-43ac-ab31-ce2bfd433d2c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'e9eaa2e1-9134-4c2d-8611-cf3f2dfcac55')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'0a944719-ef9c-469c-beee-cf939e499bf1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'95be8573-0e1b-4cd5-9c0e-d0706094a68e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'3a9b61c0-5142-4306-aa27-d09b621edaea')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'32fb6f49-fc63-47d8-8b2e-d1b146692c75')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2ccc9a01-3fe4-4abe-b937-d25c439d39b6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'90cb2eff-5d85-4615-9c56-d389ef4cc97a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'c226e891-2110-4949-8afc-d3a74bf5263e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'8c6fa61f-c229-49ca-b332-d3d8167d426f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'b91af905-29a5-4cc9-9746-d409cac9d433')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'9a818c5e-17c7-4509-a675-d45cb27ad277')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'2dd6f174-e3ff-4be6-8265-d4c67adf63f5')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'67d4f2b2-431d-4c94-a77e-d504b5ed5545')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0754b310-28ac-456f-a95a-d5e890c3953b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'ec1ca113-a129-47e2-a974-d613fa127c45')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'f6972236-3a64-439a-a18a-d62dcae79116')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'4eda1b4f-17d6-4436-b22d-d69a074a49cd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'cbd38855-255f-4fab-95d8-d6afad2bbd85')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'7df66bfb-86f4-4e56-a3eb-d6c70f7650db')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'6b586ba6-35a2-4912-830d-d742fa065bce')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dee869d9-ec53-455b-bdca-d7e3fa599a78')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'13861144-8c09-43d5-8930-d861d2fd5041')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'59d087d2-5982-4d5a-ac4e-d918721fd18a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e2f36cfe-758a-4822-9784-dbf4c80aef79')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'662e3aad-9595-449a-b9e0-dcc96d60b29d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'12c8696e-27d7-4eee-8311-dcd056a33f36')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'a348ca6c-e4e9-4a00-80be-dde4078b7e7d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'eab2fa90-4b74-4dd8-ade2-e09a3abe18de')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'45949560-0258-417f-8364-e3e9942b262f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e5e1d9a3-2d56-4308-a259-e468fa291466')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'a36418c3-12b9-4256-a643-e49218038a53')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'e3bec632-fc30-446c-a021-e4cce4af8d9f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'6bb35f28-b951-4a3c-afb5-e62ed30f64be')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'c921a9a3-b0c2-4bb4-b955-e920aa36470c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4f5caa97-ae08-4512-aa7d-ea18bcc9589d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ccba9d68-ed0a-4b49-9a03-eabe30f162b6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'dc451215-fb52-41e2-9ddb-eb2bd0087eb9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'806274e3-0633-45b0-aa5b-eb35006d5a9b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'99dd11fd-64f5-4a28-bd02-edf47b59dbe5')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e93851ff-7b86-4665-bb6d-ee844f8108cd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'423545aa-82d0-4bd0-af0d-f0e1318c86c2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'c3fd87bd-c788-42e6-b01f-f19d93c26ad4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'1fe056ed-3067-4f4c-a6ad-f1f828fa5308')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'87b25935-fe46-47ca-9de3-f32ba785ad95')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'3291c3d4-ecfa-4080-9cb4-f4a5074bae72')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'1fba1de7-2bcd-4a9e-b9cb-f4d24cd6a77e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'cf7e3165-bd03-4ff6-a856-f5225220a915')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'052860b3-e9ec-49ec-8495-f5a3c1245ce3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ea03156b-ca2d-4301-ae84-f645373fdfab')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'113b658a-5f66-45d0-a364-f646b3444d25')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'dfe05c5b-7f2c-4ceb-a267-f6aeda05732e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'bced81d8-1842-4367-ba80-f6b8eeb84b8c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'88359991-5f59-411c-8cbd-f7a3a4ced8cf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'2f1c409a-2f60-4b51-be90-f7b229798e43')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'5da31754-6c87-4745-aa73-f891648d0126')
GO
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'87d972d4-b85e-4570-8bcf-f8d412c84623')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'f69268c1-f45f-4a38-abd3-f96d62b840ad')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'16c581d0-797a-447f-b5d0-fa3dcb52dcc4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'1d8b0bda-22b2-44be-abce-faca6ebbc690')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'f5fb14b1-4ccd-4ebd-b0ae-fae1ed14399c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'259f1847-a960-4ebf-968e-fc11a2985ba7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'72388e63-eb27-4776-9feb-fc582e2ba99b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'7aee0692-3d0f-4db3-ba1b-fc8841eaaa16')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'ff7f1795-3f48-4657-9d00-fd2ec5d8fd80')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'd90511ad-21bf-43e8-be40-ff1727d93470')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'2f789452-f6e9-46d3-851d-ff44c8ab35d4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd4991fcc-9ac6-44e5-a7b0-ffcbcc1f650b')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ee95ba9f-37bd-45a6-a7b9-00e9efb6b985', N'424b3d53-772a-4749-b645-520529ea0d69', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'798bf331-281b-4a18-af93-47d3c7c73996', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 2, 19700, 39400, N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'92ec0d89-e15e-4a53-baa0-02f820c59578', N'b6324b98-c63d-4b85-88f6-69afc01c5bdf', N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 10, 16800, 168000, N'aa315538-9776-4d7b-ba34-546f134267cd', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'9ede732d-067d-47e3-966e-03cca5af597b', N'58431034-3555-4d1b-a36f-4b3e99f90b8d', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'397cf326-8a40-478c-806f-f7f678a2818a', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 7, 7500, 52500, N'232ae13d-0cbe-4840-a592-95110cd64772', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7ab7c0de-36a7-43e1-b4ae-050d20a7c31c', N'36258c1f-48d4-4ef0-9b6e-4741747ac81c', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'059887cc-059f-483a-a4d3-e34a0d605aca', N'95be05c6-8936-42da-ba38-0a0a1bd23d92', 17, 14700, 249900, N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'2a5dc6f0-05b4-496d-a7d5-06d7d94774c0', N'27c60367-e9f9-4da1-8638-e87bd795baa8', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'663750c3-515b-4c0b-8ab3-b569a2a492ab', N'593703f2-72e0-48ca-8b92-15366fa2f28c', 20, 23000, 460000, N'e94688cf-d636-43ab-a946-12674ff053a7', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'f89bc1a1-9baf-47ec-81db-09681a92a269', N'9ecac14b-4195-4fb1-bae8-7346f6d3ae76', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'9b34950d-b3d1-4f54-9a3c-84e98b72554d', N'58747156-bbc8-4105-9a1a-04d72cadc3f2', 7, 19700, 137900, N'9023676d-d2e6-4a43-95e4-90247b4f96f3', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'81e58a69-bc06-42c9-b3a6-0c2ddd16e13c', N'0aed8c00-d101-41e0-ba30-15833a7e35e8', N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'059887cc-059f-483a-a4d3-e34a0d605aca', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 5, 9000, 45000, N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e11f41fe-9d1f-4c4d-b265-0d1a0f37dd76', N'd2ef48da-dc60-4a1f-b965-38e0e8db63bc', N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'8b76d5d2-91ea-4d54-9bd2-f2a641499904', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 15, 6500, 97500, N'f9baca32-adde-4f79-b58e-845dae309b03', N'bc54794a-37e0-449d-8f91-c51d99ac7446')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'69a6b221-343c-4041-93ec-0df6c7355fdc', N'59d28f40-87b9-4c42-a3ec-3cd2c94a4c9a', N'da0ca760-2158-43f6-84cb-bc7290172722', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'72d957e4-a67a-4fec-9e16-093c84475ec3', 3, 11000, 33000, N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'2cb3c722-7199-4bcc-bc0e-0e2416686042', N'8ff53b29-31ca-472b-85a3-d7f5628c5918', N'c4f9bf97-f0b9-4f27-a8e9-d149def351e2', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 25, 5500, 137500, N'dddb68e1-387f-4173-8223-d0d25c54a1cf', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8ca5ee1b-7147-4179-8dce-19916980caea', N'36258c1f-48d4-4ef0-9b6e-4741747ac81c', N'ffbd765a-4933-43db-9727-e9c425a69e61', N'059887cc-059f-483a-a4d3-e34a0d605aca', N'95be05c6-8936-42da-ba38-0a0a1bd23d92', 5, 38500, 192500, N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ca4fcabd-b98e-40e9-80fb-1b88f90790ea', N'55468dc4-0d9c-4e87-8d17-159392f97965', N'c9f15173-9327-44d5-87e0-3490bec59275', N'd19a7dd9-cc3c-4ce1-9f2c-724f235b41e0', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 6, 10500, 63000, N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'eb3e5904-97de-4f68-83f8-216851eacea1', N'd9b80f76-2cc6-4264-ab99-287b7202311f', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'ef059dfc-7215-492f-a235-063a1017b872', 8, 10000, 80000, N'77be66c7-ce26-4451-a2a4-f948c841de7d', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a63ae44f-cd90-4b78-ab69-21ea3bc3df22', N'f7978c06-bf26-4901-be38-df58bcc0573b', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'58747156-bbc8-4105-9a1a-04d72cadc3f2', 68, 9000, 612000, N'4a0e0e82-82f7-4390-82bb-3680621d55d0', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'369071a6-cdcf-4cda-923c-24de43dced07', N'e93609fd-912a-40fd-a9d6-d30ef21f4786', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'0cb90f4b-e45f-4278-860f-5be7fe7d9c7c', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 7, 32000, 224000, N'746eec20-6ce4-487e-95ef-16b32ef7fb7b', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b7000bb7-0c69-4122-9e57-2581d471188d', N'de587022-7bb7-4c34-b2a4-22d2c00f4fb7', N'c9f15173-9327-44d5-87e0-3490bec59275', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 9, 15000, 135000, N'619ee51d-ccbc-4c54-8090-32de0058febe', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'4e804787-9ad1-40fa-978a-282e4f7a7028', N'e98d350f-5fdd-479d-bc32-c80fac7c8ccd', N'1c90481f-7a5e-4625-9678-c40030298c7a', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'0c8b611c-99b1-4afb-b337-0753063512e8', 6, 17000, 102000, N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8b9d734e-e519-4234-9c58-28ed7742a628', N'756a367b-d067-4f08-b885-29e237b20009', N'a6127a7b-e761-4658-afcb-42e0c52ed586', N'7a54a96c-9ac9-4068-b5b5-f92239afde96', N'593703f2-72e0-48ca-8b92-15366fa2f28c', 10, 7500, 75000, N'a5bddd27-4585-4355-8911-4cdaafc0839b', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'031d2f31-2eb0-4845-9e3e-2a664d415d51', N'79cb9ad5-9d65-4a43-b2e3-67370e5010e7', N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'cee04111-4015-433a-8947-4f2f1a0e773d', 11, 9000, 99000, N'77be66c7-ce26-4451-a2a4-f948c841de7d', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'74a095ce-23d5-4ea6-b9f6-2aa2a5db423b', N'41a21d4b-d7e7-437e-bb7d-8994d9b6718d', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'a41effd0-147b-449f-b55d-04665844b87e', 10, 8500, 85000, N'd811e7f0-d8e1-42d4-ab1a-634877c748e9', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e4db5c86-d41e-4112-8635-2cf71deca362', N'd86669bb-2338-4786-b058-ee61efbd6811', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'0ef3b442-738e-4e9d-9810-04da458f757f', 10, 12000, 120000, N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd1a9490b-fc2e-4c7d-acf9-2d927f2fd13b', N'd0385d78-7c53-4c6c-902c-05aab4636626', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'549d189d-f616-42ec-b92a-a4bcafeaa246', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 1, 14500, 14500, N'd0136e76-6551-4418-ab1b-a2a473f39a14', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'424326b3-10bc-45ba-85a7-2fc9d95ab352', N'cf0cfdd7-d724-4b17-8c81-2cf91099afc4', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'0ec69ded-9ef6-4981-936e-ea4f168ebe8c', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 5, 32000, 160000, N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5d217fd0-785c-4597-bfb4-30250566f8c3', N'f44b86fb-46f5-42b8-810d-5dc3bf742e1a', N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 10, 5800, 58000, N'9c9e8a7c-6743-4c32-8aa9-8b0e4e81261a', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c96be79f-7be1-4a39-8576-30f268e5fbf6', N'56cc095f-bc22-4c96-8071-4dc6e0e364ad', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'58747156-bbc8-4105-9a1a-04d72cadc3f2', 50, 34500, 1725000, N'c3319e1b-8d50-4ece-a122-30516dc874d9', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a0855e1d-3518-4d07-9164-311171bb8f75', N'b6324b98-c63d-4b85-88f6-69afc01c5bdf', N'da0ca760-2158-43f6-84cb-bc7290172722', N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 20, 11000, 220000, N'aa315538-9776-4d7b-ba34-546f134267cd', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'409314e9-a580-4ac6-909e-324260762cbc', N'35369b57-7feb-4f03-858d-a2b61adc81a2', N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'8b76d5d2-91ea-4d54-9bd2-f2a641499904', N'd9d1efe5-5b27-4437-ae8b-334d14b6c7d8', 15, 6500, 97500, N'f9baca32-adde-4f79-b58e-845dae309b03', N'bc54794a-37e0-449d-8f91-c51d99ac7446')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ed825d9a-93ac-4b75-ba05-32ad6ebad30d', N'430434d3-61af-4e77-8aa3-300d26fa5e5b', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'1bb12005-ab44-49f8-b77c-f9dda57866db', N'd9d1efe5-5b27-4437-ae8b-334d14b6c7d8', 6, 14700, 88200, N'447833db-13fd-4145-b661-4a5e5cc0977e', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c7a0e299-c69b-40f2-b69c-33833daf7696', N'27c23bd4-8ee8-406a-803e-2d5b3b195023', N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'77083872-4ff7-44e1-a36d-28c9ce50d792', N'ef059dfc-7215-492f-a235-063a1017b872', 13, 5800, 75400, N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'3a54f6eb-938a-4b51-9438-3daa03efca97', N'e0623f3f-7727-4dd7-8249-ae46dc80ef09', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'a17ffef4-fa29-49d5-9729-070c5dfa1bae', N'cee04111-4015-433a-8947-4f2f1a0e773d', 5, 23000, 115000, N'2831e641-122d-43c1-a6f0-0d52f30915ab', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'327699a4-0f06-455e-a048-3f4f0fc7ef50', N'707983f2-0824-41a9-9e4b-d660e5cf6024', N'c9f15173-9327-44d5-87e0-3490bec59275', N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'a41effd0-147b-449f-b55d-04665844b87e', 15, 10500, 157500, N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c619b51e-7612-4b72-b05c-3f53e28eed95', N'f3ee4c70-57ed-427d-86ac-99fae01d7793', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'a41effd0-147b-449f-b55d-04665844b87e', 15, 8500, 127500, N'e94688cf-d636-43ab-a946-12674ff053a7', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'20e17eeb-177f-416b-9a1b-42da54a82e01', N'5b68ced3-ec51-45aa-afde-4046a35fece6', N'c9f15173-9327-44d5-87e0-3490bec59275', N'9eeb9786-9410-466e-ad2a-d334a31bb855', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 5, 10500, 52500, N'a5bddd27-4585-4355-8911-4cdaafc0839b', N'bc54794a-37e0-449d-8f91-c51d99ac7446')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e0be20af-5d8a-41b1-a4e6-45fa79257c47', N'7222e3d6-ed2f-4996-8144-ddce27c64b80', N'ffbd765a-4933-43db-9727-e9c425a69e61', N'798bf331-281b-4a18-af93-47d3c7c73996', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 15, 18500, 277500, N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'874cc505-685d-440d-a000-4a917b0313b2', N'0c85c606-b97c-48da-a74e-ab27c0d0aac5', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'593703f2-72e0-48ca-8b92-15366fa2f28c', 12, 8500, 102000, N'e94688cf-d636-43ab-a946-12674ff053a7', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'82ac8146-4bab-4a20-b82f-4aea2ebd8ba7', N'e631150c-7433-43f9-a931-83dd61d0cbc2', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 15, 8500, 127500, N'e94688cf-d636-43ab-a946-12674ff053a7', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b1977ecd-1287-4fa7-9902-4dd9d5a8e8a0', N'55f0d5b5-948c-4908-a85a-b1d56ac8d4c2', N'1c90481f-7a5e-4625-9678-c40030298c7a', N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 12, 12500, 150000, N'686576b5-18d1-4057-a21d-7384e61c9101', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'3706834e-70c0-4459-95f4-50b1d2f13c8b', N'7d41dd24-f93d-4915-af67-035ea5923cae', N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'0c8b611c-99b1-4afb-b337-0753063512e8', 10, 9000, 90000, N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'386209cd-60de-4206-a180-51e0e0fbf325', N'6586fdd7-3838-46bc-8311-ed0fa9c3924f', N'ffbd765a-4933-43db-9727-e9c425a69e61', N'798bf331-281b-4a18-af93-47d3c7c73996', N'72d957e4-a67a-4fec-9e16-093c84475ec3', 15, 18500, 277500, N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'975bba0a-757d-4c48-87a8-52205d2c4aba', N'8a0c3120-98e8-4319-9422-1955104f1e88', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'549d189d-f616-42ec-b92a-a4bcafeaa246', N'58747156-bbc8-4105-9a1a-04d72cadc3f2', 1, 14500, 14500, N'd0136e76-6551-4418-ab1b-a2a473f39a14', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'3848c195-02de-4965-8ddc-524f3eedde85', N'cf0cfdd7-d724-4b17-8c81-2cf91099afc4', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'0ec69ded-9ef6-4981-936e-ea4f168ebe8c', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 7, 8500, 59500, N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a51b1b4f-c969-4b8c-8976-536b17ad241c', N'6fd073ae-d9c6-46a0-aabe-9c305b5f9f49', N'ffbd765a-4933-43db-9727-e9c425a69e61', N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 10, 38500, 385000, N'd811e7f0-d8e1-42d4-ab1a-634877c748e9', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'cc403675-a64c-42cb-a476-57ea9ab62c63', N'202f1d34-eb4f-461f-a302-1ae55a3ba73c', N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 12, 8000, 96000, N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5d7a250e-2bc9-4d2b-bcc4-5c2ec6f35513', N'a0876344-ea67-4445-ba52-2dac6cf2d4eb', N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 15, 21500, 322500, N'9c9e8a7c-6743-4c32-8aa9-8b0e4e81261a', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c2874fd3-9976-464b-bb1a-5ce1db64c16b', N'bc35084e-89fe-4105-830c-98d92480eebb', N'1c90481f-7a5e-4625-9678-c40030298c7a', N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 12, 17000, 204000, N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'62b72d79-4722-43f4-900f-5e26c7ebbf1c', N'ce39c155-fae5-453f-a803-90e26582a77b', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'20c323ca-2d39-454e-83ff-33184a4d96f9', 15, 34500, 517500, N'85947907-2819-4811-82fa-e733d5051da8', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'924ae7ca-f0ec-4f81-bc84-5eca56eebfaf', N'59d28f40-87b9-4c42-a3ec-3cd2c94a4c9a', N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'72d957e4-a67a-4fec-9e16-093c84475ec3', 6, 8000, 48000, N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8aa4ebb7-08d2-40c8-8d41-640c3b804741', N'764ad23f-450b-4681-80b7-e935b9d6bf88', N'c9f15173-9327-44d5-87e0-3490bec59275', N'91901ca2-f0b4-4898-b76a-967545e8a103', N'20c323ca-2d39-454e-83ff-33184a4d96f9', 15, 10500, 157500, N'5cbdf8d0-a23a-41df-8c50-5868d536302d', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7bf480d6-8fc7-4125-8c6a-65fb3b2fb4a7', N'7d41dd24-f93d-4915-af67-035ea5923cae', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'0c8b611c-99b1-4afb-b337-0753063512e8', 4, 15600, 62400, N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'29294c9a-ee2c-4351-a7b4-66aaf1eb4e1f', N'b33c1c75-d047-4e42-a585-8cb04168a6bf', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'663750c3-515b-4c0b-8ab3-b569a2a492ab', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 20, 23000, 460000, N'e94688cf-d636-43ab-a946-12674ff053a7', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'67aa7c2a-2c30-44b7-8858-6bac4c33afa4', N'430434d3-61af-4e77-8aa3-300d26fa5e5b', N'425c690f-7eb2-496b-8a11-18ae6bb32ef0', N'1bb12005-ab44-49f8-b77c-f9dda57866db', N'd9d1efe5-5b27-4437-ae8b-334d14b6c7d8', 15, 11000, 165000, N'447833db-13fd-4145-b661-4a5e5cc0977e', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ece33de0-3bc8-4142-af24-6ca9f323e0cb', N'd86669bb-2338-4786-b058-ee61efbd6811', N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'0ef3b442-738e-4e9d-9810-04da458f757f', 4, 8000, 32000, N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd5db8cda-fe82-4999-b725-6cb5ff447afb', N'f44b86fb-46f5-42b8-810d-5dc3bf742e1a', N'c9f15173-9327-44d5-87e0-3490bec59275', N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 8, 10500, 84000, N'9c9e8a7c-6743-4c32-8aa9-8b0e4e81261a', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'eabca8ca-4dc5-4012-99b8-6cecd22c2ce7', N'262efaf4-f4d2-4983-8f3e-2dbaa47ced19', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'9292e952-84c4-4ea4-8fd7-1d1bf059317c', 15, 34500, 517500, N'85947907-2819-4811-82fa-e733d5051da8', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'283712d8-ec28-4845-8cd7-6e95902c467e', N'963b1cf8-7c74-4379-9d19-ca3c8b6aa124', N'c9f15173-9327-44d5-87e0-3490bec59275', N'e69f4363-556a-4734-af67-f7ddae254c91', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 3, 10500, 31500, N'5e0f3e3f-00b5-49bc-a8e2-96899a6c27e9', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'065d4218-8b94-4f5d-b2eb-6ee9d124ea12', N'6b4d135c-12a7-435a-9b1e-62f503dbaa68', N'da0ca760-2158-43f6-84cb-bc7290172722', N'397cf326-8a40-478c-806f-f7f678a2818a', N'4a6baa7d-1c49-40da-9667-0d0222121068', 20, 11000, 220000, N'232ae13d-0cbe-4840-a592-95110cd64772', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'76e1633a-f80c-401f-940d-6f32bb3750fb', N'2b24fb26-42de-46fe-be2d-a72769376ea2', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 68, 9000, 612000, N'4a0e0e82-82f7-4390-82bb-3680621d55d0', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'dde9d315-1994-4cd8-beb2-706a04ca0b93', N'b0fef731-7db5-407d-9a9f-e88978bad5c1', N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 3, 16700, 50100, N'4a0e0e82-82f7-4390-82bb-3680621d55d0', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'57fa53b9-17fc-4b1f-ae59-71b3ee7fac64', N'6b4d135c-12a7-435a-9b1e-62f503dbaa68', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'397cf326-8a40-478c-806f-f7f678a2818a', N'4a6baa7d-1c49-40da-9667-0d0222121068', 10, 8500, 85000, N'232ae13d-0cbe-4840-a592-95110cd64772', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b9aba792-2e54-4047-9a7e-72e501cf6810', N'3e798bb8-6f67-4159-87eb-06fe49c55d2f', N'c9f15173-9327-44d5-87e0-3490bec59275', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'0ef3b442-738e-4e9d-9810-04da458f757f', 9, 15000, 135000, N'619ee51d-ccbc-4c54-8090-32de0058febe', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'26c841ae-414a-416b-8314-73a233397354', N'80015537-e39f-4524-9987-841054126df6', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'20c323ca-2d39-454e-83ff-33184a4d96f9', 5, 14500, 72500, N'e94688cf-d636-43ab-a946-12674ff053a7', N'470017c2-6767-46a2-adfa-b93fa30618c1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'59e43ffe-f73f-4c62-a00e-74f08522ef80', N'bc35084e-89fe-4105-830c-98d92480eebb', N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 10, 8000, 80000, N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ba6f9a7c-a56d-4347-9029-75feb7b05dd9', N'41a21d4b-d7e7-437e-bb7d-8994d9b6718d', N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'a41effd0-147b-449f-b55d-04665844b87e', 7, 21500, 150500, N'd811e7f0-d8e1-42d4-ab1a-634877c748e9', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'abaad573-e2ff-4d34-b70e-76252fd8d98b', N'707983f2-0824-41a9-9e4b-d660e5cf6024', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'a41effd0-147b-449f-b55d-04665844b87e', 6, 12000, 72000, N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'1d4f1f1b-c997-4415-affa-7b451b676712', N'0aed8c00-d101-41e0-ba30-15833a7e35e8', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'059887cc-059f-483a-a4d3-e34a0d605aca', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 15, 15600, 234000, N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'1724fe7c-3271-4ff8-aeae-7ceb6ab135d5', N'38743d23-caa1-4d6d-b5d2-448212abb574', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'0ef3b442-738e-4e9d-9810-04da458f757f', 7, 25000, 175000, N'85947907-2819-4811-82fa-e733d5051da8', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ef98eb01-c223-4459-a790-8162311e3876', N'bb448487-65b1-48d9-a9e5-143775183756', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 12, 8500, 102000, N'e94688cf-d636-43ab-a946-12674ff053a7', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'fb17a448-22f5-4517-a182-87e7f88011ef', N'2d067c08-56cf-4f53-b09c-d09fffe7c349', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'a17ffef4-fa29-49d5-9729-070c5dfa1bae', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 5, 23000, 115000, N'2831e641-122d-43c1-a6f0-0d52f30915ab', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'0129bbb2-f6b3-481a-b066-89bb57f8c784', N'a5d20e1c-aecb-42bc-8c89-987734d25455', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 10, 7500, 75000, N'aa315538-9776-4d7b-ba34-546f134267cd', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ec7d5913-b4f7-4a46-ada5-8b9653e815fc', N'bc35084e-89fe-4105-830c-98d92480eebb', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 14, 12500, 175000, N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'024dda71-62c6-4514-9152-8f9acc0a9aaa', N'5445316c-7ad7-44f1-9b1b-3744aa43d85f', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 8, 10000, 80000, N'77be66c7-ce26-4451-a2a4-f948c841de7d', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'135f2de6-b084-4cd8-9c55-93d84e003c4f', N'55b97416-6198-41a0-b814-f0787557d523', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 1, 34500, 34500, N'85947907-2819-4811-82fa-e733d5051da8', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'363daef8-76c6-44ea-8720-98b6cb67ade0', N'a0876344-ea67-4445-ba52-2dac6cf2d4eb', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 3, 32000, 96000, N'9c9e8a7c-6743-4c32-8aa9-8b0e4e81261a', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b87880ec-9150-4a89-9db7-98d1fbabfb96', N'58431034-3555-4d1b-a36f-4b3e99f90b8d', N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'397cf326-8a40-478c-806f-f7f678a2818a', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 15, 16800, 252000, N'232ae13d-0cbe-4840-a592-95110cd64772', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7bc637fd-1621-4785-9822-9b7009121ab6', N'e98d350f-5fdd-479d-bc32-c80fac7c8ccd', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'0c8b611c-99b1-4afb-b337-0753063512e8', 5, 15600, 78000, N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'98da08f3-5b55-49e9-8fcf-a2063d38b416', N'ab3cf692-d89b-48ba-9d55-e2e0bcd10ba1', N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 3, 17000, 51000, N'dddb68e1-387f-4173-8223-d0d25c54a1cf', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'acee4ba9-0712-4c4b-90a4-a42e3b5bee79', N'a5d20e1c-aecb-42bc-8c89-987734d25455', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 4, 15600, 62400, N'aa315538-9776-4d7b-ba34-546f134267cd', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'82abb264-bd8d-45d0-91ff-a477713e4116', N'430434d3-61af-4e77-8aa3-300d26fa5e5b', N'ffbd765a-4933-43db-9727-e9c425a69e61', N'1bb12005-ab44-49f8-b77c-f9dda57866db', N'd9d1efe5-5b27-4437-ae8b-334d14b6c7d8', 4, 38500, 154000, N'447833db-13fd-4145-b661-4a5e5cc0977e', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c29d6ff4-c983-4bc9-a61a-a61511fd5211', N'a906fc16-108c-4060-910c-5de7170718cb', N'da0ca760-2158-43f6-84cb-bc7290172722', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'4a6baa7d-1c49-40da-9667-0d0222121068', 5, 21000, 105000, N'c3319e1b-8d50-4ece-a122-30516dc874d9', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'91dcc32d-ef82-4557-b790-a82ba8b5319c', N'bd2d8d97-8518-4895-ab50-2e63741c30ca', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 2, 23000, 46000, N'dddb68e1-387f-4173-8223-d0d25c54a1cf', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'3c552257-ee52-46d3-aec4-a917713b03ec', N'85b4ff1e-9d21-4f8e-87ca-4c7cec2deed1', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 18, 9000, 162000, N'4a0e0e82-82f7-4390-82bb-3680621d55d0', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'1acb0cb0-bb51-4c8a-b6d1-aa1b82ba1829', N'6fd073ae-d9c6-46a0-aabe-9c305b5f9f49', N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 6, 21500, 129000, N'd811e7f0-d8e1-42d4-ab1a-634877c748e9', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'f3e05205-b778-41ca-926f-ac798cbb248a', N'15bcc5c5-6544-4477-bf7f-d97b19af0b14', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'397cf326-8a40-478c-806f-f7f678a2818a', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 3, 12500, 37500, N'232ae13d-0cbe-4840-a592-95110cd64772', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'71f1f2e3-21af-4865-877e-ae449860b323', N'b43e06fd-a678-4cb5-9337-98f0adce5d4b', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 5, 14500, 72500, N'686576b5-18d1-4057-a21d-7384e61c9101', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'96bdafe0-dc6c-4a93-abff-affdbd74bbfa', N'1bd8b391-2947-484a-86a5-4ef97716ce71', N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'0c8b611c-99b1-4afb-b337-0753063512e8', 3, 16700, 50100, N'4a0e0e82-82f7-4390-82bb-3680621d55d0', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'57b251ae-1f09-4511-868f-b19e4b46fafb', N'a3e0d81e-7664-4778-bb92-8690a6493fb3', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'798bf331-281b-4a18-af93-47d3c7c73996', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 12, 9000, 108000, N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'23441f74-77e2-44bb-a3a9-b3e16cf9e95a', N'575dc787-3ea0-4324-9e97-3051a5ccaec2', N'c9f15173-9327-44d5-87e0-3490bec59275', N'91901ca2-f0b4-4898-b76a-967545e8a103', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 30, 10500, 315000, N'5cbdf8d0-a23a-41df-8c50-5868d536302d', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ea308ca6-9b36-456d-873e-b6c2233fe692', N'0aed8c00-d101-41e0-ba30-15833a7e35e8', N'ffbd765a-4933-43db-9727-e9c425a69e61', N'059887cc-059f-483a-a4d3-e34a0d605aca', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 2, 38500, 77000, N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'360c52a3-c025-4948-8438-be0d5e2b15cd', N'27c23bd4-8ee8-406a-803e-2d5b3b195023', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'77083872-4ff7-44e1-a36d-28c9ce50d792', N'ef059dfc-7215-492f-a235-063a1017b872', 3, 7500, 22500, N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'0a8ce97a-8294-4370-9b5b-be1a4568653d', N'e93609fd-912a-40fd-a9d6-d30ef21f4786', N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'0cb90f4b-e45f-4278-860f-5be7fe7d9c7c', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 12, 8500, 102000, N'746eec20-6ce4-487e-95ef-16b32ef7fb7b', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd5cf6175-cc79-4c8a-96b4-bed95e407021', N'cd2d0c01-ec1b-4e2e-979b-b4227745e9d7', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 5, 25000, 125000, N'85947907-2819-4811-82fa-e733d5051da8', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a41f455b-cb50-47ce-962f-bf3770706738', N'edb45f72-1cac-42e9-99e9-94ab5fd5f5b1', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'0cb90f4b-e45f-4278-860f-5be7fe7d9c7c', N'0ef3b442-738e-4e9d-9810-04da458f757f', 8, 14700, 117600, N'746eec20-6ce4-487e-95ef-16b32ef7fb7b', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'6d960b63-79bf-4606-bcb7-bfc2d3fe8779', N'3f056472-1d71-4124-81ec-31b2043406a2', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'58747156-bbc8-4105-9a1a-04d72cadc3f2', 5, 8500, 42500, N'619ee51d-ccbc-4c54-8090-32de0058febe', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd59af638-85ef-439b-8004-c0f7c3c5a3bb', N'5b68ced3-ec51-45aa-afde-4046a35fece6', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'9eeb9786-9410-466e-ad2a-d334a31bb855', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 12, 15600, 187200, N'a5bddd27-4585-4355-8911-4cdaafc0839b', N'bc54794a-37e0-449d-8f91-c51d99ac7446')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'cc946330-a22a-40aa-af6a-c32252af2eff', N'4ecf3731-a17d-4c82-9019-a60d96ce6ee5', N'415b713a-5445-4ef4-a8db-2c1b9387e207', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 3, 14500, 43500, N'e94688cf-d636-43ab-a946-12674ff053a7', N'470017c2-6767-46a2-adfa-b93fa30618c1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'cf0b6a35-4d15-4ff9-901a-c4962d0af920', N'202f1d34-eb4f-461f-a302-1ae55a3ba73c', N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 10, 9000, 90000, N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd862ad29-d724-4dd2-91b6-c73b6c4ef588', N'6fd073ae-d9c6-46a0-aabe-9c305b5f9f49', N'1c90481f-7a5e-4625-9678-c40030298c7a', N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 15, 17000, 255000, N'd811e7f0-d8e1-42d4-ab1a-634877c748e9', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'427ba7ea-28ad-46b0-82a4-cdeebd6d46db', N'729f9c97-5e75-4c6c-b93a-3b0c556b3cc0', N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 11, 9000, 99000, N'77be66c7-ce26-4451-a2a4-f948c841de7d', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'05eafc1b-1b5d-4315-ad68-d746f4c278c0', N'ced784be-4c18-4356-814f-77bc52a7eead', N'da0ca760-2158-43f6-84cb-bc7290172722', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'dfeea4b0-de28-4740-b8e0-24d860fb4f18', 5, 21000, 105000, N'c3319e1b-8d50-4ece-a122-30516dc874d9', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ac230b60-0331-4f58-9748-d762d2ed61ae', N'edcb4cb9-2bad-48b4-93d9-528b8ffecdb3', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'9b34950d-b3d1-4f54-9a3c-84e98b72554d', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 7, 19700, 137900, N'9023676d-d2e6-4a43-95e4-90247b4f96f3', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
GO
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ce1144e5-72bf-4e13-b70e-da250857c294', N'55468dc4-0d9c-4e87-8d17-159392f97965', N'1c90481f-7a5e-4625-9678-c40030298c7a', N'd19a7dd9-cc3c-4ce1-9f2c-724f235b41e0', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 5, 17000, 85000, N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a174d3a8-b8e0-4c37-9007-daea85f11a8a', N'27c23bd4-8ee8-406a-803e-2d5b3b195023', N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'77083872-4ff7-44e1-a36d-28c9ce50d792', N'ef059dfc-7215-492f-a235-063a1017b872', 13, 5800, 75400, N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'0b3672dd-ce68-4a1e-be0f-ddf751c36589', N'5153c8e1-045c-47f6-85ff-c7fddac06400', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 2, 23000, 46000, N'dddb68e1-387f-4173-8223-d0d25c54a1cf', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'826947de-7175-4e75-8c31-de054e960f33', N'f1123421-7f60-4981-b6a7-045ce8cfa09c', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'9292e952-84c4-4ea4-8fd7-1d1bf059317c', 5, 14500, 72500, N'e94688cf-d636-43ab-a946-12674ff053a7', N'470017c2-6767-46a2-adfa-b93fa30618c1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e6c0764a-0c20-4db0-aa5b-de68c092085c', N'ed15c405-4e7a-471c-8775-12836fff4ddc', N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'd9d1efe5-5b27-4437-ae8b-334d14b6c7d8', 3, 17000, 51000, N'dddb68e1-387f-4173-8223-d0d25c54a1cf', N'38e04703-8ba0-4c80-bc87-3d0e3130a366')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5a2a598c-f777-4ee8-a1a7-def2abb6aff0', N'e0fb8f71-cf8d-4a47-bcad-c62e66cfdce9', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'e77966bc-9d7b-4090-9da1-3c69ad37cf7c', N'95be05c6-8936-42da-ba38-0a0a1bd23d92', 2, 25000, 50000, N'56109e78-09cc-405b-92f8-792893dddd66', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c2d0bcb2-a7e8-4b67-85e4-e4e03d432f2b', N'1c304a43-6430-40d9-a6ef-518f29a69215', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'798bf331-281b-4a18-af93-47d3c7c73996', N'ef059dfc-7215-492f-a235-063a1017b872', 2, 19700, 39400, N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ef01a86f-92d9-4d69-8f83-e759610e2496', N'963b1cf8-7c74-4379-9d19-ca3c8b6aa124', N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'e69f4363-556a-4734-af67-f7ddae254c91', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 8, 5800, 46400, N'5e0f3e3f-00b5-49bc-a8e2-96899a6c27e9', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'0707c497-5df9-43ba-a942-eafd22c19681', N'a5d20e1c-aecb-42bc-8c89-987734d25455', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 8, 14700, 117600, N'aa315538-9776-4d7b-ba34-546f134267cd', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8d6bf2ca-14ac-4b1e-9871-ec25d267f8cd', N'3c5220ee-1c2c-474f-b190-110faa0205d3', N'1c90481f-7a5e-4625-9678-c40030298c7a', N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'593703f2-72e0-48ca-8b92-15366fa2f28c', 12, 12500, 150000, N'686576b5-18d1-4057-a21d-7384e61c9101', N'0e2cc6a2-85c5-4784-adaf-ef87e2bcebe2')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5d70b754-b477-4a44-b18e-efc4a53b8c35', N'963b1cf8-7c74-4379-9d19-ca3c8b6aa124', N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'e69f4363-556a-4734-af67-f7ddae254c91', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 7, 16800, 117600, N'5e0f3e3f-00b5-49bc-a8e2-96899a6c27e9', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e86f5e5c-0d96-4366-9e66-f00ca8385e89', N'da8d6278-26e2-4179-a9de-4cc1a718e41b', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'0ef3b442-738e-4e9d-9810-04da458f757f', 5, 25000, 125000, N'85947907-2819-4811-82fa-e733d5051da8', N'f3acebe0-4b45-48ac-80ba-5957cbd64737')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'109c9a56-b2f4-4dc7-9376-f01eff92aa7c', N'15bcc5c5-6544-4477-bf7f-d97b19af0b14', N'ffbd765a-4933-43db-9727-e9c425a69e61', N'397cf326-8a40-478c-806f-f7f678a2818a', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 7, 38500, 269500, N'232ae13d-0cbe-4840-a592-95110cd64772', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'4a75a539-8a0b-410d-8ec3-f37213a17bb4', N'f39e9a88-cd9a-42a3-b20a-f9c626832ad0', N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'397cf326-8a40-478c-806f-f7f678a2818a', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 11, 32000, 352000, N'232ae13d-0cbe-4840-a592-95110cd64772', N'cc5b7bd5-4dc5-4314-9822-bb053f9f09fb')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd7691a9e-18a8-4577-a76a-f3f4e1f3e793', N'5b68ced3-ec51-45aa-afde-4046a35fece6', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'9eeb9786-9410-466e-ad2a-d334a31bb855', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 5, 7500, 37500, N'a5bddd27-4585-4355-8911-4cdaafc0839b', N'bc54794a-37e0-449d-8f91-c51d99ac7446')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'abc3b37e-590e-4f2f-bf7f-f647ecaa6d49', N'0d6feb68-63cc-4bd4-8e89-cdbefd9123f6', N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 5, 8500, 42500, N'619ee51d-ccbc-4c54-8090-32de0058febe', N'34bf3004-9b7d-4980-a165-afdb05721cb5')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'30662991-7bd2-4d9e-9acf-fa31561ac0c5', N'cf0cfdd7-d724-4b17-8c81-2cf91099afc4', N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'0ec69ded-9ef6-4981-936e-ea4f168ebe8c', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 15, 12000, 180000, N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'13b40f1b-cce8-4ff8-9aa5-fba71e0af3a1', N'756a367b-d067-4f08-b885-29e237b20009', N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'7a54a96c-9ac9-4068-b5b5-f92239afde96', N'593703f2-72e0-48ca-8b92-15366fa2f28c', 7, 12500, 87500, N'a5bddd27-4585-4355-8911-4cdaafc0839b', N'7ba3020d-2bbf-4b24-8205-b3d009c94bcd')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'990838db-3682-4e5b-9506-fd012578d3f7', N'7434cf63-44fb-401a-9a3f-8dd324a46feb', N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'992a8851-58f4-4871-8453-1a6c4f91cb37', 50, 34500, 1725000, N'c3319e1b-8d50-4ece-a122-30516dc874d9', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ca00853f-1d72-4f74-8169-fecc41a738fc', N'0411f907-e4cf-4bd5-8c86-9733acb34dfd', N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'e77966bc-9d7b-4090-9da1-3c69ad37cf7c', N'0c8b611c-99b1-4afb-b337-0753063512e8', 2, 25000, 50000, N'56109e78-09cc-405b-92f8-792893dddd66', N'6662b55d-59a8-418f-8c62-3e9e59b28df1')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'2582746d-4abf-4565-ae68-ffba2ba1db25', N'55468dc4-0d9c-4e87-8d17-159392f97965', N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'd19a7dd9-cc3c-4ce1-9f2c-724f235b41e0', N'4a7efe8c-34a7-4054-8d07-065d073bca12', 4, 21500, 86000, N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'87dbc47b-1f93-4ce6-8b64-f4ddec4e45c3')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Alpenliebe', N'Kẹo Alpenliebe khong co trong danh muc', N'0_Kẹo Alpenliebe', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'Bánh Hura khong co trong danh muc', N'0_Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'Dầu ăn Tường An khong co trong danh muc', N'0_Dầu ăn Tường An', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'Coca cola khong co trong danh muc', N'0_Coca cola', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'Bánh ChocoPie khong co trong danh muc', N'0_Bánh ChocoPie', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'Coca cola khong co trong danh muc', N'0_Coca cola', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Sữa đậu nành Soya', N'Sữa đậu nành Soya khong co trong danh muc', N'0_Sữa đậu nành Soya', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh AFC', N'Bánh AFC khong co trong danh muc', N'0_Bánh AFC', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'Dầu ăn Tường An khong co trong danh muc', N'0_Dầu ăn Tường An', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'Dầu ăn Tường An khong co trong danh muc', N'0_Dầu ăn Tường An', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'Bánh ChocoPie khong co trong danh muc', N'0_Bánh ChocoPie', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Neptune', N'Dầu ăn Neptune khong co trong danh muc', N'0_Dầu ăn Neptune', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Neptune', N'Dầu ăn Neptune khong co trong danh muc', N'0_Dầu ăn Neptune', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'Kẹo Golia khong co trong danh muc', N'0_Kẹo Golia', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'Dầu ăn Tường An khong co trong danh muc', N'0_Dầu ăn Tường An', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'Cam ép Twister khong co trong danh muc', N'0_Cam ép Twister', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'Coca cola khong co trong danh muc', N'0_Coca cola', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'Bánh Hura khong co trong danh muc', N'0_Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'Bánh Goute khong co trong danh muc', N'0_Bánh Goute', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'Trà xanh O2 khong co trong danh muc', N'0_Trà xanh O2', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'Bánh Hura khong co trong danh muc', N'0_Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh AFC', N'Bánh AFC khong co trong danh muc', N'0_Bánh AFC', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bia Heineken', N'Bia Heineken khong co trong danh muc', N'0_Bia Heineken', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Pepsi', N'Pepsi khong co trong danh muc', N'0_Pepsi', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Sữa đậu nành Soya', N'Sữa đậu nành Soya khong co trong danh muc', N'0_Sữa đậu nành Soya', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Oreo', N'Bánh Oreo khong co trong danh muc', N'0_Bánh Oreo', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Alpenliebe', N'Kẹo Alpenliebe khong co trong danh muc', N'0_Kẹo Alpenliebe', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'Bánh Hura khong co trong danh muc', N'0_Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'Kẹo Golia khong co trong danh muc', N'0_Kẹo Golia', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Solo', N'Bánh Solo khong co trong danh muc', N'0_Bánh Solo', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bia Heineken', N'Bia Heineken khong co trong danh muc', N'0_Bia Heineken', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'Bánh Goute khong co trong danh muc', N'0_Bánh Goute', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'Bánh Goute khong co trong danh muc', N'0_Bánh Goute', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Cosy', N'Bánh Cosy khong co trong danh muc', N'0_Bánh Cosy', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'Trà xanh O2 khong co trong danh muc', N'0_Trà xanh O2', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Alpenliebe', N'Kẹo Alpenliebe khong co trong danh muc', N'0_Kẹo Alpenliebe', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Alpenliebe', N'Kẹo Alpenliebe khong co trong danh muc', N'0_Kẹo Alpenliebe', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Custa', N'Bánh Custa khong co trong danh muc', N'0_Bánh Custa', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Neptune', N'Dầu ăn Neptune khong co trong danh muc', N'0_Dầu ăn Neptune', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'Bánh ChocoPie khong co trong danh muc', N'0_Bánh ChocoPie', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'Cam ép Twister khong co trong danh muc', N'0_Cam ép Twister', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'Bánh Hura khong co trong danh muc', N'0_Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'Coca cola khong co trong danh muc', N'0_Coca cola', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh AFC', N'Bánh AFC khong co trong danh muc', N'0_Bánh AFC', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'Bánh Goute khong co trong danh muc', N'0_Bánh Goute', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'Trà xanh O2 khong co trong danh muc', N'0_Trà xanh O2', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'Bánh ChocoPie khong co trong danh muc', N'0_Bánh ChocoPie', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'Bánh Hura khong co trong danh muc', N'0_Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh AFC', N'Bánh AFC khong co trong danh muc', N'0_Bánh AFC', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bia Heineken', N'Bia Heineken khong co trong danh muc', N'0_Bia Heineken', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Neptune', N'Dầu ăn Neptune khong co trong danh muc', N'0_Dầu ăn Neptune', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'Cam ép Twister khong co trong danh muc', N'0_Cam ép Twister', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Pepsi', N'Pepsi khong co trong danh muc', N'0_Pepsi', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Sữa đậu nành Soya', N'Sữa đậu nành Soya khong co trong danh muc', N'0_Sữa đậu nành Soya', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Oreo', N'Bánh Oreo khong co trong danh muc', N'0_Bánh Oreo', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Cosy', N'Bánh Cosy khong co trong danh muc', N'0_Bánh Cosy', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Pepsi', N'Pepsi khong co trong danh muc', N'0_Pepsi', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'Bánh Hura khong co trong danh muc', N'0_Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'Kẹo Golia khong co trong danh muc', N'0_Kẹo Golia', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Pepsi', N'Pepsi khong co trong danh muc', N'0_Pepsi', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bia Heineken', N'Bia Heineken khong co trong danh muc', N'0_Bia Heineken', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'Bánh Goute khong co trong danh muc', N'0_Bánh Goute', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Neptune', N'Dầu ăn Neptune khong co trong danh muc', N'0_Dầu ăn Neptune', N'0_Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Cosy', N'Bánh Cosy khong co trong danh muc', N'0_Bánh Cosy', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'Trà xanh O2 khong co trong danh muc', N'0_Trà xanh O2', N'0_Nước ngọt')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Oreo', N'Bánh Oreo khong co trong danh muc', N'0_Bánh Oreo', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'hàng hóa đã tồn tại', N'HH001', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Neptune', N'hàng hóa đã tồn tại', N'HH006', N'Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bia Heineken', N'hàng hóa đã tồn tại', N'HH007', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'hàng hóa đã tồn tại', N'HH009', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'hàng hóa đã tồn tại', N'HH001', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'hàng hóa đã tồn tại', N'HH015', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'hàng hóa đã tồn tại', N'HH003', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'hàng hóa đã tồn tại', N'HH004', N'Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'hàng hóa đã tồn tại', N'HH002', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Pepsi', N'hàng hóa đã tồn tại', N'HH008', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Alpenliebe', N'hàng hóa đã tồn tại', N'HH014', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Oreo', N'hàng hóa đã tồn tại', N'HH012', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'hàng hóa đã tồn tại', N'HH009', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'hàng hóa đã tồn tại', N'HH013', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'hàng hóa đã tồn tại', N'HH011', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Sữa đậu nành Soya', N'hàng hóa đã tồn tại', N'HH010', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'hàng hóa đã tồn tại', N'HH009', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh AFC', N'hàng hóa đã tồn tại', N'HH005', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'hàng hóa đã tồn tại', N'HH013', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'hàng hóa đã tồn tại', N'HH015', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'hàng hóa đã tồn tại', N'HH004', N'Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'hàng hóa đã tồn tại', N'HH001', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'hàng hóa đã tồn tại', N'HH002', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'hàng hóa đã tồn tại', N'HH003', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'hàng hóa đã tồn tại', N'HH001', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Neptune', N'hàng hóa đã tồn tại', N'HH006', N'Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bia Heineken', N'hàng hóa đã tồn tại', N'HH007', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'hàng hóa đã tồn tại', N'HH009', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'hàng hóa đã tồn tại', N'HH001', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'hàng hóa đã tồn tại', N'HH015', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'hàng hóa đã tồn tại', N'HH003', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'hàng hóa đã tồn tại', N'HH015', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'hàng hóa đã tồn tại', N'HH003', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'hàng hóa đã tồn tại', N'HH004', N'Dầu ăn')
GO
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'hàng hóa đã tồn tại', N'HH002', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Pepsi', N'hàng hóa đã tồn tại', N'HH008', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Alpenliebe', N'hàng hóa đã tồn tại', N'HH014', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'hàng hóa đã tồn tại', N'HH002', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Oreo', N'hàng hóa đã tồn tại', N'HH012', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'hàng hóa đã tồn tại', N'HH009', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'hàng hóa đã tồn tại', N'HH002', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'hàng hóa đã tồn tại', N'HH013', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Hura', N'hàng hóa đã tồn tại', N'HH011', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'hàng hóa đã tồn tại', N'HH013', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Sữa đậu nành Soya', N'hàng hóa đã tồn tại', N'HH010', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Cam ép Twister', N'hàng hóa đã tồn tại', N'HH009', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh AFC', N'hàng hóa đã tồn tại', N'HH005', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'hàng hóa đã tồn tại', N'HH013', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'hàng hóa đã tồn tại', N'HH015', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'hàng hóa đã tồn tại', N'HH004', N'Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'hàng hóa đã tồn tại', N'HH001', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'hàng hóa đã tồn tại', N'HH002', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'hàng hóa đã tồn tại', N'HH003', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Snack khoai tây Slide', N'Snack khoai tây Slidekhông tồn tại', N'0_Snack khoai tây Slide', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Snack khoai tây O''star', N'Snack khoai tây O''starkhông tồn tại', N'0_Snack khoai tây O''star', N'0_Bánh kẹo')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH001', N'Trịnh Thanh Sang', N'Nam', N'KV01')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH002', N'Lê Anh Minh', N'Nam', N'KV02')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH003', N'Phan Thanh Tú', N'Nam', N'KV03')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH004', N'Trương Tấn Khoa', N'Nam', N'KV04')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH005', N'Trần Phương Dung', N'Nữ', N'KV05')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH006', N'Nguyễn Ngọc Quỳnh', N'Nữ', N'KV06')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH007', N'Huỳnh Hà Thanh', N'Nữ', N'KV07')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH008', N'Lê Trọng Tín', N'Nam', N'KV08')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH009', N'Nguyễn Thanh Phương', N'Nữ', N'KV09')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH010', N'Phạm Ngọc Huy', N'Nam', N'KV10')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH011', N'Lê Thu Hương', N'Nữ', N'KV01')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH012', N'Selena K.', N'Nữ', N'KV11')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH013', N'Roger L.', N'Nam', N'KV12')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH014', N'Justin S.', N'Nam', N'KV13')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'KH015', N'Christain D.', N'Nam', N'KV14')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0161', N'Nguyễn Cẩm Tú', N'Female', N'Quảng NgãiMiddle VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0151', N'Lê Thành Tài', N'Male ', N'Bình DươngSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0152', N'Trần Thanh Tâm', N'Female', N'Hải PhòngNorthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0153', N'Trần Bình Minh', N'Male', N'Đà NẵngMiddle VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0154', N'Phan Ngọc Đức', N'Male', N'HuếMiddle VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0141', N'Phạm Thanh Sơn', N'Male ', N'Đồng NaiSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0142', N'Lê Mỹ Dung', N'Female', N'Hà NộiNorthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0131', N'Lê Thanh Bình', N'Male ', N'HCMSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0132', N'Nguyễn Cao Cường', N'Male', N'Cần ThơSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0121', N'Richard S.', N'Male ', N'BostonNew JerseyUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0122', N'Michael N.', N'Male', N'OrlandoFloridaUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0123', N'Mick D.', N'Male', N'San FranciscoCaliforniaUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0124', N'Nguyễn Thanh Hằng', N'Female', N'HCMSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0125', N'Lê Như Quỳnh', N'Female', N'Nam ĐịnhNorthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0111', N'Jane.L', N'Female', N'AustinTexasUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0112', N'Katerine.M', N'Female', N'OrlandoFloridaUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0113', N'John F.', N'Male', N'AustinTexasUSA')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Quảng NgãiMiddle VietnamVietnam', N'Việt Nam', N'Miền Trung', N'Quảng Ngãi')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Bình DươngSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Bình Dương')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Hải PhòngNorthern VietnamVietnam', N'Việt Nam', N'Miền Bắc', N'Hải Phòng')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Đà NẵngMiddle VietnamVietnam', N'Việt Nam', N'Miền Trung', N'Tp.Đà Nẵng')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'HuếMiddle VietnamVietnam', N'Việt Nam', N'Miền Trung', N'Huế')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Đồng NaiSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Đồng Nai')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Hà NộiNorthern VietnamVietnam', N'Việt Nam', N'Miền Bắc', N'Tp. Hà Nội')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV01', N'Việt Nam', N'Miền Nam', N'Tp. Hồ Chí Minh')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV02', N'Việt Nam', N'Miền Nam', N'Bến Tre')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV03', N'Việt Nam', N'Miền Nam', N'Kiên Giang')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV04', N'Việt Nam', N'Miền Nam', N'Tiền Giang')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV05', N'Việt Nam', N'Miền Bắc', N'Tp. Hà Nội')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV06', N'Việt Nam', N'Miền Bắc', N'Ninh Bình')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV07', N'Việt Nam', N'Miền Bắc', N'Hải Dương')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV08', N'Việt Nam', N'Miền Trung', N'Tp.Đà Nẵng')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV09', N'Việt Nam', N'Miền Trung', N'Quảng Trị')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV10', N'Việt Nam', N'Miền Trung', N'Quảng Ngãi')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV11', N'Hoa Kỳ', N'Illinois', N'Chicago')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV12', N'Hoa Kỳ', N'Texas', N'San Antonio')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV13', N'Hoa Kỳ', N'Ohio', N'Columbus')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'KV14', N'Hoa Kỳ', N'Georgia', N'Atlanta')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'HCMSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Tp. Hồ Chí Minh')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Cần ThơSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Cần Thơ')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'BostonNew JerseyUSA', N'Hoa Kỳ', N'New Jersey', N'Boston')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'OrlandoFloridaUSA', N'Hoa Kỳ', N'Florida', N'Orlando')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'San FranciscoCaliforniaUSA', N'Hoa Kỳ', N'California', N'San Francisco')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'HCMSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Tp. Hồ Chí Minh')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Nam ĐịnhNorthern VietnamVietnam', N'Việt Nam', N'Miền Bắc', N'Nam Định')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'AustinTexasUSA', N'Hoa Kỳ', N'Texas', N'Austin')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'OrlandoFloridaUSA', N'Hoa Kỳ', N'Florida', N'Orlando')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'AustinTexasUSA', N'Hoa Kỳ', N'Texas', N'Austin')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'{4EDB7574-A2E6-433C-AEAC-B9ADBF8FFFE2}', N'6', N'12000', N'72000', N'S0011')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{4EDB7574-A2E6-433C-AEAC-B9ADBF8FFFE2}', N'15', N'10500', N'157500', N'S0011')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'{592F9BC9-756C-4BD1-B7D8-90FB59909920}', N'10', N'8500', N'85000', N'S0012')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{592F9BC9-756C-4BD1-B7D8-90FB59909920}', N'7', N'21500', N'150500', N'S0012')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'{2BFEA7A7-0C5D-415C-86F4-52D15ECB1444}', N'4', N'15600', N'62400', N'S0013')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'{2BFEA7A7-0C5D-415C-86F4-52D15ECB1444}', N'10', N'7500', N'75000', N'S0013')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'{2BFEA7A7-0C5D-415C-86F4-52D15ECB1444}', N'8', N'14700', N'117600', N'S0013')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{91901CA2-F0B4-4898-B76A-967545E8A103}', N'15', N'10500', N'157500', N'S0014')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{592F9BC9-756C-4BD1-B7D8-90FB59909920}', N'6', N'21500', N'129000', N'S0015')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{592F9BC9-756C-4BD1-B7D8-90FB59909920}', N'15', N'17000', N'255000', N'S0015')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{592F9BC9-756C-4BD1-B7D8-90FB59909920}', N'10', N'38500', N'385000', N'S0015')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'{4EDB7574-A2E6-433C-AEAC-B9ADBF8FFFE2}', N'10', N'12000', N'120000', N'S0016')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Pepsi', N'{4EDB7574-A2E6-433C-AEAC-B9ADBF8FFFE2}', N'4', N'8000', N'32000', N'S0016')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH010', N'{2BFEA7A7-0C5D-415C-86F4-52D15ECB1444}', N'20', N'11000', N'220000', N'S0017')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'{2BFEA7A7-0C5D-415C-86F4-52D15ECB1444}', N'10', N'16800', N'168000', N'S0017')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Cosy', N'{AAF46991-3FC0-415A-93D6-8FBC87CCFA92}', N'10', N'9000', N'90000', N'S0018')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Pepsi', N'{AAF46991-3FC0-415A-93D6-8FBC87CCFA92}', N'12', N'8000', N'96000', N'S0018')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{91901CA2-F0B4-4898-B76A-967545E8A103}', N'30', N'10500', N'315000', N'S0019')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'{AAF46991-3FC0-415A-93D6-8FBC87CCFA92}', N'14', N'12500', N'175000', N'S0020')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Pepsi', N'{AAF46991-3FC0-415A-93D6-8FBC87CCFA92}', N'10', N'8000', N'80000', N'S0020')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{AAF46991-3FC0-415A-93D6-8FBC87CCFA92}', N'12', N'17000', N'204000', N'S0020')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'{059887CC-059F-483A-A4D3-E34A0D605ACA}', N'15', N'15600', N'234000', N'S0021')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{059887CC-059F-483A-A4D3-E34A0D605ACA}', N'2', N'38500', N'77000', N'S0021')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Cosy', N'{059887CC-059F-483A-A4D3-E34A0D605ACA}', N'5', N'9000', N'45000', N'S0021')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'{397CF326-8A40-478C-806F-F7F678A2818A}', N'7', N'7500', N'52500', N'S0022')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'{397CF326-8A40-478C-806F-F7F678A2818A}', N'15', N'16800', N'252000', N'S0022')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Alpenliebe', N'{17FFDD3C-46F5-4F58-9832-5F5B3E679083}', N'10', N'5800', N'58000', N'S0023')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{17FFDD3C-46F5-4F58-9832-5F5B3E679083}', N'8', N'10500', N'84000', N'S0023')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'{0CB90F4B-E45F-4278-860F-5BE7FE7D9C7C}', N'7', N'32000', N'224000', N'S0024')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'{0CB90F4B-E45F-4278-860F-5BE7FE7D9C7C}', N'12', N'8500', N'102000', N'S0024')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'{0CB90F4B-E45F-4278-860F-5BE7FE7D9C7C}', N'8', N'14700', N'117600', N'S0025')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'{397CF326-8A40-478C-806F-F7F678A2818A}', N'10', N'8500', N'85000', N'S0026')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH010', N'{397CF326-8A40-478C-806F-F7F678A2818A}', N'20', N'11000', N'220000', N'S0026')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{17FFDD3C-46F5-4F58-9832-5F5B3E679083}', N'15', N'21500', N'322500', N'S0027')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'{17FFDD3C-46F5-4F58-9832-5F5B3E679083}', N'3', N'32000', N'96000', N'S0027')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'{397CF326-8A40-478C-806F-F7F678A2818A}', N'11', N'32000', N'352000', N'S0028')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'{059887CC-059F-483A-A4D3-E34A0D605ACA}', N'17', N'14700', N'249900', N'S0029')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{059887CC-059F-483A-A4D3-E34A0D605ACA}', N'5', N'38500', N'192500', N'S0029')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{397CF326-8A40-478C-806F-F7F678A2818A}', N'7', N'38500', N'269500', N'S0030')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'{397CF326-8A40-478C-806F-F7F678A2818A}', N'3', N'12500', N'37500', N'S0030')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'{0EC69DED-9EF6-4981-936E-EA4F168EBE8C}', N'5', N'32000', N'160000', N'S0001')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'{0EC69DED-9EF6-4981-936E-EA4F168EBE8C}', N'15', N'12000', N'180000', N'S0001')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'{0EC69DED-9EF6-4981-936E-EA4F168EBE8C}', N'7', N'8500', N'59500', N'S0001')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{9EEB9786-9410-466E-AD2A-D334A31BB855}', N'5', N'10500', N'52500', N'S0002')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'{9EEB9786-9410-466E-AD2A-D334A31BB855}', N'12', N'15600', N'187200', N'S0002')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'{9EEB9786-9410-466E-AD2A-D334A31BB855}', N'5', N'7500', N'37500', N'S0002')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{D19A7DD9-CC3C-4CE1-9F2C-724F235B41E0}', N'6', N'10500', N'63000', N'S0003')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{D19A7DD9-CC3C-4CE1-9F2C-724F235B41E0}', N'4', N'21500', N'86000', N'S0003')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{D19A7DD9-CC3C-4CE1-9F2C-724F235B41E0}', N'5', N'17000', N'85000', N'S0003')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Pepsi', N'{6DC8CEAE-23A6-47E6-826D-EEDD23AC3E54}', N'6', N'8000', N'48000', N'S0004')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH010', N'{6DC8CEAE-23A6-47E6-826D-EEDD23AC3E54}', N'3', N'11000', N'33000', N'S0004')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'{E69F4363-556A-4734-AF67-F7DDAE254C91}', N'7', N'16800', N'117600', N'S0005')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Alpenliebe', N'{E69F4363-556A-4734-AF67-F7DDAE254C91}', N'8', N'5800', N'46400', N'S0005')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{E69F4363-556A-4734-AF67-F7DDAE254C91}', N'3', N'10500', N'31500', N'S0005')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'{7A54A96C-9AC9-4068-B5B5-F92239AFDE96}', N'7', N'12500', N'87500', N'S0006')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Solo', N'{7A54A96C-9AC9-4068-B5B5-F92239AFDE96}', N'10', N'7500', N'75000', N'S0006')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{6DC8CEAE-23A6-47E6-826D-EEDD23AC3E54}', N'6', N'17000', N'102000', N'S0007')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'{6DC8CEAE-23A6-47E6-826D-EEDD23AC3E54}', N'5', N'15600', N'78000', N'S0007')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'{6DC8CEAE-23A6-47E6-826D-EEDD23AC3E54}', N'4', N'15600', N'62400', N'S0008')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Cosy', N'{6DC8CEAE-23A6-47E6-826D-EEDD23AC3E54}', N'10', N'9000', N'90000', N'S0008')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'{77083872-4FF7-44E1-A36D-28C9CE50D792}', N'3', N'7500', N'22500', N'S0009')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Alpenliebe', N'{77083872-4FF7-44E1-A36D-28C9CE50D792}', N'13', N'5800', N'75400', N'S0009')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Alpenliebe', N'{77083872-4FF7-44E1-A36D-28C9CE50D792}', N'13', N'5800', N'75400', N'S0009')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Custa', N'{1BB12005-AB44-49F8-B77C-F9DDA57866DB}', N'15', N'11000', N'165000', N'S0010')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{1BB12005-AB44-49F8-B77C-F9DDA57866DB}', N'4', N'38500', N'154000', N'S0010')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'{1BB12005-AB44-49F8-B77C-F9DDA57866DB}', N'6', N'14700', N'88200', N'S0010')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'KH001', N'15', N'8500', N'127500', N'1')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Snack khoai tây Slide', N'KH001', N'3', N'14500', N'43500', N'2')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'KH005', N'15', N'18500', N'277500', N'3')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'KH002', N'12', N'12500', N'150000', N'4')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'KH011', N'20', N'23000', N'460000', N'5')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'KH001', N'12', N'8500', N'102000', N'6')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'KH001', N'5', N'14500', N'72500', N'7')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'KH014', N'15', N'34500', N'517500', N'8')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'KH005', N'2', N'19700', N'39400', N'9')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'KH003', N'8', N'10000', N'80000', N'10')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Pepsi', N'KH004', N'3', N'17000', N'51000', N'11')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Alpenliebe', N'KH012', N'15', N'6500', N'97500', N'12')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'KH003', N'11', N'9000', N'99000', N'13')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'KH010', N'5', N'23000', N'115000', N'14')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'KH014', N'5', N'25000', N'125000', N'15')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'KH015', N'9', N'15000', N'135000', N'16')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH010', N'KH013', N'5', N'21000', N'105000', N'17')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'KH004', N'2', N'23000', N'46000', N'18')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'KH006', N'3', N'16700', N'50100', N'19')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'KH007', N'2', N'25000', N'50000', N'20')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'KH008', N'1', N'14500', N'14500', N'21')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'KH009', N'7', N'19700', N'137900', N'22')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'KH015', N'5', N'8500', N'42500', N'23')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'KH006', N'68', N'9000', N'612000', N'24')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'KH013', N'50', N'34500', N'1725000', N'25')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'KH001', N'15', N'8500', N'127500', N'26')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'KH005', N'15', N'18500', N'277500', N'27')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'KH002', N'12', N'12500', N'150000', N'28')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'KH011', N'20', N'23000', N'460000', N'29')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'KH001', N'12', N'8500', N'102000', N'30')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'KH002', N'5', N'14500', N'72500', N'31')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'KH014', N'1', N'34500', N'34500', N'32')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'KH001', N'5', N'14500', N'72500', N'33')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'KH014', N'15', N'34500', N'517500', N'34')
GO
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'KH005', N'2', N'19700', N'39400', N'35')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'KH003', N'8', N'10000', N'80000', N'36')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Pepsi', N'KH004', N'3', N'17000', N'51000', N'37')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Alpenliebe', N'KH012', N'15', N'6500', N'97500', N'38')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'KH006', N'18', N'9000', N'162000', N'39')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Snack khoai tây O''star', N'KH004', N'25', N'5500', N'137500', N'40')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'KH003', N'11', N'9000', N'99000', N'41')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'KH010', N'5', N'23000', N'115000', N'42')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'KH005', N'12', N'9000', N'108000', N'43')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'KH014', N'5', N'25000', N'125000', N'44')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'KH015', N'9', N'15000', N'135000', N'45')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'KH014', N'7', N'25000', N'175000', N'46')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH010', N'KH013', N'5', N'21000', N'105000', N'47')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Cam ép Twister', N'KH004', N'2', N'23000', N'46000', N'48')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'KH006', N'3', N'16700', N'50100', N'49')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Goute', N'KH007', N'2', N'25000', N'50000', N'50')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Kẹo Golia', N'KH008', N'1', N'14500', N'14500', N'51')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Dầu ăn Tường An', N'KH009', N'7', N'19700', N'137900', N'52')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Trà xanh O2', N'KH015', N'5', N'8500', N'42500', N'53')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Coca cola', N'KH006', N'68', N'9000', N'612000', N'54')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh ChocoPie', N'KH013', N'50', N'34500', N'1725000', N'55')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'7d41dd24-f93d-4915-af67-035ea5923cae', N'Rainbow Grocery Store', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'Cus0121', N'11', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'f1123421-7f60-4981-b6a7-045ce8cfa09c', N'Cửa hàng Q.5', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'4', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'd0385d78-7c53-4c6c-902c-05aab4636626', N'Cửa hàng thực phẩm số 3', N'549d189d-f616-42ec-b92a-a4bcafeaa246', N'Lê Trọng Tín', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'3e798bb8-6f67-4159-87eb-06fe49c55d2f', N'Cửa hàng Q.10', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'Christain D.', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'3c5220ee-1c2c-474f-b190-110faa0205d3', N'Cửa hàng thực phẩm số 1', N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'Lê Anh Minh', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ed15c405-4e7a-471c-8775-12836fff4ddc', N'Cửa hàng thực phẩm số 3', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'Trương Tấn Khoa', N'6', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'bb448487-65b1-48d9-a9e5-143775183756', N'Cửa hàng Q.10', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'0aed8c00-d101-41e0-ba30-15833a7e35e8', N'Cửa hàng thực phẩm số 1', N'059887cc-059f-483a-a4d3-e34a0d605aca', N'Cus0154', N'2', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'55468dc4-0d9c-4e87-8d17-159392f97965', N'Foodie Store', N'd19a7dd9-cc3c-4ce1-9f2c-724f235b41e0', N'Cus0122', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8a0c3120-98e8-4319-9422-1955104f1e88', N'Cửa hàng thực phẩm số 3', N'549d189d-f616-42ec-b92a-a4bcafeaa246', N'Lê Trọng Tín', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'202f1d34-eb4f-461f-a302-1ae55a3ba73c', N'Cửa hàng thực phẩm số 1', N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'Cus0161', N'10', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'de587022-7bb7-4c34-b2a4-22d2c00f4fb7', N'Cửa hàng Q.10', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'Christain D.', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'd9b80f76-2cc6-4264-ab99-287b7202311f', N'Cửa hàng thực phẩm số 2', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'Phan Thanh Tú', N'5', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'756a367b-d067-4f08-b885-29e237b20009', N'Royal Blue Grocery', N'7a54a96c-9ac9-4068-b5b5-f92239afde96', N'Cus0113', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'cf0cfdd7-d724-4b17-8c81-2cf91099afc4', N'Royal Blue Grocery', N'0ec69ded-9ef6-4981-936e-ea4f168ebe8c', N'Cus0112', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'27c23bd4-8ee8-406a-803e-2d5b3b195023', N'Cửa hàng thực phẩm số 2', N'77083872-4ff7-44e1-a36d-28c9ce50d792', N'Cus0124', N'5', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'a0876344-ea67-4445-ba52-2dac6cf2d4eb', N'Cửa hàng thực phẩm số 2', N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'Cus0152', N'9', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'262efaf4-f4d2-4983-8f3e-2dbaa47ced19', N'Rainbow Grocery Store', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'Justin S.', N'4', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'bd2d8d97-8518-4895-ab50-2e63741c30ca', N'Cửa hàng thực phẩm số 3', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'Trương Tấn Khoa', N'10', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'430434d3-61af-4e77-8aa3-300d26fa5e5b', N'Cửa hàng thực phẩm số 2', N'1bb12005-ab44-49f8-b77c-f9dda57866db', N'Cus0125', N'6', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'575dc787-3ea0-4324-9e97-3051a5ccaec2', N'Cửa hàng thực phẩm số 2', N'91901ca2-f0b4-4898-b76a-967545e8a103', N'Cus0142', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'3f056472-1d71-4124-81ec-31b2043406a2', N'Cửa hàng Q.10', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'Christain D.', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'5445316c-7ad7-44f1-9b1b-3744aa43d85f', N'Cửa hàng thực phẩm số 2', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'Phan Thanh Tú', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'd2ef48da-dc60-4a1f-b965-38e0e8db63bc', N'Orlando Grocery', N'8b76d5d2-91ea-4d54-9bd2-f2a641499904', N'Selena K.', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'729f9c97-5e75-4c6c-b93a-3b0c556b3cc0', N'Cửa hàng thực phẩm số 2', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'Phan Thanh Tú', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'59d28f40-87b9-4c42-a3ec-3cd2c94a4c9a', N'Rainbow Grocery Store', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'Cus0121', N'2', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'5b68ced3-ec51-45aa-afde-4046a35fece6', N'Orlando Grocery', N'9eeb9786-9410-466e-ad2a-d334a31bb855', N'Cus0111', N'1', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'38743d23-caa1-4d6d-b5d2-448212abb574', N'Rainbow Grocery Store', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'Justin S.', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'36258c1f-48d4-4ef0-9b6e-4741747ac81c', N'Cửa hàng thực phẩm số 1', N'059887cc-059f-483a-a4d3-e34a0d605aca', N'Cus0154', N'11', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'58431034-3555-4d1b-a36f-4b3e99f90b8d', N'Cửa hàng thực phẩm số 3', N'397cf326-8a40-478c-806f-f7f678a2818a', N'Cus0153', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'85b4ff1e-9d21-4f8e-87ca-4c7cec2deed1', N'Cửa hàng thực phẩm số 4', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'Nguyễn Ngọc Quỳnh', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'da8d6278-26e2-4179-a9de-4cc1a718e41b', N'Rainbow Grocery Store', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'Justin S.', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'56cc095f-bc22-4c96-8071-4dc6e0e364ad', N'Foodie Store', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'Roger L.', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1bd8b391-2947-484a-86a5-4ef97716ce71', N'Cửa hàng thực phẩm số 4', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'Nguyễn Ngọc Quỳnh', N'11', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1c304a43-6430-40d9-a6ef-518f29a69215', N'Cửa hàng thực phẩm số 4', N'798bf331-281b-4a18-af93-47d3c7c73996', N'Trần Phương Dung', N'5', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'424b3d53-772a-4749-b645-520529ea0d69', N'Cửa hàng thực phẩm số 4', N'798bf331-281b-4a18-af93-47d3c7c73996', N'Trần Phương Dung', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'edcb4cb9-2bad-48b4-93d9-528b8ffecdb3', N'Cửa hàng thực phẩm số 3', N'9b34950d-b3d1-4f54-9a3c-84e98b72554d', N'Nguyễn Thanh Phương', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'f44b86fb-46f5-42b8-810d-5dc3bf742e1a', N'Cửa hàng thực phẩm số 2', N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'Cus0152', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'a906fc16-108c-4060-910c-5de7170718cb', N'Foodie Store', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'Roger L.', N'8', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'6b4d135c-12a7-435a-9b1e-62f503dbaa68', N'Cửa hàng thực phẩm số 1', N'397cf326-8a40-478c-806f-f7f678a2818a', N'Cus0153', N'8', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'79cb9ad5-9d65-4a43-b2e3-67370e5010e7', N'Cửa hàng thực phẩm số 2', N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'Phan Thanh Tú', N'7', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'b6324b98-c63d-4b85-88f6-69afc01c5bdf', N'Cửa hàng thực phẩm số 1', N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'Cus0141', N'9', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'9ecac14b-4195-4fb1-bae8-7346f6d3ae76', N'Cửa hàng thực phẩm số 3', N'9b34950d-b3d1-4f54-9a3c-84e98b72554d', N'Nguyễn Thanh Phương', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ced784be-4c18-4356-814f-77bc52a7eead', N'Foodie Store', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'Roger L.', N'9', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e631150c-7433-43f9-a931-83dd61d0cbc2', N'Cửa hàng Q.10', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'1', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'80015537-e39f-4524-9987-841054126df6', N'Cửa hàng Q.5', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'4', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'a3e0d81e-7664-4778-bb92-8690a6493fb3', N'Cửa hàng thực phẩm số 4', N'798bf331-281b-4a18-af93-47d3c7c73996', N'Trần Phương Dung', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'41a21d4b-d7e7-437e-bb7d-8994d9b6718d', N'Cửa hàng thực phẩm số 3', N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'Cus0132', N'1', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'b33c1c75-d047-4e42-a585-8cb04168a6bf', N'Royal Blue Grocery', N'663750c3-515b-4c0b-8ab3-b569a2a492ab', N'Lê Thu Hương', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'7434cf63-44fb-401a-9a3f-8dd324a46feb', N'Foodie Store', N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'Roger L.', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ce39c155-fae5-453f-a803-90e26582a77b', N'Rainbow Grocery Store', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'Justin S.', N'4', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'edb45f72-1cac-42e9-99e9-94ab5fd5f5b1', N'Cửa hàng thực phẩm số 1', N'0cb90f4b-e45f-4278-860f-5be7fe7d9c7c', N'Cus0151', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'0411f907-e4cf-4bd5-8c86-9733acb34dfd', N'Cửa hàng thực phẩm số 4', N'e77966bc-9d7b-4090-9da1-3c69ad37cf7c', N'Huỳnh Hà Thanh', N'11', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'a5d20e1c-aecb-42bc-8c89-987734d25455', N'Cửa hàng thực phẩm số 2', N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'Cus0141', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'bc35084e-89fe-4105-830c-98d92480eebb', N'Cửa hàng thực phẩm số 3', N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'Cus0161', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'b43e06fd-a678-4cb5-9337-98f0adce5d4b', N'Cửa hàng thực phẩm số 1', N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'Lê Anh Minh', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'f3ee4c70-57ed-427d-86ac-99fae01d7793', N'Cửa hàng Q.10', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'1', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'6fd073ae-d9c6-46a0-aabe-9c305b5f9f49', N'Cửa hàng thực phẩm số 3', N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'Cus0132', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'35369b57-7feb-4f03-858d-a2b61adc81a2', N'Orlando Grocery', N'8b76d5d2-91ea-4d54-9bd2-f2a641499904', N'Selena K.', N'6', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'4ecf3731-a17d-4c82-9019-a60d96ce6ee5', N'Cửa hàng Q.5', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'1', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'2b24fb26-42de-46fe-be2d-a72769376ea2', N'Cửa hàng thực phẩm số 4', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'Nguyễn Ngọc Quỳnh', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'0c85c606-b97c-48da-a74e-ab27c0d0aac5', N'Cửa hàng Q.10', N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e0623f3f-7727-4dd7-8249-ae46dc80ef09', N'Cửa hàng thực phẩm số 3', N'a17ffef4-fa29-49d5-9729-070c5dfa1bae', N'Phạm Ngọc Huy', N'7', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'55f0d5b5-948c-4908-a85a-b1d56ac8d4c2', N'Cửa hàng thực phẩm số 1', N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'Lê Anh Minh', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'cd2d0c01-ec1b-4e2e-979b-b4227745e9d7', N'Rainbow Grocery Store', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'Justin S.', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e0fb8f71-cf8d-4a47-bcad-c62e66cfdce9', N'Cửa hàng thực phẩm số 4', N'e77966bc-9d7b-4090-9da1-3c69ad37cf7c', N'Huỳnh Hà Thanh', N'11', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'5153c8e1-045c-47f6-85ff-c7fddac06400', N'Cửa hàng thực phẩm số 3', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'Trương Tấn Khoa', N'9', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e98d350f-5fdd-479d-bc32-c80fac7c8ccd', N'Rainbow Grocery Store', N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'Cus0121', N'11', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'963b1cf8-7c74-4379-9d19-ca3c8b6aa124', N'Foodie Store', N'e69f4363-556a-4734-af67-f7ddae254c91', N'Cus0123', N'10', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'0d6feb68-63cc-4bd4-8e89-cdbefd9123f6', N'Cửa hàng Q.10', N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'Christain D.', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'2d067c08-56cf-4f53-b09c-d09fffe7c349', N'Cửa hàng thực phẩm số 3', N'a17ffef4-fa29-49d5-9729-070c5dfa1bae', N'Phạm Ngọc Huy', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e93609fd-912a-40fd-a9d6-d30ef21f4786', N'Cửa hàng thực phẩm số 1', N'0cb90f4b-e45f-4278-860f-5be7fe7d9c7c', N'Cus0151', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'707983f2-0824-41a9-9e4b-d660e5cf6024', N'Cửa hàng thực phẩm số 1', N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'Cus0131', N'1', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8ff53b29-31ca-472b-85a3-d7f5628c5918', N'Cửa hàng thực phẩm số 3', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'Trương Tấn Khoa', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'15bcc5c5-6544-4477-bf7f-d97b19af0b14', N'Cửa hàng thực phẩm số 2', N'397cf326-8a40-478c-806f-f7f678a2818a', N'Cus0153', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'7222e3d6-ed2f-4996-8144-ddce27c64b80', N'Cửa hàng thực phẩm số 1', N'798bf331-281b-4a18-af93-47d3c7c73996', N'Trần Phương Dung', N'2', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'f7978c06-bf26-4901-be38-df58bcc0573b', N'Cửa hàng thực phẩm số 4', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'Nguyễn Ngọc Quỳnh', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ab3cf692-d89b-48ba-9d55-e2e0bcd10ba1', N'Cửa hàng thực phẩm số 3', N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'Trương Tấn Khoa', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'27c60367-e9f9-4da1-8638-e87bd795baa8', N'Royal Blue Grocery', N'663750c3-515b-4c0b-8ab3-b569a2a492ab', N'Lê Thu Hương', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'b0fef731-7db5-407d-9a9f-e88978bad5c1', N'Cửa hàng thực phẩm số 4', N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'Nguyễn Ngọc Quỳnh', N'10', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'764ad23f-450b-4681-80b7-e935b9d6bf88', N'Cửa hàng thực phẩm số 3', N'91901ca2-f0b4-4898-b76a-967545e8a103', N'Cus0142', N'4', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'6586fdd7-3838-46bc-8311-ed0fa9c3924f', N'Cửa hàng thực phẩm số 1', N'798bf331-281b-4a18-af93-47d3c7c73996', N'Trần Phương Dung', N'2', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'd86669bb-2338-4786-b058-ee61efbd6811', N'Cửa hàng thực phẩm số 2', N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'Cus0131', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'55b97416-6198-41a0-b814-f0787557d523', N'Royal Blue Grocery', N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'Justin S.', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'f39e9a88-cd9a-42a3-b20a-f9c626832ad0', N'Cửa hàng thực phẩm số 2', N'397cf326-8a40-478c-806f-f7f678a2818a', N'Cus0153', N'10', N'4', N'2014')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'2', N'19700', N'39400', N'ee95ba9f-37bd-45a6-a7b9-00e9efb6b985')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'10', N'16800', N'168000', N'92ec0d89-e15e-4a53-baa0-02f820c59578')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'7', N'7500', N'52500', N'9ede732d-067d-47e3-966e-03cca5af597b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'17', N'14700', N'249900', N'7ab7c0de-36a7-43e1-b4ae-050d20a7c31c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'20', N'23000', N'460000', N'2a5dc6f0-05b4-496d-a7d5-06d7d94774c0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'7', N'19700', N'137900', N'f89bc1a1-9baf-47ec-81db-09681a92a269')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'5', N'9000', N'45000', N'81e58a69-bc06-42c9-b3a6-0c2ddd16e13c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'15', N'6500', N'97500', N'e11f41fe-9d1f-4c4d-b265-0d1a0f37dd76')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da0ca760-2158-43f6-84cb-bc7290172722', N'3', N'11000', N'33000', N'69a6b221-343c-4041-93ec-0df6c7355fdc')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c4f9bf97-f0b9-4f27-a8e9-d149def351e2', N'25', N'5500', N'137500', N'2cb3c722-7199-4bcc-bc0e-0e2416686042')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'5', N'38500', N'192500', N'8ca5ee1b-7147-4179-8dce-19916980caea')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'6', N'10500', N'63000', N'ca4fcabd-b98e-40e9-80fb-1b88f90790ea')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'8', N'10000', N'80000', N'eb3e5904-97de-4f68-83f8-216851eacea1')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'68', N'9000', N'612000', N'a63ae44f-cd90-4b78-ab69-21ea3bc3df22')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'7', N'32000', N'224000', N'369071a6-cdcf-4cda-923c-24de43dced07')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'9', N'15000', N'135000', N'b7000bb7-0c69-4122-9e57-2581d471188d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'6', N'17000', N'102000', N'4e804787-9ad1-40fa-978a-282e4f7a7028')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6127a7b-e761-4658-afcb-42e0c52ed586', N'10', N'7500', N'75000', N'8b9d734e-e519-4234-9c58-28ed7742a628')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'11', N'9000', N'99000', N'031d2f31-2eb0-4845-9e3e-2a664d415d51')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'10', N'8500', N'85000', N'74a095ce-23d5-4ea6-b9f6-2aa2a5db423b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'10', N'12000', N'120000', N'e4db5c86-d41e-4112-8635-2cf71deca362')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'1', N'14500', N'14500', N'd1a9490b-fc2e-4c7d-acf9-2d927f2fd13b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'5', N'32000', N'160000', N'424326b3-10bc-45ba-85a7-2fc9d95ab352')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'10', N'5800', N'58000', N'5d217fd0-785c-4597-bfb4-30250566f8c3')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'50', N'34500', N'1725000', N'c96be79f-7be1-4a39-8576-30f268e5fbf6')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da0ca760-2158-43f6-84cb-bc7290172722', N'20', N'11000', N'220000', N'a0855e1d-3518-4d07-9164-311171bb8f75')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'15', N'6500', N'97500', N'409314e9-a580-4ac6-909e-324260762cbc')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'6', N'14700', N'88200', N'ed825d9a-93ac-4b75-ba05-32ad6ebad30d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'13', N'5800', N'75400', N'c7a0e299-c69b-40f2-b69c-33833daf7696')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'5', N'23000', N'115000', N'3a54f6eb-938a-4b51-9438-3daa03efca97')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'15', N'10500', N'157500', N'327699a4-0f06-455e-a048-3f4f0fc7ef50')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'15', N'8500', N'127500', N'c619b51e-7612-4b72-b05c-3f53e28eed95')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'5', N'10500', N'52500', N'20e17eeb-177f-416b-9a1b-42da54a82e01')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'15', N'18500', N'277500', N'e0be20af-5d8a-41b1-a4e6-45fa79257c47')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'12', N'8500', N'102000', N'874cc505-685d-440d-a000-4a917b0313b2')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'15', N'8500', N'127500', N'82ac8146-4bab-4a20-b82f-4aea2ebd8ba7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'12', N'12500', N'150000', N'b1977ecd-1287-4fa7-9902-4dd9d5a8e8a0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'10', N'9000', N'90000', N'3706834e-70c0-4459-95f4-50b1d2f13c8b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'15', N'18500', N'277500', N'386209cd-60de-4206-a180-51e0e0fbf325')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'1', N'14500', N'14500', N'975bba0a-757d-4c48-87a8-52205d2c4aba')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'7', N'8500', N'59500', N'3848c195-02de-4965-8ddc-524f3eedde85')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'10', N'38500', N'385000', N'a51b1b4f-c969-4b8c-8976-536b17ad241c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'12', N'8000', N'96000', N'cc403675-a64c-42cb-a476-57ea9ab62c63')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'15', N'21500', N'322500', N'5d7a250e-2bc9-4d2b-bcc4-5c2ec6f35513')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'12', N'17000', N'204000', N'c2874fd3-9976-464b-bb1a-5ce1db64c16b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'15', N'34500', N'517500', N'62b72d79-4722-43f4-900f-5e26c7ebbf1c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'6', N'8000', N'48000', N'924ae7ca-f0ec-4f81-bc84-5eca56eebfaf')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'15', N'10500', N'157500', N'8aa4ebb7-08d2-40c8-8d41-640c3b804741')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'4', N'15600', N'62400', N'7bf480d6-8fc7-4125-8c6a-65fb3b2fb4a7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'20', N'23000', N'460000', N'29294c9a-ee2c-4351-a7b4-66aaf1eb4e1f')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'425c690f-7eb2-496b-8a11-18ae6bb32ef0', N'15', N'11000', N'165000', N'67aa7c2a-2c30-44b7-8858-6bac4c33afa4')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'4', N'8000', N'32000', N'ece33de0-3bc8-4142-af24-6ca9f323e0cb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'8', N'10500', N'84000', N'd5db8cda-fe82-4999-b725-6cb5ff447afb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'15', N'34500', N'517500', N'eabca8ca-4dc5-4012-99b8-6cecd22c2ce7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'3', N'10500', N'31500', N'283712d8-ec28-4845-8cd7-6e95902c467e')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da0ca760-2158-43f6-84cb-bc7290172722', N'20', N'11000', N'220000', N'065d4218-8b94-4f5d-b2eb-6ee9d124ea12')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'68', N'9000', N'612000', N'76e1633a-f80c-401f-940d-6f32bb3750fb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'3', N'16700', N'50100', N'dde9d315-1994-4cd8-beb2-706a04ca0b93')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'10', N'8500', N'85000', N'57fa53b9-17fc-4b1f-ae59-71b3ee7fac64')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'9', N'15000', N'135000', N'b9aba792-2e54-4047-9a7e-72e501cf6810')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'5', N'14500', N'72500', N'26c841ae-414a-416b-8314-73a233397354')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'10', N'8000', N'80000', N'59e43ffe-f73f-4c62-a00e-74f08522ef80')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'7', N'21500', N'150500', N'ba6f9a7c-a56d-4347-9029-75feb7b05dd9')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'6', N'12000', N'72000', N'abaad573-e2ff-4d34-b70e-76252fd8d98b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'15', N'15600', N'234000', N'1d4f1f1b-c997-4415-affa-7b451b676712')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'7', N'25000', N'175000', N'1724fe7c-3271-4ff8-aeae-7ceb6ab135d5')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'12', N'8500', N'102000', N'ef98eb01-c223-4459-a790-8162311e3876')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'5', N'23000', N'115000', N'fb17a448-22f5-4517-a182-87e7f88011ef')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'10', N'7500', N'75000', N'0129bbb2-f6b3-481a-b066-89bb57f8c784')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'14', N'12500', N'175000', N'ec7d5913-b4f7-4a46-ada5-8b9653e815fc')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'8', N'10000', N'80000', N'024dda71-62c6-4514-9152-8f9acc0a9aaa')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'1', N'34500', N'34500', N'135f2de6-b084-4cd8-9c55-93d84e003c4f')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'3', N'32000', N'96000', N'363daef8-76c6-44ea-8720-98b6cb67ade0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'15', N'16800', N'252000', N'b87880ec-9150-4a89-9db7-98d1fbabfb96')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'5', N'15600', N'78000', N'7bc637fd-1621-4785-9822-9b7009121ab6')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'3', N'17000', N'51000', N'98da08f3-5b55-49e9-8fcf-a2063d38b416')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'4', N'15600', N'62400', N'acee4ba9-0712-4c4b-90a4-a42e3b5bee79')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'4', N'38500', N'154000', N'82abb264-bd8d-45d0-91ff-a477713e4116')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da0ca760-2158-43f6-84cb-bc7290172722', N'5', N'21000', N'105000', N'c29d6ff4-c983-4bc9-a61a-a61511fd5211')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'2', N'23000', N'46000', N'91dcc32d-ef82-4557-b790-a82ba8b5319c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'18', N'9000', N'162000', N'3c552257-ee52-46d3-aec4-a917713b03ec')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'6', N'21500', N'129000', N'1acb0cb0-bb51-4c8a-b6d1-aa1b82ba1829')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'3', N'12500', N'37500', N'f3e05205-b778-41ca-926f-ac798cbb248a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'5', N'14500', N'72500', N'71f1f2e3-21af-4865-877e-ae449860b323')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'3', N'16700', N'50100', N'96bdafe0-dc6c-4a93-abff-affdbd74bbfa')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'12', N'9000', N'108000', N'57b251ae-1f09-4511-868f-b19e4b46fafb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'30', N'10500', N'315000', N'23441f74-77e2-44bb-a3a9-b3e16cf9e95a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'2', N'38500', N'77000', N'ea308ca6-9b36-456d-873e-b6c2233fe692')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'3', N'7500', N'22500', N'360c52a3-c025-4948-8438-be0d5e2b15cd')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'12', N'8500', N'102000', N'0a8ce97a-8294-4370-9b5b-be1a4568653d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'5', N'25000', N'125000', N'd5cf6175-cc79-4c8a-96b4-bed95e407021')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'8', N'14700', N'117600', N'a41f455b-cb50-47ce-962f-bf3770706738')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'5', N'8500', N'42500', N'6d960b63-79bf-4606-bcb7-bfc2d3fe8779')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'12', N'15600', N'187200', N'd59af638-85ef-439b-8004-c0f7c3c5a3bb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'415b713a-5445-4ef4-a8db-2c1b9387e207', N'3', N'14500', N'43500', N'cc946330-a22a-40aa-af6a-c32252af2eff')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'10', N'9000', N'90000', N'cf0b6a35-4d15-4ff9-901a-c4962d0af920')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'15', N'17000', N'255000', N'd862ad29-d724-4dd2-91b6-c73b6c4ef588')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'11', N'9000', N'99000', N'427ba7ea-28ad-46b0-82a4-cdeebd6d46db')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da0ca760-2158-43f6-84cb-bc7290172722', N'5', N'21000', N'105000', N'05eafc1b-1b5d-4315-ad68-d746f4c278c0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'7', N'19700', N'137900', N'ac230b60-0331-4f58-9748-d762d2ed61ae')
GO
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'5', N'17000', N'85000', N'ce1144e5-72bf-4e13-b70e-da250857c294')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'13', N'5800', N'75400', N'a174d3a8-b8e0-4c37-9007-daea85f11a8a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'2', N'23000', N'46000', N'0b3672dd-ce68-4a1e-be0f-ddf751c36589')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'5', N'14500', N'72500', N'826947de-7175-4e75-8c31-de054e960f33')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'3', N'17000', N'51000', N'e6c0764a-0c20-4db0-aa5b-de68c092085c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'2', N'25000', N'50000', N'5a2a598c-f777-4ee8-a1a7-def2abb6aff0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'2', N'19700', N'39400', N'c2d0bcb2-a7e8-4b67-85e4-e4e03d432f2b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'8', N'5800', N'46400', N'ef01a86f-92d9-4d69-8f83-e759610e2496')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'8', N'14700', N'117600', N'0707c497-5df9-43ba-a942-eafd22c19681')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'12', N'12500', N'150000', N'8d6bf2ca-14ac-4b1e-9871-ec25d267f8cd')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'7', N'16800', N'117600', N'5d70b754-b477-4a44-b18e-efc4a53b8c35')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'5', N'25000', N'125000', N'e86f5e5c-0d96-4366-9e66-f00ca8385e89')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'7', N'38500', N'269500', N'109c9a56-b2f4-4dc7-9376-f01eff92aa7c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'11', N'32000', N'352000', N'4a75a539-8a0b-410d-8ec3-f37213a17bb4')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'5', N'7500', N'37500', N'd7691a9e-18a8-4577-a76a-f3f4e1f3e793')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'5', N'8500', N'42500', N'abc3b37e-590e-4f2f-bf7f-f647ecaa6d49')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'15', N'12000', N'180000', N'30662991-7bd2-4d9e-9acf-fa31561ac0c5')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'7', N'12500', N'87500', N'13b40f1b-cce8-4ff8-9aa5-fba71e0af3a1')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'50', N'34500', N'1725000', N'990838db-3682-4e5b-9506-fd012578d3f7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'2', N'25000', N'50000', N'ca00853f-1d72-4f74-8169-fecc41a738fc')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'4', N'21500', N'86000', N'2582746d-4abf-4565-ae68-ffba2ba1db25')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'95b7a8d7-febe-44c4-a4f8-0e418e970a94', N'Bánh Cosy', N'0_Bánh kẹo', N'Bánh Cosy khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'00fc5cf6-d0d1-4fc9-9416-1147951dd8c2', N'Bánh AFC', N'0_Bánh kẹo', N'Bánh AFC khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'425c690f-7eb2-496b-8a11-18ae6bb32ef0', N'Bánh Custa', N'0_Bánh kẹo', N'Bánh Custa khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'f928fc78-91a7-4850-b7f6-1e37f93061a8', N'Pepsi', N'0_Nước ngọt', N'Pepsi khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'fe5d2686-436f-4556-9e4d-1f2804d91206', N'Bánh Oreo', N'0_Bánh kẹo', N'Bánh Oreo khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'c2f8b1e5-fcd0-483a-8ff4-2687d671d3ce', N'Dầu ăn Tường An', N'0_Dầu ăn', N'Dầu ăn Tường An khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'415b713a-5445-4ef4-a8db-2c1b9387e207', N'Snack khoai tây Slide', N'0_Bánh kẹo', N'Snack khoai tây Slidekhông tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'0cb36e30-95d7-43e8-a6c1-2d090e3836c6', N'Cam ép Twister', N'0_Nước ngọt', N'Cam ép Twister khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'cf20b98b-99cf-4eda-9674-2e7242db0bc1', N'Trà xanh O2', N'0_Nước ngọt', N'Trà xanh O2 khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'c9f15173-9327-44d5-87e0-3490bec59275', N'Bánh Hura', N'0_Bánh kẹo', N'Bánh Hura khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'a6127a7b-e761-4658-afcb-42e0c52ed586', N'Bánh Solo', N'0_Bánh kẹo', N'Bánh Solo khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'30c21b07-9acf-4d3f-b74f-4e6e2ebd5478', N'Kẹo Alpenliebe', N'0_Nước ngọt', N'Kẹo Alpenliebe khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'5128ad56-e25a-4546-9f4f-565e3f99d757', N'Bánh ChocoPie', N'0_Bánh kẹo', N'Bánh ChocoPie khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'323bef47-2082-4b0e-8e30-bab06ef02ee0', N'Kẹo Golia', N'0_Nước ngọt', N'Kẹo Golia khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'da0ca760-2158-43f6-84cb-bc7290172722', N'Sữa đậu nành Soya', N'Nước giải khát', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'1c90481f-7a5e-4625-9678-c40030298c7a', N'Bia Heineken', N'0_Nước ngọt', N'Bia Heineken khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'11c4ea82-6f03-4e67-93a3-ce96b0c590e1', N'Bánh Goute', N'0_Bánh kẹo', N'Bánh Goute khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'c4f9bf97-f0b9-4f27-a8e9-d149def351e2', N'Snack khoai tây O''star', N'0_Bánh kẹo', N'Snack khoai tây O''starkhông tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'ffbd765a-4933-43db-9727-e9c425a69e61', N'Dầu ăn Neptune', N'Dầu ăn', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [tenhh], [chungloai], [ghichu]) VALUES (N'2a4c8efc-2f23-4247-bced-f3c8e1956e05', N'Coca cola', N'0_Nước ngọt', N'Coca cola khong co trong danh muc')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'a17ffef4-fa29-49d5-9729-070c5dfa1bae', N'Phạm Ngọc Huy', N'Nam', N'2831e641-122d-43c1-a6f0-0d52f30915ab')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'77083872-4ff7-44e1-a36d-28c9ce50d792', N'Nguyễn Thanh Hằng', N'Nữ', N'0215e1c3-0a71-443d-9968-e3856919a4e3')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'148e2e9a-5b8a-4af1-a9c0-394cb01bae73', N'Nguyễn Ngọc Quỳnh', N'Nữ', N'4a0e0e82-82f7-4390-82bb-3680621d55d0')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'e77966bc-9d7b-4090-9da1-3c69ad37cf7c', N'Huỳnh Hà Thanh', N'Nữ', N'56109e78-09cc-405b-92f8-792893dddd66')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'0659bc6b-fb6e-4c0a-b3e9-408f51876a87', N'Christain D.', N'Nam', N'619ee51d-ccbc-4c54-8090-32de0058febe')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'798bf331-281b-4a18-af93-47d3c7c73996', N'Trần Phương Dung', N'Nữ', N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'2bfea7a7-0c5d-415c-86f4-52d15ecb1444', N'Phạm Thanh Sơn', N'Nam', N'aa315538-9776-4d7b-ba34-546f134267cd')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'0cb90f4b-e45f-4278-860f-5be7fe7d9c7c', N'Lê Thành Tài', N'Nam', N'746eec20-6ce4-487e-95ef-16b32ef7fb7b')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'17ffdd3c-46f5-4f58-9832-5f5b3e679083', N'Trần Thanh Tâm', N'Nữ', N'9c9e8a7c-6743-4c32-8aa9-8b0e4e81261a')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'd19a7dd9-cc3c-4ce1-9f2c-724f235b41e0', N'Michael N.', N'Nam', N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'6f8a79b2-6635-4c3b-bfd7-75ed381727be', N'Justin S.', N'Nam', N'85947907-2819-4811-82fa-e733d5051da8')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'9b34950d-b3d1-4f54-9a3c-84e98b72554d', N'Nguyễn Thanh Phương', N'Nữ', N'9023676d-d2e6-4a43-95e4-90247b4f96f3')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'097cbefb-9b6a-4df0-a467-8c6930a3d359', N'Phan Thanh Tú', N'Nam', N'77be66c7-ce26-4451-a2a4-f948c841de7d')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'aaf46991-3fc0-415a-93d6-8fbc87ccfa92', N'Nguyễn Cẩm Tú', N'Nữ', N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'592f9bc9-756c-4bd1-b7d8-90fb59909920', N'Nguyễn Cao Cường', N'Nam', N'd811e7f0-d8e1-42d4-ab1a-634877c748e9')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'91901ca2-f0b4-4898-b76a-967545e8a103', N'Lê Mỹ Dung', N'Nữ', N'5cbdf8d0-a23a-41df-8c50-5868d536302d')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'9a1cfb9e-daca-45d2-880b-97d21f9de67b', N'Trương Tấn Khoa', N'Nam', N'dddb68e1-387f-4173-8223-d0d25c54a1cf')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'5e12d1f5-14ff-4de9-bbaa-9f45cc2daa5e', N'Lê Anh Minh', N'Nam', N'686576b5-18d1-4057-a21d-7384e61c9101')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'549d189d-f616-42ec-b92a-a4bcafeaa246', N'Lê Trọng Tín', N'Nam', N'd0136e76-6551-4418-ab1b-a2a473f39a14')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'663750c3-515b-4c0b-8ab3-b569a2a492ab', N'Lê Thu Hương', N'Nữ', N'e94688cf-d636-43ab-a946-12674ff053a7')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'4edb7574-a2e6-433c-aeac-b9adbf8fffe2', N'Lê Thanh Bình', N'Nam', N'0215e1c3-0a71-443d-9968-e3856919a4e3')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'9eeb9786-9410-466e-ad2a-d334a31bb855', N'Jane.L', N'Nữ', N'a5bddd27-4585-4355-8911-4cdaafc0839b')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'06ccdda5-33a5-473e-ae81-d7828cca1767', N'Roger L.', N'Nam', N'c3319e1b-8d50-4ece-a122-30516dc874d9')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'7820b262-b107-47df-8b45-e243b6caf4fd', N'Trịnh Thanh Sang', N'Nam', N'e94688cf-d636-43ab-a946-12674ff053a7')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'059887cc-059f-483a-a4d3-e34a0d605aca', N'Phan Ngọc Đức', N'Nam', N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'0ec69ded-9ef6-4981-936e-ea4f168ebe8c', N'Katerine.M', N'Nữ', N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'6dc8ceae-23a6-47e6-826d-eedd23ac3e54', N'Richard S.', N'Nam', N'069d1e69-e44c-4c8d-95fc-f436444d9778')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'8b76d5d2-91ea-4d54-9bd2-f2a641499904', N'Selena K.', N'Nữ', N'f9baca32-adde-4f79-b58e-845dae309b03')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'e69f4363-556a-4734-af67-f7ddae254c91', N'Mick D.', N'Nam', N'5e0f3e3f-00b5-49bc-a8e2-96899a6c27e9')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'397cf326-8a40-478c-806f-f7f678a2818a', N'Trần Bình Minh', N'Nam', N'232ae13d-0cbe-4840-a592-95110cd64772')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'7a54a96c-9ac9-4068-b5b5-f92239afde96', N'John F.', N'Nam', N'a5bddd27-4585-4355-8911-4cdaafc0839b')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'1bb12005-ab44-49f8-b77c-f9dda57866db', N'Lê Như Quỳnh', N'Nữ', N'447833db-13fd-4145-b661-4a5e5cc0977e')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'a5bddd27-4585-4355-8911-4cdaafc0839b', N'Austin', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'746eec20-6ce4-487e-95ef-16b32ef7fb7b', N'Bình Dương', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'069d1e69-e44c-4c8d-95fc-f436444d9778', N'Boston', N'Hoa Kỳ', N'New Jersey')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'd811e7f0-d8e1-42d4-ab1a-634877c748e9', N'Cần Thơ', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'232ae13d-0cbe-4840-a592-95110cd64772', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'aa315538-9776-4d7b-ba34-546f134267cd', N'Đồng Nai', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'5cbdf8d0-a23a-41df-8c50-5868d536302d', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'9c9e8a7c-6743-4c32-8aa9-8b0e4e81261a', N'Hải Phòng', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'0215e1c3-0a71-443d-9968-e3856919a4e3', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'1c67bf53-5f89-41b2-90cd-ecfe91c4067e', N'Huế', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'e94688cf-d636-43ab-a946-12674ff053a7', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'686576b5-18d1-4057-a21d-7384e61c9101', N'Bến Tre', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'77be66c7-ce26-4451-a2a4-f948c841de7d', N'Kiên Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'dddb68e1-387f-4173-8223-d0d25c54a1cf', N'Tiền Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'556cdd79-1c51-46ea-95d6-e9fa9a9a9f5a', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'4a0e0e82-82f7-4390-82bb-3680621d55d0', N'Ninh Bình', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'56109e78-09cc-405b-92f8-792893dddd66', N'Hải Dương', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'd0136e76-6551-4418-ab1b-a2a473f39a14', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'9023676d-d2e6-4a43-95e4-90247b4f96f3', N'Quảng Trị', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'2831e641-122d-43c1-a6f0-0d52f30915ab', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'f9baca32-adde-4f79-b58e-845dae309b03', N'Chicago', N'Hoa Kỳ', N'Illinois')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'c3319e1b-8d50-4ece-a122-30516dc874d9', N'San Antonio', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'85947907-2819-4811-82fa-e733d5051da8', N'Columbus', N'Hoa Kỳ', N'Ohio')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'619ee51d-ccbc-4c54-8090-32de0058febe', N'Atlanta', N'Hoa Kỳ', N'Georgia')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'447833db-13fd-4145-b661-4a5e5cc0977e', N'Nam Định', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'9fcc1d9e-6080-46dd-a3da-b408cd415a5c', N'Orlando', N'Hoa Kỳ', N'Florida')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'0afc1ebb-8c0b-4d29-92c2-8002e8bb12db', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'5e0f3e3f-00b5-49bc-a8e2-96899a6c27e9', N'San Francisco', N'Hoa Kỳ', N'California')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'8d3a1e2a-eac3-4a36-8912-016532c406dc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'038bb1cf-5098-4daa-99cf-016ef34eba70')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'07fc968e-e2e7-4c69-b0f2-01e009524419')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'a41effd0-147b-449f-b55d-04665844b87e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'58747156-bbc8-4105-9a1a-04d72cadc3f2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'0ef3b442-738e-4e9d-9810-04da458f757f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e7e37ddf-2971-4fcc-8377-051ad2725554')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'caa4c220-d645-42cf-98a3-052489dc5da4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'ef059dfc-7215-492f-a235-063a1017b872')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'4a7efe8c-34a7-4054-8d07-065d073bca12')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0c8b611c-99b1-4afb-b337-0753063512e8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'72d957e4-a67a-4fec-9e16-093c84475ec3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'95be05c6-8936-42da-ba38-0a0a1bd23d92')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'4cf9ccd5-11ac-4f14-b630-0ac9dc08c9be')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'82cbdae0-a0c6-48f5-bab0-0ae9e41da885')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'c73cdc2b-b43c-4d9e-9162-0c7aee2d4a7d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'4a6baa7d-1c49-40da-9667-0d0222121068')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'86b39573-a8a9-4ebf-92e8-0df7693ef00a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'c09a6de3-80a6-48a7-b6cc-0f42c4d16048')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'9dee53cb-e6bf-421c-aee9-10bcd2a93922')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'ed750054-9929-49db-84b7-14a43d73509e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'593703f2-72e0-48ca-8b92-15366fa2f28c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'aef781e4-7631-4d7a-bcda-156857dabced')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'124d6f1d-b71f-4736-8736-16bca91517ce')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'de70e0df-59a1-4f67-9901-17641cafc1d1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'cfc900b1-f2af-4999-b658-17f6a90c77da')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'82aaf99a-5eb1-448a-ba2b-18245e3d006f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'58c6303b-911f-445a-a709-1a5f7dca7184')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'992a8851-58f4-4871-8453-1a6c4f91cb37')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'815f9a36-eb9a-4fad-9251-1b7c517f0328')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'9292e952-84c4-4ea4-8fd7-1d1bf059317c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'37796d93-4c4d-41e1-846e-1dad6ccd187b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'4f195f4e-0727-490e-92c7-1df871f35d3d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'5ba7621b-f18c-4f49-a71b-1e9e65c2e04c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'0f2674bc-7de4-40be-878e-1f157e453b8d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'ce46750c-41f5-4ea7-984b-1f3a76c0d4d7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'7a96dfd3-14fc-44fc-8eb8-1f57cbca11b9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'a987bdfe-1f29-4cb1-8118-2132b72bb353')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e41732b6-cc9e-4b34-a7d8-23efdcb1274d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e4837ce2-0d1a-4252-b25c-243823900745')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'fd3bd28f-ffbe-4ed5-b2ec-246a996d1c5f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'dfeea4b0-de28-4740-b8e0-24d860fb4f18')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'066bcfdd-78fa-41c8-8993-2500b04ef404')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'e45a99e1-48ae-4cea-abb6-2514f42a0d67')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'20758f94-9980-4c33-a03a-25530017454d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'd7fc8974-1cf4-474b-92ea-25daf074b4a6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'98e5c2bd-b206-494b-9fac-266d2e3a667e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'98841508-78ef-4493-a772-28cf92b743d0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'c88763a9-61a8-476f-9113-29655c0f3abc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'858995d8-8352-4850-b504-297934407021')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'64fee44e-e233-4357-8e3c-299ff8192f08')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1573d13e-26e7-4e44-9e71-2a12e1fc5336')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'73ed2a3e-4be2-4ebf-8434-2a7532fc3774')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'3912f92d-a97c-446e-9bb3-2b022d0a8ed6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'e6fe29f8-dafb-47a7-99aa-2b31d52bf897')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'28706f24-419c-4676-a3f5-2b64af156e4f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'a280cecd-a891-49f6-ba48-2c7a29dd9597')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'7abd75a5-82a5-49dc-b469-2d2aa3150fbf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'01a7b00a-f6cf-42c3-84a3-2ee24980c9df')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'c6bc1167-7bb4-49ad-a54a-30705b67138b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'dc4ca625-b5da-4105-91e9-31797ce98a24')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'c6fb4e14-56ec-4685-b7a4-3202a0db1757')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'20c323ca-2d39-454e-83ff-33184a4d96f9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd9d1efe5-5b27-4437-ae8b-334d14b6c7d8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd8b1033d-a136-471e-b832-3403be6cbede')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'23cb88bc-37e5-423c-b39b-34d101e5a618')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e8dfd0c1-cd27-4853-8c92-34d1568a652f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'98953b8a-b39f-42d4-b292-350e4037f2d7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'88d772ae-3898-4f17-9b24-363581aab9ae')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2c3257e1-2e92-4ad7-8f57-38848a16b7b5')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'eeac4038-ceac-465e-ba1e-38da79129d8c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b65a553-f08e-450f-92c1-38e6b68015bb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'2a9d7442-a18c-4e7d-8499-390d0ec6a7b7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'd660f922-dc5f-4fcc-bc0a-3950d35a2cbc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'f89db42c-2392-46bd-b337-3a2a133d48e7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'8276208a-1acd-4307-9212-3ada006d92a9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'83c71286-5e0a-4ba7-8ffb-3c0fe634aef7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'54dfd49c-8f1b-4ca6-8af9-3c13e9ce9fd0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'c82eca76-6789-411c-82c7-3ddb59810a99')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'5ae1f92d-fb28-4817-b607-3f4b523f6127')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fb0f25ef-eaf5-4250-aca5-3f5efca06402')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'bb043825-4f77-403e-8687-3f609fbc6cf1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'af44fd4d-942a-4a73-ae0e-406a67e79b86')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'4ad137d0-8662-4143-98fb-420f816bd111')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'8c1071ab-659e-44df-89c2-4332afad58c8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'6242709c-5f1e-4900-b2c9-44922e86cb5b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'eecc4cd5-6c7a-487b-bb19-45b1aa53ba12')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'2c47f744-572e-48f6-93d6-46437aaa9b37')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'0d60300d-a5d6-449a-9ee3-47066ce69c89')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'84c6c176-7996-401b-bfd9-478772f4eb5b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fbec1ec7-a677-4cf8-badf-478fadfbcd96')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'48c5873f-93b6-4019-96cd-47abfae73de3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'e06adeff-85b5-4d8d-915c-47f9cf46a8ad')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'9f5a59d5-91e9-4db4-b9c2-498a48765c41')
GO
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'7dbc36bf-f175-49e5-b23f-4b3a8065a426')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'08c56f3e-256a-4db2-8600-4bea73fa98f6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'f320c73a-cb99-463d-b926-4d9613c9d0d7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'e31263ec-4fc3-44e2-95b5-4eb7547c1db3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'cee04111-4015-433a-8947-4f2f1a0e773d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'b283ce60-f7a8-4bbb-8047-4fb895bd5f93')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'4c77ff5e-ff76-42e4-ab01-526dc8848d87')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'8b66dff1-ecf4-4e28-8546-53bde63c4d80')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'a6439344-c1ca-463a-8989-552b42e3fc1f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'35dc9d94-917e-46dc-9757-5883c85af498')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd7e735fe-3621-4ec2-9276-58de05708119')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'140acb6b-75fb-4f2a-9519-5a8d88bd9ad2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'91a02057-6172-4ddc-b3e0-5ca93af2d2cc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'48f76be5-ae61-4d7b-929b-5d97d153309a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'71aaee71-17d4-4a83-a7ec-65028b3b3029')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'ba9cd1d0-f021-4ad9-a300-653a98b1582d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'8ad2af2f-c3d6-4eee-9666-67b595c3fc60')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'14ffc51b-218e-4ddd-982c-6843b1bf148a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'97c03748-1973-41d5-ac23-6854ebc1f553')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'2f58818d-0a2e-4197-b6e2-6948a7a0fd3c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'4d158814-04e3-42c3-88af-69955b9fc2ce')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b327939-6298-405f-8e3a-6a0ef8394db3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'8e220d4c-5ad7-408d-9142-6b70804cfbd4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'8d554208-5aa0-4d4b-bb8d-6d9666b6256a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'db838c05-1176-462e-9960-6ea0f36ee16c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'ac6ce44c-7b46-4f21-ad65-6f55cc98a5e9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'7f03393d-a2c0-4089-9b1c-709b4ea98c68')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'c8eef8b4-47d3-4a93-85f1-70ebe9c8197a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fb77d8cc-da7c-4b4f-800e-71077edb90f3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'bee10db2-a28a-4966-a860-710a6cd755c6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0d6d5aed-79b6-4887-b376-71ea0b1bd225')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'92777e41-6e9b-40e7-a37b-71f0cb1f4946')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0cf6a437-8c53-4920-a45a-71fd3f00f57a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'edefffef-3412-44ec-b8fc-72726f34bec9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1300ff2c-ca2f-4b6f-b065-72924d3318e4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'8297667e-8018-4afa-aaac-72bc011ff70a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'62c2fcae-c7ad-4081-ade2-72f96195b426')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'067c7f3d-ef84-47fc-8401-7454807a8bf1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'c43403e6-a074-4534-8f5e-746fbe8f7cf8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'fab0365c-517d-4f3b-9d51-74f28daa0c6d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'2b7c3b71-f013-4282-81ed-76ced7dce80f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'9dc2614d-f7e4-44b4-b574-77ec89fdab65')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd9d65462-4cfa-4ac0-8f2a-7807743e87ac')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'72281558-32d6-48d6-8989-7874809f326a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'fdb0bc8a-ed9c-4a72-a418-78c50f7bee2f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'418f723a-4e9c-42db-adfb-797b9fcbc013')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'9ccf1188-02e1-4f3d-9d82-7a5bcfdfe291')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'41c132b0-670d-4770-9768-7a81d39270cb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'99e2e249-f7a6-4816-a207-7ac0def4c10f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'7283bb6c-0da2-4a47-8ac3-7de9ede13ccf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'e12bafe4-9a85-4f30-a532-7ebc1c065490')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'2606bff3-4233-41c6-818b-7ef773f3106b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'f1306f0e-1e16-4435-b093-7f4b1d720739')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'63925863-5666-4cf7-9d83-7f6ad00ae4d2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'23144b12-3f7a-427d-982e-7f8cbce1ab27')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4d09333d-cd6a-4b3b-b2ef-80a853031f0e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd4df0201-cfef-4a82-87c9-810c5c414146')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'4da38791-a252-437c-b7ce-826043d93b20')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'd55ec4b2-9eef-4ce7-b870-837ec598e79c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'6ad0b067-91c6-46e4-908d-87bab721ef86')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'd7b73e3f-c4fd-4ccf-8376-89af310c48fb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'4a89abd6-0125-4f8d-a48d-8a0a695a8f3a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'22820aa3-4e03-4b11-8d0b-8a95f345dccd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'd7f7a66d-fb9f-4aed-9493-8b2f3d5b1dec')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'2b22a4f2-15a0-4f79-ad19-8b6dd8bca45e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'532aceec-ae4e-4f75-a194-8b7eb48e9c06')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'b7c7dd5f-20ce-4475-be0c-8c56da0aea9d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a4f18245-7b62-422a-a11f-8d9b893b5b5a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'da37ff22-c6d2-4842-8daf-8d9dfd396e70')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'745f1b99-07e3-42b2-bd92-8e4cbbf5c25a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'0ce9bc0f-07ee-47f1-8a53-8e8688f071d5')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b51c817-4400-4384-aff4-8ed19e54108c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'da2c024e-2738-4cec-8374-90221b7ae7de')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'6e71e277-6666-422c-8d2e-906750be8948')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'9a0b287e-8c84-4b77-bab0-906ca0428ef8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'2c3cb943-a8f4-425d-aef9-90fdfe79cacd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'b81b1831-d933-4d33-841c-92d6889405e9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'a09e8acd-5bbc-4316-b190-937e91a4a3ab')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'ca3c2520-ebb3-4937-8fe8-94e6aa4cddbd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'b0cf8a36-b106-4108-9df8-9593852d6f30')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'0338d84c-9cdf-49d2-932c-962dc6912ab1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'e597232b-6141-4aae-9002-977af580ff30')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'2fe1fe87-ede9-4446-beed-9786d4b953c1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'560dd071-3b0d-4ca4-aabf-9917717d858c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'6bee79f0-944d-468a-9757-99c07993d378')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'5be4ab8f-68d4-450e-983e-9afb75a0e6dc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'369d3e01-43a3-499e-bf1f-9c7441009723')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'1e2aafdb-458e-4cba-a884-9cadabe52f57')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'359272ae-3037-492d-9e9e-9d6a28105334')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'3562740d-0e1a-470c-9480-9de9b2d58340')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'dea2beec-767f-4d6e-93af-9efbe31a2c28')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'2fab63b8-c594-408e-b602-9f06bfe2c104')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'30f46cb7-4ed5-42a7-a685-9f1f03260d03')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'8a4c180b-270a-42a8-8265-a01bd0f91972')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a2b0bfeb-b8e3-43bc-82ad-a17e516ed8c2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5750fa80-4145-45ee-a53b-a1ddd8aeb92c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'5a91c08c-e32c-482a-b360-a1e4698ac5ab')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'15589419-ebe3-439f-9957-a4d2aaf52453')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0e8c3faf-837b-4877-8407-a56740b92bbc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'0e9a1fd3-f78c-4026-a867-a60707d766fb')
GO
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'a3b25f83-1565-47c2-964c-a6ff232387f8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'c689624f-863d-4449-b4fb-a8acb1d26f13')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'4a53da7a-2c4c-4d5f-abc0-a931f01c5cd8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'0bad97ce-79d6-4b44-b91a-a9485a2f01d9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'07f15c55-36a2-4a3f-a5e9-ad3c1dd5f9be')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'dfa4137e-4fa1-4cac-b1f9-ad681d3c010e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'5c60e174-e837-485d-9b49-aeb0a9281ff1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'c25a9927-4216-4b06-8ac3-afd3a56ae61a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'8474843b-89e0-4598-a282-b00bb24af0e0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'13b2a39e-02e6-44a5-8e1a-b00de063622a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'0543c44a-1bbf-46a9-8da3-b0a781b87b9d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'c9aaa55b-5c43-4da2-aa56-b2cac069b510')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'11e249aa-d6f9-45d7-b1c8-b37f2294e1ce')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'712df3c2-bee9-4bdf-9975-b3d2fa36269d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'8dcd7555-04a6-401d-82c3-b50d09177e56')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'a2f0553a-055b-4ffb-88ca-b59e93efe2ca')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'64278c8a-aede-4b6c-8918-b64623b47e78')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'5574e37c-9f93-430b-9db3-b66639b9239c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'3affbd5c-44ec-4274-a85f-b82a9978571d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'9dde8222-5606-4685-8385-b8c8038d120f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'ccc830ba-4e48-43db-9b53-b967b5c4cfcb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'5aa3000b-a5ee-43fb-8b17-ba9732aa7406')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'3aa1fa8c-c32e-4df4-a5a0-bb56fbaaf4b6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'4a357837-3331-45b6-af6d-bdd6edd3cf04')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'787bf088-7d6f-4dde-bd6d-be70be54308a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'092f57ef-f0da-4be6-a0ab-bf5765278263')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'b2c86410-4509-4edc-aa41-bf79f98806ca')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'07c68baa-84f9-486c-913d-bf81d813124b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dfe5fb52-2ade-4a1b-91b1-c06a078e2c37')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'2e34f39f-e3d0-46dd-ac64-c0f6af8c5d26')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'38933e94-400e-48de-9139-c109b57bbccf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'ef458381-9395-4ed2-901d-c118c2e33a49')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'779e0cd8-0fb1-4418-8538-c354c2a342cc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'4731adc7-45d9-4bdc-a42c-c48b2b5f8d5d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'bf80deb6-38c6-4062-a177-c4a97405b6d0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'a0e1a810-07de-4b06-b45d-c4cac942beb4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'bba4917d-6cdb-4b77-9f79-c4ee14e9b5b2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'96336475-14af-488b-9351-c75bc07c81dd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'b6047234-f6c2-4cca-956d-c83d19889df3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'515ddb9f-fa5e-4289-93e1-c9681e335727')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'98758005-240e-4494-99af-c9aa8cbb04ec')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'cf664e3d-0f25-4b86-83c5-cb2a3c84f24e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'c6e2a460-8f0c-4352-b344-cb6714c140c2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5db27fe9-15d4-4df0-bbd2-cc329ebd3ff7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'fe55aede-a8b8-43ac-ab31-ce2bfd433d2c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'e9eaa2e1-9134-4c2d-8611-cf3f2dfcac55')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'0a944719-ef9c-469c-beee-cf939e499bf1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'95be8573-0e1b-4cd5-9c0e-d0706094a68e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'3a9b61c0-5142-4306-aa27-d09b621edaea')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'32fb6f49-fc63-47d8-8b2e-d1b146692c75')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2ccc9a01-3fe4-4abe-b937-d25c439d39b6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'90cb2eff-5d85-4615-9c56-d389ef4cc97a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'c226e891-2110-4949-8afc-d3a74bf5263e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'8c6fa61f-c229-49ca-b332-d3d8167d426f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'b91af905-29a5-4cc9-9746-d409cac9d433')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'9a818c5e-17c7-4509-a675-d45cb27ad277')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'2dd6f174-e3ff-4be6-8265-d4c67adf63f5')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'67d4f2b2-431d-4c94-a77e-d504b5ed5545')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0754b310-28ac-456f-a95a-d5e890c3953b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'ec1ca113-a129-47e2-a974-d613fa127c45')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'f6972236-3a64-439a-a18a-d62dcae79116')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'4eda1b4f-17d6-4436-b22d-d69a074a49cd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'cbd38855-255f-4fab-95d8-d6afad2bbd85')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'7df66bfb-86f4-4e56-a3eb-d6c70f7650db')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'6b586ba6-35a2-4912-830d-d742fa065bce')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dee869d9-ec53-455b-bdca-d7e3fa599a78')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'13861144-8c09-43d5-8930-d861d2fd5041')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'59d087d2-5982-4d5a-ac4e-d918721fd18a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e2f36cfe-758a-4822-9784-dbf4c80aef79')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'662e3aad-9595-449a-b9e0-dcc96d60b29d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'12c8696e-27d7-4eee-8311-dcd056a33f36')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'a348ca6c-e4e9-4a00-80be-dde4078b7e7d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'eab2fa90-4b74-4dd8-ade2-e09a3abe18de')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'45949560-0258-417f-8364-e3e9942b262f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e5e1d9a3-2d56-4308-a259-e468fa291466')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'a36418c3-12b9-4256-a643-e49218038a53')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'e3bec632-fc30-446c-a021-e4cce4af8d9f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'6bb35f28-b951-4a3c-afb5-e62ed30f64be')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'c921a9a3-b0c2-4bb4-b955-e920aa36470c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4f5caa97-ae08-4512-aa7d-ea18bcc9589d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ccba9d68-ed0a-4b49-9a03-eabe30f162b6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'dc451215-fb52-41e2-9ddb-eb2bd0087eb9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'806274e3-0633-45b0-aa5b-eb35006d5a9b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'99dd11fd-64f5-4a28-bd02-edf47b59dbe5')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e93851ff-7b86-4665-bb6d-ee844f8108cd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'423545aa-82d0-4bd0-af0d-f0e1318c86c2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'c3fd87bd-c788-42e6-b01f-f19d93c26ad4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'1fe056ed-3067-4f4c-a6ad-f1f828fa5308')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'87b25935-fe46-47ca-9de3-f32ba785ad95')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'3291c3d4-ecfa-4080-9cb4-f4a5074bae72')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'1fba1de7-2bcd-4a9e-b9cb-f4d24cd6a77e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'cf7e3165-bd03-4ff6-a856-f5225220a915')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'052860b3-e9ec-49ec-8495-f5a3c1245ce3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ea03156b-ca2d-4301-ae84-f645373fdfab')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'113b658a-5f66-45d0-a364-f646b3444d25')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'dfe05c5b-7f2c-4ceb-a267-f6aeda05732e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'bced81d8-1842-4367-ba80-f6b8eeb84b8c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'88359991-5f59-411c-8cbd-f7a3a4ced8cf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'2f1c409a-2f60-4b51-be90-f7b229798e43')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'5da31754-6c87-4745-aa73-f891648d0126')
GO
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'87d972d4-b85e-4570-8bcf-f8d412c84623')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'f69268c1-f45f-4a38-abd3-f96d62b840ad')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'16c581d0-797a-447f-b5d0-fa3dcb52dcc4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'1d8b0bda-22b2-44be-abce-faca6ebbc690')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'f5fb14b1-4ccd-4ebd-b0ae-fae1ed14399c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'259f1847-a960-4ebf-968e-fc11a2985ba7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'72388e63-eb27-4776-9feb-fc582e2ba99b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'7aee0692-3d0f-4db3-ba1b-fc8841eaaa16')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'ff7f1795-3f48-4657-9d00-fd2ec5d8fd80')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'd90511ad-21bf-43e8-be40-ff1727d93470')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'2f789452-f6e9-46d3-851d-ff44c8ab35d4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd4991fcc-9ac6-44e5-a7b0-ffcbcc1f650b')
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimCuahang] FOREIGN KEY([mach])
REFERENCES [dbo].[DimCuahang] ([id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCuahang]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimHanghoa] FOREIGN KEY([mahh])
REFERENCES [dbo].[DimHanghoa] ([id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimHanghoa]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimKhachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[DimKhachhang] ([id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimKhachhang]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimKhuvuc] FOREIGN KEY([makv])
REFERENCES [dbo].[DimKhuvuc] ([id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimKhuvuc]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimThoigian] FOREIGN KEY([thoigianid])
REFERENCES [dbo].[DimThoigian] ([id])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimThoigian]
GO
USE [master]
GO
ALTER DATABASE [ERP_BH] SET  READ_WRITE 
GO
