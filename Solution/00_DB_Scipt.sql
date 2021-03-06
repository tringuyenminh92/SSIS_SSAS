USE [master]
GO
/****** Object:  Database [ERP_BH]    Script Date: 11/12/2014 10:01:50 PM ******/
CREATE DATABASE [ERP_BH] ON  PRIMARY 
( NAME = N'ERP_BH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ERP_BH.mdf' , SIZE = 15616KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[BanhangTmp]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[Cuahang]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[DanhsanhHanghoaGoc]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[DimCuahang]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[DimHanghoa]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[DimKhachhang]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[DimKhuvuc]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[DimThoigian]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[FactSales]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[HanghoaTmp]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[KhachhangTmp]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[KhuvucTmp]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[SaleDetailTmp]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[tbBanhang]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[tbChitietBanhang]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[tbHanghoa]    Script Date: 11/12/2014 10:01:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHanghoa](
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
/****** Object:  Table [dbo].[tbKhachhang]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[tbKhuvuc]    Script Date: 11/12/2014 10:01:50 PM ******/
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
/****** Object:  Table [dbo].[Thoigian]    Script Date: 11/12/2014 10:01:50 PM ******/
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
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0011', N'Cửa hàng thực phẩm số 1', N'Cus0131', N'Lê Thanh Bình', N'1', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0016', N'Cửa hàng thực phẩm số 2', N'Cus0131', N'Lê Thanh Bình', N'7', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0012', N'Cửa hàng thực phẩm số 3', N'Cus0132', N'Nguyễn Cao Cường', N'1', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0015', N'Cửa hàng thực phẩm số 3', N'Cus0132', N'Nguyễn Cao Cường', N'5', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0017', N'Cửa hàng thực phẩm số 1', N'Cus0141', N'Phạm Thanh Sơn', N'9', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0013', N'Cửa hàng thực phẩm số 2', N'Cus0141', N'Phạm Thanh Sơn', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0019', N'Cửa hàng thực phẩm số 2', N'Cus0142', N'Lê Mỹ Dung', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0014', N'Cửa hàng thực phẩm số 3', N'Cus0142', N'Lê Mỹ Dung', N'4', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0025', N'Cửa hàng thực phẩm số 1', N'Cus0151', N'Lê Thành Tài', N'7', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0024', N'Cửa hàng thực phẩm số 1', N'Cus0151', N'Lê Thành Tài', N'6', N'2', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0023', N'Cửa hàng thực phẩm số 2', N'Cus0152', N'Trần Thanh Tâm', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0027', N'Cửa hàng thực phẩm số 2', N'Cus0152', N'Trần Thanh Tâm', N'9', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0028', N'Cửa hàng thực phẩm số 2', N'Cus0153', N'Trần Bình Minh', N'10', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0026', N'Cửa hàng thực phẩm số 1', N'Cus0153', N'Trần Bình Minh', N'8', N'3', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0030', N'Cửa hàng thực phẩm số 2', N'Cus0153', N'Trần Bình Minh', N'12', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0022', N'Cửa hàng thực phẩm số 3', N'Cus0153', N'Trần Bình Minh', N'3', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0021', N'Cửa hàng thực phẩm số 1', N'Cus0154', N'Phan Ngọc Đức', N'2', N'1', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0029', N'Cửa hàng thực phẩm số 1', N'Cus0154', N'Phan Ngọc Đức', N'11', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0018', N'Cửa hàng thực phẩm số 1', N'Cus0161', N'Nguyễn Cẩm Tú', N'10', N'4', N'2014')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0020', N'Cửa hàng thực phẩm số 3', N'Cus0161', N'Nguyễn Cẩm Tú', N'12', N'4', N'2014')
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
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0002', N'Orlando Grocery', N'Cus0111', N'Jane.L', N'1', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0001', N'Royal Blue Grocery', N'Cus0112', N'Katerine.M', N'8', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0006', N'Royal Blue Grocery', N'Cus0113', N'John F.', N'3', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0004', N'Rainbow Grocery Store', N'Cus0121', N'Richard S.', N'2', N'1', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0007', N'Rainbow Grocery Store', N'Cus0121', N'Richard S.', N'11', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0008', N'Rainbow Grocery Store', N'Cus0121', N'Richard S.', N'11', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0003', N'Foodie Store', N'Cus0122', N'Michael N.', N'8', N'3', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0005', N'Foodie Store', N'Cus0123', N'Mick D.', N'10', N'4', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0009', N'Cửa hàng thực phẩm số 2', N'Cus0124', N'Nguyễn Thanh Hằng', N'5', N'2', N'2013')
INSERT [dbo].[BanhangTmp] ([maqd], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'S0010', N'Cửa hàng thực phẩm số 2', N'Cus0125', N'Lê Như Quỳnh', N'6', N'2', N'2013')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 2', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 4', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 1', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Royal Blue Grocery', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Foodie Store', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Rainbow Grocery Store', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 3', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.10', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.5', N'1b19f0a0-0270-4fb8-b16e-f13f1e5563f4')
INSERT [dbo].[Cuahang] ([tench], [id]) VALUES (N'Orlando Grocery', N'e557c8e6-53d9-4360-8010-f17ca5d22cc4')
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
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 2', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 4', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 1', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Royal Blue Grocery', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Foodie Store', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Rainbow Grocery Store', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng thực phẩm số 3', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.10', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Cửa hàng Q.5', N'1b19f0a0-0270-4fb8-b16e-f13f1e5563f4')
INSERT [dbo].[DimCuahang] ([tench], [id]) VALUES (N'Orlando Grocery', N'e557c8e6-53d9-4360-8010-f17ca5d22cc4')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'296dec25-6419-4a5b-b9f9-0391743777ab', N'0_Bánh Solo', N'Bánh Solo', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'HH008', N'Pepsi', N'Nước giải khát')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'HH004', N'Dầu ăn Tường An', N'Dầu ăn')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'HH009', N'Cam ép Twister', N'Nước giải khát')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'05ce8659-369b-45ac-ac71-3ffe3abc68bc', N'0_Snack khoai tây Slide', N'Snack khoai tây Slide', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'HH006', N'Dầu ăn Neptune', N'Dầu ăn')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'HH002', N'Coca cola', N'Nước giải khát')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'0_Bia Heineken', N'Bia Heineken', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'HH003', N'Bánh ChocoPie', N'Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'0_Bánh Oreo', N'Bánh Oreo', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'103ee851-a6ae-4805-bed3-8be1b8d7c776', N'0_Snack khoai tây O''star', N'Snack khoai tây O''star', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'0_Bánh Hura', N'Bánh Hura', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'HH015', N'Kẹo Golia', N'Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'HH014', N'Kẹo Alpenliebe', N'Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'0_Bánh AFC', N'Bánh AFC', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'HH013', N'Bánh Goute', N'Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'788ecb59-49de-4e38-9c31-c2d1177ff438', N'0_Bánh Custa', N'Bánh Custa', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'0_Sữa đậu nành Soya', N'Sữa đậu nành Soya', N'0_Nước ngọt')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'0_Bánh Cosy', N'Bánh Cosy', N'0_Bánh kẹo')
INSERT [dbo].[DimHanghoa] ([id], [mahh], [tenhh], [chungloai]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'HH001', N'Trà xanh O2', N'Nước giải khát')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'a736fa9b-3f66-4d42-bf5d-048a840fc567', N'KH011', N'Lê Thu Hương', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'Cus0161', N'Nguyễn Cẩm Tú', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'9d348171-95d9-4863-9956-156dc096859f', N'Cus0142', N'Lê Mỹ Dung', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'ff72453d-bff2-4150-91d3-2123b14abeff', N'Cus0132', N'Nguyễn Cao Cường', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'0d0bc631-347d-4b1c-947e-2206a174152d', N'KH003', N'Phan Thanh Tú', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'0a8621e0-103e-437b-832b-26f3c54c5794', N'KH012', N'Selena K.', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'Cus0131', N'Lê Thanh Bình', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'088de54e-4163-4e84-8ebd-3d120ead38b0', N'Cus0151', N'Lê Thành Tài', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'2cd935fb-b467-4c62-ab55-3fb788e80a84', N'Cus0123', N'Mick D.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'KH015', N'Christain D.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'74b70690-197e-4e79-aa8e-48323c9234d3', N'KH007', N'Huỳnh Hà Thanh', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'98c66e0b-1f19-406f-9387-50341f027d5d', N'Cus0122', N'Michael N.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'KH013', N'Roger L.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'456516b7-9adb-4d06-8a09-5931efd3b566', N'KH002', N'Lê Anh Minh', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'4e4b8dbc-c20f-4e8f-8aee-65828a4c6219', N'Cus0124', N'Nguyễn Thanh Hằng', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'4bbe2a3c-951f-49c4-a3d3-6670d5cca6b1', N'Cus0125', N'Lê Như Quỳnh', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'ae39f8aa-a3a9-451f-a99b-7299f8f505e7', N'KH008', N'Lê Trọng Tín', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'809c097d-5c39-483a-af68-76aeb581d357', N'Cus0121', N'Richard S.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'Cus0152', N'Trần Thanh Tâm', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'47e83d58-2957-4efc-8b4a-81862c6d5284', N'Cus0111', N'Jane.L', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'Cus0141', N'Phạm Thanh Sơn', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'KH005', N'Trần Phương Dung', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'Cus0153', N'Trần Bình Minh', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'9db37eee-65c0-4559-9960-986bedfb878c', N'KH001', N'Trịnh Thanh Sang', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'78f68a5e-aaa9-4e1a-ba97-b0aa8b4201b1', N'KH010', N'Phạm Ngọc Huy', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'49acec59-5128-44e8-a98a-b482d92af9fe', N'KH014', N'Justin S.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'be801b26-011e-42c0-af3a-d15874c63151', N'Cus0113', N'John F.', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'ae273446-5649-4736-86f9-d33d2a68a2ab', N'KH009', N'Nguyễn Thanh Phương', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'Cus0154', N'Phan Ngọc Đức', N'Nam')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'ae9d7ab5-6ae7-4e53-a281-e410be0382a0', N'Cus0112', N'Katerine.M', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'KH006', N'Nguyễn Ngọc Quỳnh', N'Nữ')
INSERT [dbo].[DimKhachhang] ([id], [makh], [tenkh], [phai]) VALUES (N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'KH004', N'Trương Tấn Khoa', N'Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'02f8c709-97a8-49d2-b135-092bbad24b77', N'Nam ĐịnhNorthern VietnamVietnam', N'Nam Định', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'b5b3a14c-ffcd-4f91-8a52-15dd9656a35e', N'Hải PhòngNorthern VietnamVietnam', N'Hải Phòng', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e', N'Đồng NaiSouthern VietnamVietnam', N'Đồng Nai', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d', N'KV04', N'Tiền Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'9f37416b-9776-47d8-831b-2ff950b0e5ca', N'KV11', N'Chicago', N'Hoa Kỳ', N'Illinois')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'309ceae6-2fd3-4cdf-a908-32b9ea6eb0c2', N'Bình DươngSouthern VietnamVietnam', N'Bình Dương', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'9abb1193-8ff1-4282-b25b-3c56812ed1f0', N'San FranciscoCaliforniaUSA', N'San Francisco', N'Hoa Kỳ', N'California')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'8eef93dd-ba49-4e23-8887-3dc0afb2292b', N'KV12', N'San Antonio', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'32173f1a-dac5-4189-b863-49b6df6cbf16', N'Hà NộiNorthern VietnamVietnam', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f', N'Quảng NgãiMiddle VietnamVietnam', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'df2b289d-8088-4117-9f95-6d154241a511', N'KV01', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'6a7f496f-a6c3-4426-9be8-76078024e372', N'KV09', N'Quảng Trị', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'a5f5eb6c-36cf-464e-87b5-7cd0cffeb854', N'KV14', N'Atlanta', N'Hoa Kỳ', N'Georgia')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'Đà NẵngMiddle VietnamVietnam', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'257f585d-ea5d-4391-8e4b-890bbabec556', N'HuếMiddle VietnamVietnam', N'Huế', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'HCMSouthern VietnamVietnam', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a', N'KV06', N'Ninh Bình', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'498f39a6-9e54-461b-8026-9cc4018b0094', N'KV08', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'631f47b8-4ee4-4d05-a3e9-a28fd7e9a880', N'KV10', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'291d829c-a289-4c56-adce-a39258c3b32f', N'AustinTexasUSA', N'Austin', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'BostonNew JerseyUSA', N'Boston', N'Hoa Kỳ', N'New Jersey')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'a84cd236-e668-4e23-a72a-c006eb70e3dc', N'KV05', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'178bc0e5-2397-425c-b383-c2b36e447d02', N'KV13', N'Columbus', N'Hoa Kỳ', N'Ohio')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'29f1f733-19f6-4c8b-9601-d165e8347ec7', N'KV02', N'Bến Tre', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'419bec55-bb9d-4262-a607-d393ba3d4e1d', N'Cần ThơSouthern VietnamVietnam', N'Cần Thơ', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'OrlandoFloridaUSA', N'Orlando', N'Hoa Kỳ', N'Florida')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'acfd9937-2731-4939-8c3c-e89d117658ef', N'KV03', N'Kiên Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[DimKhuvuc] ([id], [makv], [thanhpho], [quocgia], [vungmien]) VALUES (N'c2ef1581-d062-4390-b6a8-e93d0ac397dd', N'KV07', N'Hải Dương', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'8d3a1e2a-eac3-4a36-8912-016532c406dc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'038bb1cf-5098-4daa-99cf-016ef34eba70')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'07fc968e-e2e7-4c69-b0f2-01e009524419')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'a41effd0-147b-449f-b55d-04665844b87e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e7e37ddf-2971-4fcc-8377-051ad2725554')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'ef059dfc-7215-492f-a235-063a1017b872')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0c8b611c-99b1-4afb-b337-0753063512e8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'95be05c6-8936-42da-ba38-0a0a1bd23d92')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'4cf9ccd5-11ac-4f14-b630-0ac9dc08c9be')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'c73cdc2b-b43c-4d9e-9162-0c7aee2d4a7d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'4a6baa7d-1c49-40da-9667-0d0222121068')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'86b39573-a8a9-4ebf-92e8-0df7693ef00a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'a9410e40-f21e-4fad-a37f-0f26c5fe03eb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'c09a6de3-80a6-48a7-b6cc-0f42c4d16048')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'aef781e4-7631-4d7a-bcda-156857dabced')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'124d6f1d-b71f-4736-8736-16bca91517ce')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'de70e0df-59a1-4f67-9901-17641cafc1d1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'cfc900b1-f2af-4999-b658-17f6a90c77da')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'ad026cb2-646e-4816-ac8e-18544aa86ae6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'9292e952-84c4-4ea4-8fd7-1d1bf059317c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'37796d93-4c4d-41e1-846e-1dad6ccd187b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'0f2674bc-7de4-40be-878e-1f157e453b8d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'ce46750c-41f5-4ea7-984b-1f3a76c0d4d7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'a987bdfe-1f29-4cb1-8118-2132b72bb353')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e41732b6-cc9e-4b34-a7d8-23efdcb1274d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'7f1efd3c-7f1f-4e89-a688-2400201e451f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e4837ce2-0d1a-4252-b25c-243823900745')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'fd3bd28f-ffbe-4ed5-b2ec-246a996d1c5f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'dfeea4b0-de28-4740-b8e0-24d860fb4f18')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'e45a99e1-48ae-4cea-abb6-2514f42a0d67')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'20758f94-9980-4c33-a03a-25530017454d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'd7fc8974-1cf4-474b-92ea-25daf074b4a6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'c88763a9-61a8-476f-9113-29655c0f3abc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'858995d8-8352-4850-b504-297934407021')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'26970732-51d7-445e-830e-29f7ce415630')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1573d13e-26e7-4e44-9e71-2a12e1fc5336')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'73ed2a3e-4be2-4ebf-8434-2a7532fc3774')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'e6fe29f8-dafb-47a7-99aa-2b31d52bf897')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'28706f24-419c-4676-a3f5-2b64af156e4f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'a280cecd-a891-49f6-ba48-2c7a29dd9597')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'7abd75a5-82a5-49dc-b469-2d2aa3150fbf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'40e19385-fae8-4e32-a451-2e24781b74ef')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'01a7b00a-f6cf-42c3-84a3-2ee24980c9df')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'4048d578-5d36-4bd9-8268-2ee82573b6d8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'dc4ca625-b5da-4105-91e9-31797ce98a24')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'c6fb4e14-56ec-4685-b7a4-3202a0db1757')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'20c323ca-2d39-454e-83ff-33184a4d96f9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd8b1033d-a136-471e-b832-3403be6cbede')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e8dfd0c1-cd27-4853-8c92-34d1568a652f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2c3257e1-2e92-4ad7-8f57-38848a16b7b5')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b65a553-f08e-450f-92c1-38e6b68015bb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'd660f922-dc5f-4fcc-bc0a-3950d35a2cbc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'83c71286-5e0a-4ba7-8ffb-3c0fe634aef7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'54dfd49c-8f1b-4ca6-8af9-3c13e9ce9fd0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'c82eca76-6789-411c-82c7-3ddb59810a99')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'5ae1f92d-fb28-4817-b607-3f4b523f6127')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'bb043825-4f77-403e-8687-3f609fbc6cf1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'af44fd4d-942a-4a73-ae0e-406a67e79b86')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'8c1071ab-659e-44df-89c2-4332afad58c8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'6242709c-5f1e-4900-b2c9-44922e86cb5b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'eecc4cd5-6c7a-487b-bb19-45b1aa53ba12')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'2c47f744-572e-48f6-93d6-46437aaa9b37')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'0d60300d-a5d6-449a-9ee3-47066ce69c89')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'84c6c176-7996-401b-bfd9-478772f4eb5b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fbec1ec7-a677-4cf8-badf-478fadfbcd96')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'48c5873f-93b6-4019-96cd-47abfae73de3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'e06adeff-85b5-4d8d-915c-47f9cf46a8ad')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'7dbc36bf-f175-49e5-b23f-4b3a8065a426')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'e31263ec-4fc3-44e2-95b5-4eb7547c1db3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'8b66dff1-ecf4-4e28-8546-53bde63c4d80')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'a6439344-c1ca-463a-8989-552b42e3fc1f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'aff650df-9edd-40c8-b360-55b6f4b2770a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd7e735fe-3621-4ec2-9276-58de05708119')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'3947ef44-5679-45ec-84c7-603c29368514')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'71aaee71-17d4-4a83-a7ec-65028b3b3029')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'32349857-fa87-4040-a19d-658605158aa2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'de897daa-e13b-488e-8ada-678d04a05930')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'8ad2af2f-c3d6-4eee-9666-67b595c3fc60')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'97c03748-1973-41d5-ac23-6854ebc1f553')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'88a1c28d-49b1-4873-81e9-699b587a4548')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'8d554208-5aa0-4d4b-bb8d-6d9666b6256a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'ac6ce44c-7b46-4f21-ad65-6f55cc98a5e9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'c8eef8b4-47d3-4a93-85f1-70ebe9c8197a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'bee10db2-a28a-4966-a860-710a6cd755c6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0d6d5aed-79b6-4887-b376-71ea0b1bd225')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'92777e41-6e9b-40e7-a37b-71f0cb1f4946')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0cf6a437-8c53-4920-a45a-71fd3f00f57a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'7a23af5a-249a-4b8d-bf7e-720e6c294004')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1300ff2c-ca2f-4b6f-b065-72924d3318e4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'62c2fcae-c7ad-4081-ade2-72f96195b426')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'61520925-e8ec-46f2-b5df-73c595240674')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'067c7f3d-ef84-47fc-8401-7454807a8bf1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'c43403e6-a074-4534-8f5e-746fbe8f7cf8')
GO
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'2b7c3b71-f013-4282-81ed-76ced7dce80f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'9dc2614d-f7e4-44b4-b574-77ec89fdab65')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd9d65462-4cfa-4ac0-8f2a-7807743e87ac')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'72281558-32d6-48d6-8989-7874809f326a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'418f723a-4e9c-42db-adfb-797b9fcbc013')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'9ccf1188-02e1-4f3d-9d82-7a5bcfdfe291')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'41c132b0-670d-4770-9768-7a81d39270cb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'99e2e249-f7a6-4816-a207-7ac0def4c10f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'7283bb6c-0da2-4a47-8ac3-7de9ede13ccf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'e12bafe4-9a85-4f30-a532-7ebc1c065490')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'2606bff3-4233-41c6-818b-7ef773f3106b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'f1306f0e-1e16-4435-b093-7f4b1d720739')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4d09333d-cd6a-4b3b-b2ef-80a853031f0e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd4df0201-cfef-4a82-87c9-810c5c414146')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'4da38791-a252-437c-b7ce-826043d93b20')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'd55ec4b2-9eef-4ce7-b870-837ec598e79c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'6ad0b067-91c6-46e4-908d-87bab721ef86')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'4a89abd6-0125-4f8d-a48d-8a0a695a8f3a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'22820aa3-4e03-4b11-8d0b-8a95f345dccd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'd7f7a66d-fb9f-4aed-9493-8b2f3d5b1dec')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'2b22a4f2-15a0-4f79-ad19-8b6dd8bca45e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'532aceec-ae4e-4f75-a194-8b7eb48e9c06')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'776a6aff-e39f-4de4-914b-8c8624dd21cf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'f92d87b2-99b7-41ae-bb4a-8d0570a5424c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a4f18245-7b62-422a-a11f-8d9b893b5b5a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'da37ff22-c6d2-4842-8daf-8d9dfd396e70')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'745f1b99-07e3-42b2-bd92-8e4cbbf5c25a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'0ce9bc0f-07ee-47f1-8a53-8e8688f071d5')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b51c817-4400-4384-aff4-8ed19e54108c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'da2c024e-2738-4cec-8374-90221b7ae7de')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'9a0b287e-8c84-4b77-bab0-906ca0428ef8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'2c3cb943-a8f4-425d-aef9-90fdfe79cacd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'a09e8acd-5bbc-4316-b190-937e91a4a3ab')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'ca3c2520-ebb3-4937-8fe8-94e6aa4cddbd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'2138d75a-c0a1-4020-a029-954243cf5629')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'b0cf8a36-b106-4108-9df8-9593852d6f30')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'0338d84c-9cdf-49d2-932c-962dc6912ab1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'e597232b-6141-4aae-9002-977af580ff30')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'2fe1fe87-ede9-4446-beed-9786d4b953c1')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'560dd071-3b0d-4ca4-aabf-9917717d858c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'6bee79f0-944d-468a-9757-99c07993d378')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'5be4ab8f-68d4-450e-983e-9afb75a0e6dc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'ca2da273-0a44-4bed-b97e-9bffc8c3e8b6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'369d3e01-43a3-499e-bf1f-9c7441009723')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'1e2aafdb-458e-4cba-a884-9cadabe52f57')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'359272ae-3037-492d-9e9e-9d6a28105334')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'3562740d-0e1a-470c-9480-9de9b2d58340')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'dea2beec-767f-4d6e-93af-9efbe31a2c28')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'2fab63b8-c594-408e-b602-9f06bfe2c104')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'30f46cb7-4ed5-42a7-a685-9f1f03260d03')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a2b0bfeb-b8e3-43bc-82ad-a17e516ed8c2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5750fa80-4145-45ee-a53b-a1ddd8aeb92c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'5a91c08c-e32c-482a-b360-a1e4698ac5ab')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'15589419-ebe3-439f-9957-a4d2aaf52453')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'0e9a1fd3-f78c-4026-a867-a60707d766fb')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'4a53da7a-2c4c-4d5f-abc0-a931f01c5cd8')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'0bad97ce-79d6-4b44-b91a-a9485a2f01d9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'07f15c55-36a2-4a3f-a5e9-ad3c1dd5f9be')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'dfa4137e-4fa1-4cac-b1f9-ad681d3c010e')
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
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'5aa3000b-a5ee-43fb-8b17-ba9732aa7406')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'3aa1fa8c-c32e-4df4-a5a0-bb56fbaaf4b6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'787bf088-7d6f-4dde-bd6d-be70be54308a')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'092f57ef-f0da-4be6-a0ab-bf5765278263')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'b2c86410-4509-4edc-aa41-bf79f98806ca')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dfe5fb52-2ade-4a1b-91b1-c06a078e2c37')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'2e34f39f-e3d0-46dd-ac64-c0f6af8c5d26')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'38933e94-400e-48de-9139-c109b57bbccf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'779e0cd8-0fb1-4418-8538-c354c2a342cc')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'4731adc7-45d9-4bdc-a42c-c48b2b5f8d5d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'bf80deb6-38c6-4062-a177-c4a97405b6d0')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'a0e1a810-07de-4b06-b45d-c4cac942beb4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'bba4917d-6cdb-4b77-9f79-c4ee14e9b5b2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'96336475-14af-488b-9351-c75bc07c81dd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'98758005-240e-4494-99af-c9aa8cbb04ec')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'cf664e3d-0f25-4b86-83c5-cb2a3c84f24e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5db27fe9-15d4-4df0-bbd2-cc329ebd3ff7')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'fe55aede-a8b8-43ac-ab31-ce2bfd433d2c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'95be8573-0e1b-4cd5-9c0e-d0706094a68e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'3a9b61c0-5142-4306-aa27-d09b621edaea')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'32fb6f49-fc63-47d8-8b2e-d1b146692c75')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2ccc9a01-3fe4-4abe-b937-d25c439d39b6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'c226e891-2110-4949-8afc-d3a74bf5263e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'b91af905-29a5-4cc9-9746-d409cac9d433')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'9a818c5e-17c7-4509-a675-d45cb27ad277')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'67d4f2b2-431d-4c94-a77e-d504b5ed5545')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0754b310-28ac-456f-a95a-d5e890c3953b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'f6972236-3a64-439a-a18a-d62dcae79116')
GO
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'cbd38855-255f-4fab-95d8-d6afad2bbd85')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'6b586ba6-35a2-4912-830d-d742fa065bce')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dee869d9-ec53-455b-bdca-d7e3fa599a78')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e2f36cfe-758a-4822-9784-dbf4c80aef79')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'662e3aad-9595-449a-b9e0-dcc96d60b29d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'eab2fa90-4b74-4dd8-ade2-e09a3abe18de')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'f06c7241-fcd1-4bf5-9937-e2a13a5b9a73')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'3133b156-3a21-466f-85c9-e2e9d588030d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'45949560-0258-417f-8364-e3e9942b262f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'a36418c3-12b9-4256-a643-e49218038a53')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'e3bec632-fc30-446c-a021-e4cce4af8d9f')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4f5caa97-ae08-4512-aa7d-ea18bcc9589d')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ccba9d68-ed0a-4b49-9a03-eabe30f162b6')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'dc451215-fb52-41e2-9ddb-eb2bd0087eb9')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'806274e3-0633-45b0-aa5b-eb35006d5a9b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'671ca051-afb6-4637-82a1-eb6989e5fb27')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'6191910d-1e04-4cd4-b664-ecbb532da926')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'99dd11fd-64f5-4a28-bd02-edf47b59dbe5')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e93851ff-7b86-4665-bb6d-ee844f8108cd')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'423545aa-82d0-4bd0-af0d-f0e1318c86c2')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'c3fd87bd-c788-42e6-b01f-f19d93c26ad4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'1fe056ed-3067-4f4c-a6ad-f1f828fa5308')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'87b25935-fe46-47ca-9de3-f32ba785ad95')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'3291c3d4-ecfa-4080-9cb4-f4a5074bae72')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'1fba1de7-2bcd-4a9e-b9cb-f4d24cd6a77e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'052860b3-e9ec-49ec-8495-f5a3c1245ce3')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ea03156b-ca2d-4301-ae84-f645373fdfab')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'113b658a-5f66-45d0-a364-f646b3444d25')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'dfe05c5b-7f2c-4ceb-a267-f6aeda05732e')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'428b3462-2285-46ce-b698-f6b373afd564')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'88359991-5f59-411c-8cbd-f7a3a4ced8cf')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'5da31754-6c87-4745-aa73-f891648d0126')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'f69268c1-f45f-4a38-abd3-f96d62b840ad')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'16c581d0-797a-447f-b5d0-fa3dcb52dcc4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'a7951f51-20e5-4854-90e6-fa5401314a6c')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'72388e63-eb27-4776-9feb-fc582e2ba99b')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'7aee0692-3d0f-4db3-ba1b-fc8841eaaa16')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'ff7f1795-3f48-4657-9d00-fd2ec5d8fd80')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'2f789452-f6e9-46d3-851d-ff44c8ab35d4')
INSERT [dbo].[DimThoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd4991fcc-9ac6-44e5-a7b0-ffcbcc1f650b')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'0ccfb41b-a3e1-4c47-9e03-008cf1349beb', N'073e423d-df10-4f16-a881-326b062bea97', N'da921c55-0926-40d0-be43-6d28db0becfc', N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 12, 17000, 204000, N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'4800d870-1575-40c4-bfd0-0119fb5aa8b3', N'8c490c68-c4c8-4ca4-a98a-2c969d93ff96', N'12825d17-ee17-4b23-bb11-9994163024b4', N'9db37eee-65c0-4559-9960-986bedfb878c', N'9292e952-84c4-4ea4-8fd7-1d1bf059317c', 5, 14500, 72500, N'df2b289d-8088-4117-9f95-6d154241a511', N'1b19f0a0-0270-4fb8-b16e-f13f1e5563f4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ee203765-27df-4ff3-83d7-016d838a0b20', N'3cfc540a-f951-486e-8ca0-0920bf362ade', N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 10, 9000, 90000, N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'26e56917-4156-49e9-8b13-08750af7b8d2', N'd1108160-8a36-477c-be1a-0497f641bcd2', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'9d348171-95d9-4863-9956-156dc096859f', N'20c323ca-2d39-454e-83ff-33184a4d96f9', 15, 10500, 157500, N'32173f1a-dac5-4189-b863-49b6df6cbf16', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'83256f86-d64c-432c-b1a7-0a5e9c146ae2', N'3cfc540a-f951-486e-8ca0-0920bf362ade', N'b717e9da-91ec-498e-be4d-30bb709317a1', N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 12, 8000, 96000, N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'bb045e92-fb1e-47e3-adb5-0b266bb02402', N'd3020dc0-d922-45c6-9062-5a7bc46727ee', N'da921c55-0926-40d0-be43-6d28db0becfc', N'456516b7-9adb-4d06-8a09-5931efd3b566', N'a9410e40-f21e-4fad-a37f-0f26c5fe03eb', 12, 12500, 150000, N'29f1f733-19f6-4c8b-9601-d165e8347ec7', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'157bb951-da33-4e9c-8a21-0c2ec5f3ac0a', N'7e3ebbf1-acb4-408b-bf42-b9e3f28eacf4', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'088de54e-4163-4e84-8ebd-3d120ead38b0', N'e7e37ddf-2971-4fcc-8377-051ad2725554', 8, 14700, 117600, N'309ceae6-2fd3-4cdf-a908-32b9ea6eb0c2', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'6b1ff647-ee3d-4b72-b214-0e1ab0f482f1', N'b6e1dfb1-c7b9-48e2-b0e3-9e7255d21542', N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 15, 21500, 322500, N'b5b3a14c-ffcd-4f91-8a52-15dd9656a35e', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a26d3832-cd6e-444f-984d-1004db801303', N'06a80f77-7221-4082-948b-eb7907db5c7c', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'ff72453d-bff2-4150-91d3-2123b14abeff', N'a41effd0-147b-449f-b55d-04665844b87e', 10, 8500, 85000, N'419bec55-bb9d-4262-a607-d393ba3d4e1d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8b5d0872-f9b3-4ed0-aa63-1096e8908472', N'bc828c64-47ce-45f3-b9f8-02e9f54184a4', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 11, 32000, 352000, N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5502f8ed-8890-4667-9691-1272f7c31cb3', N'e4b34b3b-d144-410b-b6a2-925a62acfc45', N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'2cd935fb-b467-4c62-ab55-3fb788e80a84', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 7, 16800, 117600, N'9abb1193-8ff1-4282-b25b-3c56812ed1f0', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'3456ba64-8c7b-4456-bd19-1369bcbd0b8a', N'8088d830-5657-4d8a-921b-7cc24780fb5f', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'e7e37ddf-2971-4fcc-8377-051ad2725554', 10, 12000, 120000, N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd8410abe-c080-447e-b957-13d9d3bb5bdd', N'ded42f49-7725-4d05-8427-01074898303f', N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'0a8621e0-103e-437b-832b-26f3c54c5794', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 15, 6500, 97500, N'9f37416b-9776-47d8-831b-2ff950b0e5ca', N'e557c8e6-53d9-4360-8010-f17ca5d22cc4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'74759626-53fd-4d31-941f-175b6788ce63', N'eda6e4e1-c3f3-4d1d-8fef-7530072657bf', N'788ecb59-49de-4e38-9c31-c2d1177ff438', N'4bbe2a3c-951f-49c4-a3d3-6670d5cca6b1', N'd8b1033d-a136-471e-b832-3403be6cbede', 15, 11000, 165000, N'02f8c709-97a8-49d2-b135-092bbad24b77', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd33c2670-aeb4-460d-9f9f-1794c96aca8e', N'094a8b2a-308f-4780-a9ab-1211c2398218', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'809c097d-5c39-483a-af68-76aeb581d357', N'0c8b611c-99b1-4afb-b337-0753063512e8', 5, 15600, 78000, N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7ad746ad-f848-4992-81a0-1ada14a29ca1', N'b4257768-3c75-479c-a81c-87bbc4d48642', N'12825d17-ee17-4b23-bb11-9994163024b4', N'456516b7-9adb-4d06-8a09-5931efd3b566', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 5, 14500, 72500, N'29f1f733-19f6-4c8b-9601-d165e8347ec7', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ed971ad7-cbff-41dc-86e7-1cb541e0ae88', N'8828c90c-3475-4497-a3c8-2175b33c3f4f', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 7, 7500, 52500, N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'991b6deb-0a23-4149-b29c-2168f55a6351', N'fd8667f6-f4e2-4f0f-a2d8-2e5d33bdd565', N'12825d17-ee17-4b23-bb11-9994163024b4', N'be801b26-011e-42c0-af3a-d15874c63151', N'a9410e40-f21e-4fad-a37f-0f26c5fe03eb', 7, 12500, 87500, N'291d829c-a289-4c56-adce-a39258c3b32f', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a69191c5-0f7a-4839-a333-21c9a554fe67', N'fa1414c5-c39e-477f-9ffd-eb44d9071718', N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 2, 38500, 77000, N'257f585d-ea5d-4391-8e4b-890bbabec556', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'72fd4f49-6313-42de-b7fb-237c10719348', N'8828c90c-3475-4497-a3c8-2175b33c3f4f', N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 15, 16800, 252000, N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a3028ff4-6cf0-4af2-a56e-248afd7c0df7', N'e4b34b3b-d144-410b-b6a2-925a62acfc45', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'2cd935fb-b467-4c62-ab55-3fb788e80a84', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 3, 10500, 31500, N'9abb1193-8ff1-4282-b25b-3c56812ed1f0', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8e552997-1aaf-461f-b532-25113ffba8bf', N'439c378f-f7db-4478-905b-42a0c3314639', N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'c8eef8b4-47d3-4a93-85f1-70ebe9c8197a', 15, 18500, 277500, N'a84cd236-e668-4e23-a72a-c006eb70e3dc', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'77bd8fea-face-4540-9d1c-27dc275143a7', N'073e423d-df10-4f16-a881-326b062bea97', N'12825d17-ee17-4b23-bb11-9994163024b4', N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 14, 12500, 175000, N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'90b5d2d2-d296-46d8-8205-281db58b5884', N'317176fe-5edd-4695-83ab-fae38733976d', N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'0a8621e0-103e-437b-832b-26f3c54c5794', N'd8b1033d-a136-471e-b832-3403be6cbede', 15, 6500, 97500, N'9f37416b-9776-47d8-831b-2ff950b0e5ca', N'e557c8e6-53d9-4360-8010-f17ca5d22cc4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e7cd58b1-054d-4608-886b-2c40f720045a', N'fe773e01-4342-487d-89ec-652cbe21fefd', N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'ff72453d-bff2-4150-91d3-2123b14abeff', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 6, 21500, 129000, N'419bec55-bb9d-4262-a607-d393ba3d4e1d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'03cd757a-2b56-4cd1-b0b8-2c8f85f4aeb0', N'03e5ff23-1ec4-492b-8a3f-aff18d3d033c', N'12825d17-ee17-4b23-bb11-9994163024b4', N'ae39f8aa-a3a9-451f-a99b-7299f8f505e7', N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421', 1, 14500, 14500, N'498f39a6-9e54-461b-8026-9cc4018b0094', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8686c90b-b6af-4efa-ad2f-2e4e211c21c6', N'75fa6314-ee29-4f2b-a137-be75fbce8744', N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'4a6baa7d-1c49-40da-9667-0d0222121068', 20, 11000, 220000, N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'3ec76523-850d-457b-b729-2f7dff1f0454', N'f62923cf-d1e2-44ad-a94b-303d7d0b245e', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'a736fa9b-3f66-4d42-bf5d-048a840fc567', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 20, 23000, 460000, N'df2b289d-8088-4117-9f95-6d154241a511', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'56bd8f6e-8bb8-4857-8dbf-397ae226f300', N'e0d64a40-03f3-4125-821f-d8c8b087c76e', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'78f68a5e-aaa9-4e1a-ba97-b0aa8b4201b1', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 5, 23000, 115000, N'631f47b8-4ee4-4d05-a3e9-a28fd7e9a880', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b3bf1e0e-18e0-460f-9b89-4365f185a066', N'1de050bc-954f-40b6-9d7a-4c9251d1fb3e', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 2, 23000, 46000, N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'985c9d33-040d-435b-a920-44ac85ccec80', N'e1ec78cf-f5f3-41f0-a560-e3d97316f9ef', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'ef059dfc-7215-492f-a235-063a1017b872', 8, 10000, 80000, N'acfd9937-2731-4939-8c3c-e89d117658ef', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ea2a7097-0857-4ddc-ac37-472659df6994', N'b6e1dfb1-c7b9-48e2-b0e3-9e7255d21542', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 3, 32000, 96000, N'b5b3a14c-ffcd-4f91-8a52-15dd9656a35e', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c1e7d5cd-02c7-4b41-8efe-4811db8d56ef', N'ca7d7e09-fc92-4d5f-ae70-30228cba35fd', N'da921c55-0926-40d0-be43-6d28db0becfc', N'456516b7-9adb-4d06-8a09-5931efd3b566', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 12, 12500, 150000, N'29f1f733-19f6-4c8b-9601-d165e8347ec7', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b5a41811-2012-45db-9f13-49124688f0be', N'aba262f6-74a7-4ffb-94bb-85e72f7d5c76', N'b717e9da-91ec-498e-be4d-30bb709317a1', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'd8b1033d-a136-471e-b832-3403be6cbede', 3, 17000, 51000, N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ce0307d8-3194-4f72-8d88-49ab2fabb079', N'1f243743-f681-4ac6-9d61-3fcb23c060ef', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 12, 9000, 108000, N'a84cd236-e668-4e23-a72a-c006eb70e3dc', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a0d98c00-30b9-4355-8362-4c9219ff778f', N'3d452314-2597-4dde-955c-e99c15363821', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'a41effd0-147b-449f-b55d-04665844b87e', 15, 10500, 157500, N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'55d4160b-f8db-453f-b2c1-4dc7d0a6e36a', N'06a80f77-7221-4082-948b-eb7907db5c7c', N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'ff72453d-bff2-4150-91d3-2123b14abeff', N'a41effd0-147b-449f-b55d-04665844b87e', 7, 21500, 150500, N'419bec55-bb9d-4262-a607-d393ba3d4e1d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5cbb4dbf-feb0-4db7-ae52-4f394c0e504f', N'a27b0ce8-179d-486a-bf5f-07b957a3bb66', N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'0c8b611c-99b1-4afb-b337-0753063512e8', 3, 16700, 50100, N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'659ddda9-4ea4-4d15-a424-5122d0e0519c', N'fa1414c5-c39e-477f-9ffd-eb44d9071718', N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 5, 9000, 45000, N'257f585d-ea5d-4391-8e4b-890bbabec556', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'f80cb2e7-8c76-4db2-9903-51645ea8da00', N'1d1811ce-347c-43f2-bd02-a39e11b8fcd7', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'47e83d58-2957-4efc-8b4a-81862c6d5284', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 12, 15600, 187200, N'291d829c-a289-4c56-adce-a39258c3b32f', N'e557c8e6-53d9-4360-8010-f17ca5d22cc4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'bc5e2d5a-8442-444c-af36-5607c6c7ee87', N'3f8d3275-684f-4feb-8e8e-fc97de1661c7', N'12825d17-ee17-4b23-bb11-9994163024b4', N'9db37eee-65c0-4559-9960-986bedfb878c', N'20c323ca-2d39-454e-83ff-33184a4d96f9', 5, 14500, 72500, N'df2b289d-8088-4117-9f95-6d154241a511', N'1b19f0a0-0270-4fb8-b16e-f13f1e5563f4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'faaa3908-8e5c-484e-8eb4-587119592c59', N'fe773e01-4342-487d-89ec-652cbe21fefd', N'da921c55-0926-40d0-be43-6d28db0becfc', N'ff72453d-bff2-4150-91d3-2123b14abeff', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 15, 17000, 255000, N'419bec55-bb9d-4262-a607-d393ba3d4e1d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8bae8fdf-09f4-4240-8442-5981e0fb76de', N'7d12d88b-e7c5-4b58-86ac-987d38fef662', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421', 68, 9000, 612000, N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'da2db58c-90e3-40d2-85ed-5c48e8d52388', N'dbe3b9db-d8fd-4292-8536-da6038af01cb', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'ae273446-5649-4736-86f9-d33d2a68a2ab', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 7, 19700, 137900, N'6a7f496f-a6c3-4426-9be8-76078024e372', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'bf218e24-235f-492f-b496-5d3d3c81f566', N'c231bdac-d05f-45b9-a221-b33b952b4c68', N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 10, 5800, 58000, N'b5b3a14c-ffcd-4f91-8a52-15dd9656a35e', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'08433624-c382-4194-836d-5dbf8e9c8f6c', N'000badf9-5378-4d57-9f27-9f67cda7323f', N'103ee851-a6ae-4805-bed3-8be1b8d7c776', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 25, 5500, 137500, N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'2f323ef7-2ef0-4602-8ea2-5deb27075d22', N'06222756-a5d1-4e6c-aa48-8b9dbc3ebaf5', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'e7e37ddf-2971-4fcc-8377-051ad2725554', 7, 25000, 175000, N'178bc0e5-2397-425c-b383-c2b36e447d02', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7ac8dceb-5ac9-4bb0-90ee-5e098bb92482', N'5205be29-7a96-49e0-a0cd-8bffa1d58c49', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'95be05c6-8936-42da-ba38-0a0a1bd23d92', 17, 14700, 249900, N'257f585d-ea5d-4391-8e4b-890bbabec556', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b50cc429-e316-45d6-9d01-5e0cc0055ef0', N'fe55b515-ce5c-44f4-9948-a0ede3c99f92', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 2, 19700, 39400, N'a84cd236-e668-4e23-a72a-c006eb70e3dc', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7ca8bae2-e683-4121-b053-5ef6be37a151', N'fa1414c5-c39e-477f-9ffd-eb44d9071718', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 15, 15600, 234000, N'257f585d-ea5d-4391-8e4b-890bbabec556', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b4446f07-dfd5-4766-a5a8-6049a0842d1e', N'699ca99b-5f72-4074-b59e-23bb91afadae', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'e7e37ddf-2971-4fcc-8377-051ad2725554', 5, 25000, 125000, N'178bc0e5-2397-425c-b383-c2b36e447d02', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'27db80df-dd3c-479d-99b2-60f486a649c5', N'66458faf-b527-4100-a043-0958d1074569', N'05ce8659-369b-45ac-ac71-3ffe3abc68bc', N'9db37eee-65c0-4559-9960-986bedfb878c', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 3, 14500, 43500, N'df2b289d-8088-4117-9f95-6d154241a511', N'1b19f0a0-0270-4fb8-b16e-f13f1e5563f4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'ca26620e-b51d-4340-a62e-65bbc376584d', N'1a0ee7d2-ddfb-44a8-8b29-24de1daabb46', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'9292e952-84c4-4ea4-8fd7-1d1bf059317c', 15, 34500, 517500, N'178bc0e5-2397-425c-b383-c2b36e447d02', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e2da0117-cf44-402f-9f00-65fe7fcaa5d6', N'0a9348ba-0cb1-4222-a34e-fe8dfd0d4f79', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'809c097d-5c39-483a-af68-76aeb581d357', N'0c8b611c-99b1-4afb-b337-0753063512e8', 4, 15600, 62400, N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd496c796-4568-48e5-8f67-6c5305d7f0a7', N'bf9bbbe4-3d72-4cd5-bb64-7e369fb1ba95', N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 11, 9000, 99000, N'acfd9937-2731-4939-8c3c-e89d117658ef', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e8280ead-6a7c-4ad2-98cc-6e094bf3fff3', N'c4df5057-7a57-4003-b400-65862c8908cb', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 50, 34500, 1725000, N'8eef93dd-ba49-4e23-8887-3dc0afb2292b', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'83b4c118-defc-4316-b373-71617dcb34fe', N'8915a4fe-107e-4cd1-8181-d0e3b7ccdf08', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'ef059dfc-7215-492f-a235-063a1017b872', 2, 19700, 39400, N'a84cd236-e668-4e23-a72a-c006eb70e3dc', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'dd60427e-4f42-435b-acd6-778af2b829d3', N'a2d4bf6d-a3f9-497b-805b-dbb7c3bdedb3', N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'8b66dff1-ecf4-4e28-8546-53bde63c4d80', 11, 9000, 99000, N'acfd9937-2731-4939-8c3c-e89d117658ef', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'82cbcb38-365e-427e-a977-77d2117a9d09', N'0a9348ba-0cb1-4222-a34e-fe8dfd0d4f79', N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'809c097d-5c39-483a-af68-76aeb581d357', N'0c8b611c-99b1-4afb-b337-0753063512e8', 10, 9000, 90000, N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8d677fff-787a-45f3-bb76-7838c92dc21e', N'77a030cf-f39a-4d0d-9c55-6310e6e01587', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 8, 10000, 80000, N'acfd9937-2731-4939-8c3c-e89d117658ef', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c95db28a-d8ff-4086-b471-791205883b65', N'710966d4-4bd1-4605-a6dd-cec93a35b364', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'ae9d7ab5-6ae7-4e53-a281-e410be0382a0', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 7, 8500, 59500, N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'4db3b6bd-85a0-4607-9097-7b83e9372862', N'354ae10e-4b9e-47f5-8fa9-dfb72710fd84', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 10, 7500, 75000, N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'683e293e-f658-4a59-b233-7d9692e29e83', N'5d8f6d92-0c3c-47ba-a0b8-c7085f9313c4', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'e7e37ddf-2971-4fcc-8377-051ad2725554', 9, 15000, 135000, N'a5f5eb6c-36cf-464e-87b5-7cd0cffeb854', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'579d40b3-a8aa-422c-bd12-7e4b643fef17', N'e4b34b3b-d144-410b-b6a2-925a62acfc45', N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'2cd935fb-b467-4c62-ab55-3fb788e80a84', N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737', 8, 5800, 46400, N'9abb1193-8ff1-4282-b25b-3c56812ed1f0', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'99aeb955-d28d-4291-9226-7e5071132e7a', N'eda6e4e1-c3f3-4d1d-8fef-7530072657bf', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'4bbe2a3c-951f-49c4-a3d3-6670d5cca6b1', N'd8b1033d-a136-471e-b832-3403be6cbede', 6, 14700, 88200, N'02f8c709-97a8-49d2-b135-092bbad24b77', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd0ab2ea8-95f9-405b-9650-7ed1371f8074', N'82ee7910-5623-4002-9125-12f59ea46b51', N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0', 3, 16700, 50100, N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'83c9356f-d495-4985-b975-807a531ddf8d', N'8088d830-5657-4d8a-921b-7cc24780fb5f', N'b717e9da-91ec-498e-be4d-30bb709317a1', N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'e7e37ddf-2971-4fcc-8377-051ad2725554', 4, 8000, 32000, N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd109d592-28d3-41b1-91be-885d9858dcfd', N'e7f20f40-a92c-4356-a3fc-4daee7566c4a', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'20c323ca-2d39-454e-83ff-33184a4d96f9', 15, 34500, 517500, N'178bc0e5-2397-425c-b383-c2b36e447d02', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'987b1053-734e-42cf-b500-88e6ddc58fb3', N'1dfc8dfd-c752-4eef-9e2b-585d91d3d014', N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 20, 11000, 220000, N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b4091fb4-1042-4d37-918f-8a6c5d80cf52', N'98d26551-16c5-4244-a927-5ef7b25c8a07', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'9db37eee-65c0-4559-9960-986bedfb878c', N'a9410e40-f21e-4fad-a37f-0f26c5fe03eb', 12, 8500, 102000, N'df2b289d-8088-4117-9f95-6d154241a511', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c1bff36a-1f74-4de5-97f9-8ce9a4cf294e', N'cb2036d2-0e33-45f1-a315-e7e31ae54a22', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 2, 23000, 46000, N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'f3e681e2-a407-495c-bacd-92c7112ebcf7', N'a960ef78-dcb9-4a3a-8ad7-37da55c46573', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'98c66e0b-1f19-406f-9387-50341f027d5d', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 6, 10500, 63000, N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5a474a6b-3214-4c30-a187-94129a4aad34', N'55c6d04c-0bf6-4c89-b28a-8ba51f5ad131', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'a736fa9b-3f66-4d42-bf5d-048a840fc567', N'a9410e40-f21e-4fad-a37f-0f26c5fe03eb', 20, 23000, 460000, N'df2b289d-8088-4117-9f95-6d154241a511', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8c95abf1-33c0-4145-9595-949f59baa82c', N'354ae10e-4b9e-47f5-8fa9-dfb72710fd84', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 8, 14700, 117600, N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'900d0adf-a277-442c-8d46-9ba7cb2e2b3d', N'e3e8a00c-ef4c-49cf-9178-13502de8f3e6', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'4e4b8dbc-c20f-4e8f-8aee-65828a4c6219', N'ef059dfc-7215-492f-a235-063a1017b872', 3, 7500, 22500, N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e8d0dffb-455a-4338-9af8-9cca92afe1e4', N'ecbbdf0e-95aa-4b93-89dc-8b15e8dc7b85', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'9db37eee-65c0-4559-9960-986bedfb878c', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 15, 8500, 127500, N'df2b289d-8088-4117-9f95-6d154241a511', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'da11d07a-a593-40a4-ae25-9e55722f9fe9', N'f2790540-9704-4112-a97c-5405660e5ae0', N'12825d17-ee17-4b23-bb11-9994163024b4', N'ae39f8aa-a3a9-451f-a99b-7299f8f505e7', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 1, 14500, 14500, N'498f39a6-9e54-461b-8026-9cc4018b0094', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e6fa2a93-efdc-4fff-96b0-a016bbbfda40', N'29ae44d9-c2ee-4bb7-b011-7fd3de3a175f', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 5, 25000, 125000, N'178bc0e5-2397-425c-b383-c2b36e447d02', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e5883dee-1fa2-47a9-ba01-a0a6817cc5cc', N'fe773e01-4342-487d-89ec-652cbe21fefd', N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'ff72453d-bff2-4150-91d3-2123b14abeff', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 10, 38500, 385000, N'419bec55-bb9d-4262-a607-d393ba3d4e1d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7cc59a82-10f3-464a-ab15-a0f24a58926e', N'211137ba-e008-402c-aae0-8fabd871b8f2', N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'37796d93-4c4d-41e1-846e-1dad6ccd187b', 15, 18500, 277500, N'a84cd236-e668-4e23-a72a-c006eb70e3dc', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'fa2b74d3-7d65-473f-a896-a153f2502b2d', N'a960ef78-dcb9-4a3a-8ad7-37da55c46573', N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'98c66e0b-1f19-406f-9387-50341f027d5d', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 4, 21500, 86000, N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c6b682a8-2149-4063-8908-a32539bbffac', N'e3e8a00c-ef4c-49cf-9178-13502de8f3e6', N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'4e4b8dbc-c20f-4e8f-8aee-65828a4c6219', N'ef059dfc-7215-492f-a235-063a1017b872', 13, 5800, 75400, N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5a1dc668-3006-4d19-8606-a501023dc6bc', N'a960ef78-dcb9-4a3a-8ad7-37da55c46573', N'da921c55-0926-40d0-be43-6d28db0becfc', N'98c66e0b-1f19-406f-9387-50341f027d5d', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 5, 17000, 85000, N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'55906200-e095-4692-84c2-a5092d29f5a4', N'8f3ea6d3-00ce-41d9-88bd-843e6f48118b', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'78f68a5e-aaa9-4e1a-ba97-b0aa8b4201b1', N'8b66dff1-ecf4-4e28-8546-53bde63c4d80', 5, 23000, 115000, N'631f47b8-4ee4-4d05-a3e9-a28fd7e9a880', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b294f677-00e4-46dc-b83d-a8d541b9bc53', N'66aca5c1-b3ae-40f7-91ef-0c1e8dd93ea8', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 18, 9000, 162000, N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'48cbf146-6363-4d9e-a943-aac1219198de', N'1dfc8dfd-c752-4eef-9e2b-585d91d3d014', N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27', 10, 16800, 168000, N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'43d26051-0366-4b43-b577-ae05a4e8548b', N'1d1811ce-347c-43f2-bd02-a39e11b8fcd7', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'47e83d58-2957-4efc-8b4a-81862c6d5284', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 5, 10500, 52500, N'291d829c-a289-4c56-adce-a39258c3b32f', N'e557c8e6-53d9-4360-8010-f17ca5d22cc4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'8769081c-41de-4312-b32e-ae112485ee0d', N'ad8e8420-faaa-41f3-9e23-23582020d153', N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'4a6baa7d-1c49-40da-9667-0d0222121068', 5, 21000, 105000, N'8eef93dd-ba49-4e23-8887-3dc0afb2292b', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'803d9225-3a1b-4844-b277-b385cc6a7ce8', N'e9d9d7da-6a5a-49cf-b945-969b14e718ee', N'b717e9da-91ec-498e-be4d-30bb709317a1', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083', 3, 17000, 51000, N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd8af43c7-b7ab-4e9b-bb3c-b44ee5755469', N'ac6da2fa-c376-4d3b-9c68-c25bbf1ced91', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'74b70690-197e-4e79-aa8e-48323c9234d3', N'95be05c6-8936-42da-ba38-0a0a1bd23d92', 2, 25000, 50000, N'c2ef1581-d062-4390-b6a8-e93d0ac397dd', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd78f90d5-f224-46be-aee6-b4f3eb9bcf5c', N'b3d8f424-dfc7-47e1-9d20-0112a3f35f8b', N'b717e9da-91ec-498e-be4d-30bb709317a1', N'809c097d-5c39-483a-af68-76aeb581d357', N'c8eef8b4-47d3-4a93-85f1-70ebe9c8197a', 6, 8000, 48000, N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b45793ec-e5f2-4f3a-8e5d-b55407653e53', N'1d1811ce-347c-43f2-bd02-a39e11b8fcd7', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'47e83d58-2957-4efc-8b4a-81862c6d5284', N'038bb1cf-5098-4daa-99cf-016ef34eba70', 5, 7500, 37500, N'291d829c-a289-4c56-adce-a39258c3b32f', N'e557c8e6-53d9-4360-8010-f17ca5d22cc4')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'83c0ed94-ebb5-4235-858a-bade8be73f13', N'30b2f894-b36f-4bce-b204-5c5bdaa893a3', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'ae273446-5649-4736-86f9-d33d2a68a2ab', N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421', 7, 19700, 137900, N'6a7f496f-a6c3-4426-9be8-76078024e372', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'596be604-639a-46f8-b83c-bd0fc92072ec', N'4d8b4a4c-7d0b-4ffd-8c44-d9ee1b288342', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'088de54e-4163-4e84-8ebd-3d120ead38b0', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 12, 8500, 102000, N'309ceae6-2fd3-4cdf-a908-32b9ea6eb0c2', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'52f8c745-9366-47b3-8f83-bd6b587cee2b', N'162a878a-8622-42a3-9d7b-875a22205a5d', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421', 5, 8500, 42500, N'a5f5eb6c-36cf-464e-87b5-7cd0cffeb854', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'93960d92-0311-4ecb-88ef-c2b7b73656ee', N'5baef3dd-938a-412b-9ea6-f897aa7d705d', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'9d348171-95d9-4863-9956-156dc096859f', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 30, 10500, 315000, N'32173f1a-dac5-4189-b863-49b6df6cbf16', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'f09d6742-f05d-4f0a-ab86-c7b0457e23de', N'fd8667f6-f4e2-4f0f-a2d8-2e5d33bdd565', N'296dec25-6419-4a5b-b9f9-0391743777ab', N'be801b26-011e-42c0-af3a-d15874c63151', N'a9410e40-f21e-4fad-a37f-0f26c5fe03eb', 10, 7500, 75000, N'291d829c-a289-4c56-adce-a39258c3b32f', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'd6d9e878-0cd3-4f4e-807d-c814120029f3', N'df2d59a1-7f32-4aa4-a962-4cd57ff68f4c', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'9db37eee-65c0-4559-9960-986bedfb878c', N'a41effd0-147b-449f-b55d-04665844b87e', 15, 8500, 127500, N'df2b289d-8088-4117-9f95-6d154241a511', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'2f489408-e535-4cc4-a3ef-c8c2c05b93cb', N'61ced6d5-fa1a-43e5-b907-a0120af24803', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'9db37eee-65c0-4559-9960-986bedfb878c', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 12, 8500, 102000, N'df2b289d-8088-4117-9f95-6d154241a511', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'74412703-a097-4c03-a049-cd806405bd95', N'519b4379-4a56-4b36-8274-a7ccb24f8a1f', N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 5, 8500, 42500, N'a5f5eb6c-36cf-464e-87b5-7cd0cffeb854', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
GO
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'f5d4d12b-e4a7-49bb-b016-d16eb3294d75', N'b3d8f424-dfc7-47e1-9d20-0112a3f35f8b', N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'809c097d-5c39-483a-af68-76aeb581d357', N'c8eef8b4-47d3-4a93-85f1-70ebe9c8197a', 3, 11000, 33000, N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'4833f60b-a34d-43b8-8907-d1a2bc268d8f', N'61243f31-6b49-4a86-8879-cecf3f239274', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 1, 34500, 34500, N'178bc0e5-2397-425c-b383-c2b36e447d02', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'c02ebba0-7a20-4d61-9210-d1fedef3942c', N'88ef5d1f-98f2-4e7a-903b-4e60579d079a', N'12825d17-ee17-4b23-bb11-9994163024b4', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 3, 12500, 37500, N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7fe70b28-6d97-4ae4-958b-d56c6695ba1e', N'354ae10e-4b9e-47f5-8fa9-dfb72710fd84', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 4, 15600, 62400, N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'be358498-badb-4ec9-89a3-d6196a7a37ad', N'ceea0c82-35ab-43f5-a192-8f63038b4374', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 9, 15000, 135000, N'a5f5eb6c-36cf-464e-87b5-7cd0cffeb854', N'9ee30431-5ae1-490c-80a8-efc1e7dc7bab')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'b174edee-f67f-4b5e-8778-d65c06952d38', N'710966d4-4bd1-4605-a6dd-cec93a35b364', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'ae9d7ab5-6ae7-4e53-a281-e410be0382a0', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 15, 12000, 180000, N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'e3f83422-f8be-4b46-88e3-d6732e635a43', N'710966d4-4bd1-4605-a6dd-cec93a35b364', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'ae9d7ab5-6ae7-4e53-a281-e410be0382a0', N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05', 5, 32000, 160000, N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'f3c2ea10-fd9f-4b58-88ae-94e33f3ab666')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'2ce18e5f-53ac-4a09-bcab-d7a6c0712ec8', N'4d8b4a4c-7d0b-4ffd-8c44-d9ee1b288342', N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'088de54e-4163-4e84-8ebd-3d120ead38b0', N'8d3a1e2a-eac3-4a36-8912-016532c406dc', 7, 32000, 224000, N'309ceae6-2fd3-4cdf-a908-32b9ea6eb0c2', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'50a34c05-60ac-4b1a-bf25-e0f3696e70fb', N'88ef5d1f-98f2-4e7a-903b-4e60579d079a', N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 7, 38500, 269500, N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'4e78c62d-0556-4802-a407-e20253ebc50c', N'eda6e4e1-c3f3-4d1d-8fef-7530072657bf', N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'4bbe2a3c-951f-49c4-a3d3-6670d5cca6b1', N'd8b1033d-a136-471e-b832-3403be6cbede', 4, 38500, 154000, N'02f8c709-97a8-49d2-b135-092bbad24b77', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'51e27ab2-1889-4d0f-a306-e387d67e5d92', N'073e423d-df10-4f16-a881-326b062bea97', N'b717e9da-91ec-498e-be4d-30bb709317a1', N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 10, 8000, 80000, N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f', N'806dd141-db3f-4bc7-a60f-e9210fdec6b3')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'41ccebfd-b814-4475-9568-e6888d1e10c9', N'3d452314-2597-4dde-955c-e99c15363821', N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'a41effd0-147b-449f-b55d-04665844b87e', 6, 12000, 72000, N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'453f59f3-0dc9-49df-97a1-e95b9d07cb42', N'e3e8a00c-ef4c-49cf-9178-13502de8f3e6', N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'4e4b8dbc-c20f-4e8f-8aee-65828a4c6219', N'ef059dfc-7215-492f-a235-063a1017b872', 13, 5800, 75400, N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'23792dfb-7233-45cf-9e50-ec79791e50d0', N'75fa6314-ee29-4f2b-a137-be75fbce8744', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'4a6baa7d-1c49-40da-9667-0d0222121068', 10, 8500, 85000, N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'a3dc21ac-7016-4848-95be-efdb5f96b694', N'c231bdac-d05f-45b9-a221-b33b952b4c68', N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d', 8, 10500, 84000, N'b5b3a14c-ffcd-4f91-8a52-15dd9656a35e', N'2eb54b69-8fc8-4922-9022-0f63dfbec883')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'aac32744-f5d8-491e-8102-f40e1393be61', N'77f09a73-af97-47b4-98e1-36a2aaaae220', N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'dfeea4b0-de28-4740-b8e0-24d860fb4f18', 5, 21000, 105000, N'8eef93dd-ba49-4e23-8887-3dc0afb2292b', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'07f6c788-d30e-47ba-93c4-f5a0c0d0d3eb', N'094a8b2a-308f-4780-a9ab-1211c2398218', N'da921c55-0926-40d0-be43-6d28db0becfc', N'809c097d-5c39-483a-af68-76aeb581d357', N'0c8b611c-99b1-4afb-b337-0753063512e8', 6, 17000, 102000, N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'48207896-1a8e-4686-8306-b0bf0a347976')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'7e6980d7-c6cc-4202-865f-f5e766b984ca', N'5205be29-7a96-49e0-a0cd-8bffa1d58c49', N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'95be05c6-8936-42da-ba38-0a0a1bd23d92', 5, 38500, 192500, N'257f585d-ea5d-4391-8e4b-890bbabec556', N'e90b5357-e880-4348-b960-90ae75da7126')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'60788b58-0172-46e4-a268-f6db0f6e3e40', N'39269330-7032-4e18-bd47-234303d09c06', N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'74b70690-197e-4e79-aa8e-48323c9234d3', N'0c8b611c-99b1-4afb-b337-0753063512e8', 2, 25000, 50000, N'c2ef1581-d062-4390-b6a8-e93d0ac397dd', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'41c67bcc-1d31-4a40-9034-fb0b2e940e14', N'35d94827-912c-4005-a36c-2b4fba31ed5f', N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421', 50, 34500, 1725000, N'8eef93dd-ba49-4e23-8887-3dc0afb2292b', N'91112006-8721-4353-9837-af937af3dc9c')
INSERT [dbo].[FactSales] ([saledetailid], [saleid], [mahh], [makh], [thoigianid], [soluong], [dongia], [thanhtien], [makv], [mach]) VALUES (N'5504404d-2074-4475-bb0a-febe29bf64ad', N'6a4354ee-383e-4173-ab80-2080cff403a2', N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'dc4ca625-b5da-4105-91e9-31797ce98a24', 68, 9000, 612000, N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a', N'0a1b95ee-6229-45a9-9098-22e88fd30c08')
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
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Snack khoai tây Slide', N'Snack khoai tây Slidekhông tồn tại', N'0_Snack khoai tây Slide', N'0_Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Snack khoai tây O''star', N'Snack khoai tây O''starkhông tồn tại', N'0_Snack khoai tây O''star', N'0_Bánh kẹo')
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
GO
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh AFC', N'hàng hóa đã tồn tại', N'HH005', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh Goute', N'hàng hóa đã tồn tại', N'HH013', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Kẹo Golia', N'hàng hóa đã tồn tại', N'HH015', N'Bánh kẹo')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Dầu ăn Tường An', N'hàng hóa đã tồn tại', N'HH004', N'Dầu ăn')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Trà xanh O2', N'hàng hóa đã tồn tại', N'HH001', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Coca cola', N'hàng hóa đã tồn tại', N'HH002', N'Nước giải khát')
INSERT [dbo].[HanghoaTmp] ([tenhh], [ghichu], [mahh], [chungloai]) VALUES (N'Bánh ChocoPie', N'hàng hóa đã tồn tại', N'HH003', N'Bánh kẹo')
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
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0131', N'Lê Thanh Bình', N'Male ', N'HCMSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0132', N'Nguyễn Cao Cường', N'Male', N'Cần ThơSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0161', N'Nguyễn Cẩm Tú', N'Female', N'Quảng NgãiMiddle VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0111', N'Jane.L', N'Female', N'AustinTexasUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0112', N'Katerine.M', N'Female', N'OrlandoFloridaUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0113', N'John F.', N'Male', N'AustinTexasUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0141', N'Phạm Thanh Sơn', N'Male ', N'Đồng NaiSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0142', N'Lê Mỹ Dung', N'Female', N'Hà NộiNorthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0121', N'Richard S.', N'Male ', N'BostonNew JerseyUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0122', N'Michael N.', N'Male', N'OrlandoFloridaUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0123', N'Mick D.', N'Male', N'San FranciscoCaliforniaUSA')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0124', N'Nguyễn Thanh Hằng', N'Female', N'HCMSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0125', N'Lê Như Quỳnh', N'Female', N'Nam ĐịnhNorthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0151', N'Lê Thành Tài', N'Male ', N'Bình DươngSouthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0152', N'Trần Thanh Tâm', N'Female', N'Hải PhòngNorthern VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0153', N'Trần Bình Minh', N'Male', N'Đà NẵngMiddle VietnamVietnam')
INSERT [dbo].[KhachhangTmp] ([makh], [tenkh], [phai], [makv]) VALUES (N'Cus0154', N'Phan Ngọc Đức', N'Male', N'HuếMiddle VietnamVietnam')
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
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Đồng NaiSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Đồng Nai')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Hà NộiNorthern VietnamVietnam', N'Việt Nam', N'Miền Bắc', N'Tp. Hà Nội')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'AustinTexasUSA', N'Hoa Kỳ', N'Texas', N'Austin')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'OrlandoFloridaUSA', N'Hoa Kỳ', N'Florida', N'Orlando')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'AustinTexasUSA', N'Hoa Kỳ', N'Texas', N'Austin')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Bình DươngSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Bình Dương')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Hải PhòngNorthern VietnamVietnam', N'Việt Nam', N'Miền Bắc', N'Hải Phòng')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Đà NẵngMiddle VietnamVietnam', N'Việt Nam', N'Miền Trung', N'Tp.Đà Nẵng')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'HuếMiddle VietnamVietnam', N'Việt Nam', N'Miền Trung', N'Huế')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'BostonNew JerseyUSA', N'Hoa Kỳ', N'New Jersey', N'Boston')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'OrlandoFloridaUSA', N'Hoa Kỳ', N'Florida', N'Orlando')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'San FranciscoCaliforniaUSA', N'Hoa Kỳ', N'California', N'San Francisco')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'HCMSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Tp. Hồ Chí Minh')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Nam ĐịnhNorthern VietnamVietnam', N'Việt Nam', N'Miền Bắc', N'Nam Định')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Quảng NgãiMiddle VietnamVietnam', N'Việt Nam', N'Miền Trung', N'Quảng Ngãi')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'HCMSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Tp. Hồ Chí Minh')
INSERT [dbo].[KhuvucTmp] ([makv], [quocgia], [vungmien], [thanhpho]) VALUES (N'Cần ThơSouthern VietnamVietnam', N'Việt Nam', N'Miền Nam', N'Cần Thơ')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'{AE9D7AB5-6AE7-4E53-A281-E410BE0382A0}', N'5', N'32000', N'160000', N'S0001')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'{AE9D7AB5-6AE7-4E53-A281-E410BE0382A0}', N'15', N'12000', N'180000', N'S0001')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'{AE9D7AB5-6AE7-4E53-A281-E410BE0382A0}', N'7', N'8500', N'59500', N'S0001')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{47E83D58-2957-4EFC-8B4A-81862C6D5284}', N'5', N'10500', N'52500', N'S0002')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'{47E83D58-2957-4EFC-8B4A-81862C6D5284}', N'12', N'15600', N'187200', N'S0002')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'{47E83D58-2957-4EFC-8B4A-81862C6D5284}', N'5', N'7500', N'37500', N'S0002')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{98C66E0B-1F19-406F-9387-50341F027D5D}', N'6', N'10500', N'63000', N'S0003')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{98C66E0B-1F19-406F-9387-50341F027D5D}', N'4', N'21500', N'86000', N'S0003')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{98C66E0B-1F19-406F-9387-50341F027D5D}', N'5', N'17000', N'85000', N'S0003')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH008', N'{809C097D-5C39-483A-AF68-76AEB581D357}', N'6', N'8000', N'48000', N'S0004')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Sữa đậu nành Soya', N'{809C097D-5C39-483A-AF68-76AEB581D357}', N'3', N'11000', N'33000', N'S0004')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'{2CD935FB-B467-4C62-AB55-3FB788E80A84}', N'7', N'16800', N'117600', N'S0005')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH014', N'{2CD935FB-B467-4C62-AB55-3FB788E80A84}', N'8', N'5800', N'46400', N'S0005')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{2CD935FB-B467-4C62-AB55-3FB788E80A84}', N'3', N'10500', N'31500', N'S0005')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'{BE801B26-011E-42C0-AF3A-D15874C63151}', N'7', N'12500', N'87500', N'S0006')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Solo', N'{BE801B26-011E-42C0-AF3A-D15874C63151}', N'10', N'7500', N'75000', N'S0006')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{809C097D-5C39-483A-AF68-76AEB581D357}', N'6', N'17000', N'102000', N'S0007')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'{809C097D-5C39-483A-AF68-76AEB581D357}', N'5', N'15600', N'78000', N'S0007')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'{809C097D-5C39-483A-AF68-76AEB581D357}', N'4', N'15600', N'62400', N'S0008')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Cosy', N'{809C097D-5C39-483A-AF68-76AEB581D357}', N'10', N'9000', N'90000', N'S0008')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'{4E4B8DBC-C20F-4E8F-8AEE-65828A4C6219}', N'3', N'7500', N'22500', N'S0009')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH014', N'{4E4B8DBC-C20F-4E8F-8AEE-65828A4C6219}', N'13', N'5800', N'75400', N'S0009')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH014', N'{4E4B8DBC-C20F-4E8F-8AEE-65828A4C6219}', N'13', N'5800', N'75400', N'S0009')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Custa', N'{4BBE2A3C-951F-49C4-A3D3-6670D5CCA6B1}', N'15', N'11000', N'165000', N'S0010')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{4BBE2A3C-951F-49C4-A3D3-6670D5CCA6B1}', N'4', N'38500', N'154000', N'S0010')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'{4BBE2A3C-951F-49C4-A3D3-6670D5CCA6B1}', N'6', N'14700', N'88200', N'S0010')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'{0E4CF79F-7AE4-4B4A-A153-2785CA5EEDE2}', N'6', N'12000', N'72000', N'S0011')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{0E4CF79F-7AE4-4B4A-A153-2785CA5EEDE2}', N'15', N'10500', N'157500', N'S0011')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'{FF72453D-BFF2-4150-91D3-2123B14ABEFF}', N'10', N'8500', N'85000', N'S0012')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{FF72453D-BFF2-4150-91D3-2123B14ABEFF}', N'7', N'21500', N'150500', N'S0012')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'{384D84E2-178B-4A42-B6D7-83543BCECA8B}', N'4', N'15600', N'62400', N'S0013')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'{384D84E2-178B-4A42-B6D7-83543BCECA8B}', N'10', N'7500', N'75000', N'S0013')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'{384D84E2-178B-4A42-B6D7-83543BCECA8B}', N'8', N'14700', N'117600', N'S0013')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{9D348171-95D9-4863-9956-156DC096859F}', N'15', N'10500', N'157500', N'S0014')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{FF72453D-BFF2-4150-91D3-2123B14ABEFF}', N'6', N'21500', N'129000', N'S0015')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{FF72453D-BFF2-4150-91D3-2123B14ABEFF}', N'15', N'17000', N'255000', N'S0015')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{FF72453D-BFF2-4150-91D3-2123B14ABEFF}', N'10', N'38500', N'385000', N'S0015')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'{0E4CF79F-7AE4-4B4A-A153-2785CA5EEDE2}', N'10', N'12000', N'120000', N'S0016')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH008', N'{0E4CF79F-7AE4-4B4A-A153-2785CA5EEDE2}', N'4', N'8000', N'32000', N'S0016')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Sữa đậu nành Soya', N'{384D84E2-178B-4A42-B6D7-83543BCECA8B}', N'20', N'11000', N'220000', N'S0017')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'{384D84E2-178B-4A42-B6D7-83543BCECA8B}', N'10', N'16800', N'168000', N'S0017')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Cosy', N'{1C43B291-BB3C-4415-869A-14C73A0E0AF0}', N'10', N'9000', N'90000', N'S0018')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH008', N'{1C43B291-BB3C-4415-869A-14C73A0E0AF0}', N'12', N'8000', N'96000', N'S0018')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{9D348171-95D9-4863-9956-156DC096859F}', N'30', N'10500', N'315000', N'S0019')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'{1C43B291-BB3C-4415-869A-14C73A0E0AF0}', N'14', N'12500', N'175000', N'S0020')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH008', N'{1C43B291-BB3C-4415-869A-14C73A0E0AF0}', N'10', N'8000', N'80000', N'S0020')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'{1C43B291-BB3C-4415-869A-14C73A0E0AF0}', N'12', N'17000', N'204000', N'S0020')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'{5CE59BC8-7AD1-43E3-8739-D4BB723CD3F4}', N'15', N'15600', N'234000', N'S0021')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{5CE59BC8-7AD1-43E3-8739-D4BB723CD3F4}', N'2', N'38500', N'77000', N'S0021')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Cosy', N'{5CE59BC8-7AD1-43E3-8739-D4BB723CD3F4}', N'5', N'9000', N'45000', N'S0021')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'{9FF9A2E8-6267-4741-B01B-96DA6D98994E}', N'7', N'7500', N'52500', N'S0022')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'{9FF9A2E8-6267-4741-B01B-96DA6D98994E}', N'15', N'16800', N'252000', N'S0022')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH014', N'{66AD711A-AAA2-4B0E-B4FC-815E423894C7}', N'10', N'5800', N'58000', N'S0023')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'{66AD711A-AAA2-4B0E-B4FC-815E423894C7}', N'8', N'10500', N'84000', N'S0023')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'{088DE54E-4163-4E84-8EBD-3D120EAD38B0}', N'7', N'32000', N'224000', N'S0024')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'{088DE54E-4163-4E84-8EBD-3D120EAD38B0}', N'12', N'8500', N'102000', N'S0024')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'{088DE54E-4163-4E84-8EBD-3D120EAD38B0}', N'8', N'14700', N'117600', N'S0025')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'{9FF9A2E8-6267-4741-B01B-96DA6D98994E}', N'10', N'8500', N'85000', N'S0026')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Sữa đậu nành Soya', N'{9FF9A2E8-6267-4741-B01B-96DA6D98994E}', N'20', N'11000', N'220000', N'S0026')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'{66AD711A-AAA2-4B0E-B4FC-815E423894C7}', N'15', N'21500', N'322500', N'S0027')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'{66AD711A-AAA2-4B0E-B4FC-815E423894C7}', N'3', N'32000', N'96000', N'S0027')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'{9FF9A2E8-6267-4741-B01B-96DA6D98994E}', N'11', N'32000', N'352000', N'S0028')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'{5CE59BC8-7AD1-43E3-8739-D4BB723CD3F4}', N'17', N'14700', N'249900', N'S0029')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{5CE59BC8-7AD1-43E3-8739-D4BB723CD3F4}', N'5', N'38500', N'192500', N'S0029')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'{9FF9A2E8-6267-4741-B01B-96DA6D98994E}', N'7', N'38500', N'269500', N'S0030')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'{9FF9A2E8-6267-4741-B01B-96DA6D98994E}', N'3', N'12500', N'37500', N'S0030')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'KH001', N'15', N'8500', N'127500', N'1')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Snack khoai tây Slide', N'KH001', N'3', N'14500', N'43500', N'2')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'KH005', N'15', N'18500', N'277500', N'3')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'KH002', N'12', N'12500', N'150000', N'4')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'KH011', N'20', N'23000', N'460000', N'5')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'KH001', N'12', N'8500', N'102000', N'6')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'KH001', N'5', N'14500', N'72500', N'7')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'KH014', N'15', N'34500', N'517500', N'8')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'KH005', N'2', N'19700', N'39400', N'9')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'KH003', N'8', N'10000', N'80000', N'10')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH008', N'KH004', N'3', N'17000', N'51000', N'11')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH014', N'KH012', N'15', N'6500', N'97500', N'12')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'KH003', N'11', N'9000', N'99000', N'13')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'KH010', N'5', N'23000', N'115000', N'14')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'KH014', N'5', N'25000', N'125000', N'15')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'KH015', N'9', N'15000', N'135000', N'16')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Sữa đậu nành Soya', N'KH013', N'5', N'21000', N'105000', N'17')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'KH004', N'2', N'23000', N'46000', N'18')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'KH006', N'3', N'16700', N'50100', N'19')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'KH007', N'2', N'25000', N'50000', N'20')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'KH008', N'1', N'14500', N'14500', N'21')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'KH009', N'7', N'19700', N'137900', N'22')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'KH015', N'5', N'8500', N'42500', N'23')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'KH006', N'68', N'9000', N'612000', N'24')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'KH013', N'50', N'34500', N'1725000', N'25')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'KH001', N'15', N'8500', N'127500', N'26')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH006', N'KH005', N'15', N'18500', N'277500', N'27')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bia Heineken', N'KH002', N'12', N'12500', N'150000', N'28')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'KH011', N'20', N'23000', N'460000', N'29')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'KH001', N'12', N'8500', N'102000', N'30')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'KH002', N'5', N'14500', N'72500', N'31')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'KH014', N'1', N'34500', N'34500', N'32')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'KH001', N'5', N'14500', N'72500', N'33')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'KH014', N'15', N'34500', N'517500', N'34')
GO
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'KH005', N'2', N'19700', N'39400', N'35')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'KH003', N'8', N'10000', N'80000', N'36')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH008', N'KH004', N'3', N'17000', N'51000', N'37')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH014', N'KH012', N'15', N'6500', N'97500', N'38')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'KH006', N'18', N'9000', N'162000', N'39')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Snack khoai tây O''star', N'KH004', N'25', N'5500', N'137500', N'40')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Oreo', N'KH003', N'11', N'9000', N'99000', N'41')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'KH010', N'5', N'23000', N'115000', N'42')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'KH005', N'12', N'9000', N'108000', N'43')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'KH014', N'5', N'25000', N'125000', N'44')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh Hura', N'KH015', N'9', N'15000', N'135000', N'45')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'KH014', N'7', N'25000', N'175000', N'46')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Sữa đậu nành Soya', N'KH013', N'5', N'21000', N'105000', N'47')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH009', N'KH004', N'2', N'23000', N'46000', N'48')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'0_Bánh AFC', N'KH006', N'3', N'16700', N'50100', N'49')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH013', N'KH007', N'2', N'25000', N'50000', N'50')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH015', N'KH008', N'1', N'14500', N'14500', N'51')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH004', N'KH009', N'7', N'19700', N'137900', N'52')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH001', N'KH015', N'5', N'8500', N'42500', N'53')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH002', N'KH006', N'68', N'9000', N'612000', N'54')
INSERT [dbo].[SaleDetailTmp] ([mahh], [makh], [soluong], [dongia], [thanhtien], [masale]) VALUES (N'HH003', N'KH013', N'50', N'34500', N'1725000', N'55')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ded42f49-7725-4d05-8427-01074898303f', N'Orlando Grocery', N'0a8621e0-103e-437b-832b-26f3c54c5794', N'Selena K.', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'b3d8f424-dfc7-47e1-9d20-0112a3f35f8b', N'Rainbow Grocery Store', N'809c097d-5c39-483a-af68-76aeb581d357', N'Richard S.', N'2', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'bc828c64-47ce-45f3-b9f8-02e9f54184a4', N'Cửa hàng thực phẩm số 2', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'Trần Bình Minh', N'10', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'd1108160-8a36-477c-be1a-0497f641bcd2', N'Cửa hàng thực phẩm số 3', N'9d348171-95d9-4863-9956-156dc096859f', N'Lê Mỹ Dung', N'4', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'a27b0ce8-179d-486a-bf5f-07b957a3bb66', N'Cửa hàng thực phẩm số 4', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'Nguyễn Ngọc Quỳnh', N'11', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'3cfc540a-f951-486e-8ca0-0920bf362ade', N'Cửa hàng thực phẩm số 1', N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'Nguyễn Cẩm Tú', N'10', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'66458faf-b527-4100-a043-0958d1074569', N'Cửa hàng Q.5', N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'1', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'66aca5c1-b3ae-40f7-91ef-0c1e8dd93ea8', N'Cửa hàng thực phẩm số 4', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'Nguyễn Ngọc Quỳnh', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'094a8b2a-308f-4780-a9ab-1211c2398218', N'Rainbow Grocery Store', N'809c097d-5c39-483a-af68-76aeb581d357', N'Richard S.', N'11', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'82ee7910-5623-4002-9125-12f59ea46b51', N'Cửa hàng thực phẩm số 4', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'Nguyễn Ngọc Quỳnh', N'10', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e3e8a00c-ef4c-49cf-9178-13502de8f3e6', N'Cửa hàng thực phẩm số 2', N'4e4b8dbc-c20f-4e8f-8aee-65828a4c6219', N'Nguyễn Thanh Hằng', N'5', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'6a4354ee-383e-4173-ab80-2080cff403a2', N'Cửa hàng thực phẩm số 4', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'Nguyễn Ngọc Quỳnh', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8828c90c-3475-4497-a3c8-2175b33c3f4f', N'Cửa hàng thực phẩm số 3', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'Trần Bình Minh', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'39269330-7032-4e18-bd47-234303d09c06', N'Cửa hàng thực phẩm số 4', N'74b70690-197e-4e79-aa8e-48323c9234d3', N'Huỳnh Hà Thanh', N'11', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ad8e8420-faaa-41f3-9e23-23582020d153', N'Foodie Store', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'Roger L.', N'8', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'699ca99b-5f72-4074-b59e-23bb91afadae', N'Rainbow Grocery Store', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'Justin S.', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1a0ee7d2-ddfb-44a8-8b29-24de1daabb46', N'Rainbow Grocery Store', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'Justin S.', N'4', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'35d94827-912c-4005-a36c-2b4fba31ed5f', N'Foodie Store', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'Roger L.', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8c490c68-c4c8-4ca4-a98a-2c969d93ff96', N'Cửa hàng Q.5', N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'4', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'fd8667f6-f4e2-4f0f-a2d8-2e5d33bdd565', N'Royal Blue Grocery', N'be801b26-011e-42c0-af3a-d15874c63151', N'John F.', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ca7d7e09-fc92-4d5f-ae70-30228cba35fd', N'Cửa hàng thực phẩm số 1', N'456516b7-9adb-4d06-8a09-5931efd3b566', N'Lê Anh Minh', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'f62923cf-d1e2-44ad-a94b-303d7d0b245e', N'Royal Blue Grocery', N'a736fa9b-3f66-4d42-bf5d-048a840fc567', N'Lê Thu Hương', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'073e423d-df10-4f16-a881-326b062bea97', N'Cửa hàng thực phẩm số 3', N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'Nguyễn Cẩm Tú', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'77f09a73-af97-47b4-98e1-36a2aaaae220', N'Foodie Store', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'Roger L.', N'9', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'a960ef78-dcb9-4a3a-8ad7-37da55c46573', N'Foodie Store', N'98c66e0b-1f19-406f-9387-50341f027d5d', N'Michael N.', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1f243743-f681-4ac6-9d61-3fcb23c060ef', N'Cửa hàng thực phẩm số 4', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'Trần Phương Dung', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'439c378f-f7db-4478-905b-42a0c3314639', N'Cửa hàng thực phẩm số 1', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'Trần Phương Dung', N'2', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1de050bc-954f-40b6-9d7a-4c9251d1fb3e', N'Cửa hàng thực phẩm số 3', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'Trương Tấn Khoa', N'10', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'df2d59a1-7f32-4aa4-a962-4cd57ff68f4c', N'Cửa hàng Q.10', N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'1', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e7f20f40-a92c-4356-a3fc-4daee7566c4a', N'Rainbow Grocery Store', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'Justin S.', N'4', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'88ef5d1f-98f2-4e7a-903b-4e60579d079a', N'Cửa hàng thực phẩm số 2', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'Trần Bình Minh', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'f2790540-9704-4112-a97c-5405660e5ae0', N'Cửa hàng thực phẩm số 3', N'ae39f8aa-a3a9-451f-a99b-7299f8f505e7', N'Lê Trọng Tín', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1dfc8dfd-c752-4eef-9e2b-585d91d3d014', N'Cửa hàng thực phẩm số 1', N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'Phạm Thanh Sơn', N'9', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'd3020dc0-d922-45c6-9062-5a7bc46727ee', N'Cửa hàng thực phẩm số 1', N'456516b7-9adb-4d06-8a09-5931efd3b566', N'Lê Anh Minh', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'30b2f894-b36f-4bce-b204-5c5bdaa893a3', N'Cửa hàng thực phẩm số 3', N'ae273446-5649-4736-86f9-d33d2a68a2ab', N'Nguyễn Thanh Phương', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'98d26551-16c5-4244-a927-5ef7b25c8a07', N'Cửa hàng Q.10', N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'77a030cf-f39a-4d0d-9c55-6310e6e01587', N'Cửa hàng thực phẩm số 2', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'Phan Thanh Tú', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'fe773e01-4342-487d-89ec-652cbe21fefd', N'Cửa hàng thực phẩm số 3', N'ff72453d-bff2-4150-91d3-2123b14abeff', N'Nguyễn Cao Cường', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'c4df5057-7a57-4003-b400-65862c8908cb', N'Foodie Store', N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'Roger L.', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'eda6e4e1-c3f3-4d1d-8fef-7530072657bf', N'Cửa hàng thực phẩm số 2', N'4bbe2a3c-951f-49c4-a3d3-6670d5cca6b1', N'Lê Như Quỳnh', N'6', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8088d830-5657-4d8a-921b-7cc24780fb5f', N'Cửa hàng thực phẩm số 2', N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'Lê Thanh Bình', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'bf9bbbe4-3d72-4cd5-bb64-7e369fb1ba95', N'Cửa hàng thực phẩm số 2', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'Phan Thanh Tú', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'29ae44d9-c2ee-4bb7-b011-7fd3de3a175f', N'Rainbow Grocery Store', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'Justin S.', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8f3ea6d3-00ce-41d9-88bd-843e6f48118b', N'Cửa hàng thực phẩm số 3', N'78f68a5e-aaa9-4e1a-ba97-b0aa8b4201b1', N'Phạm Ngọc Huy', N'7', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'aba262f6-74a7-4ffb-94bb-85e72f7d5c76', N'Cửa hàng thực phẩm số 3', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'Trương Tấn Khoa', N'6', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'162a878a-8622-42a3-9d7b-875a22205a5d', N'Cửa hàng Q.10', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'Christain D.', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'b4257768-3c75-479c-a81c-87bbc4d48642', N'Cửa hàng thực phẩm số 1', N'456516b7-9adb-4d06-8a09-5931efd3b566', N'Lê Anh Minh', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ecbbdf0e-95aa-4b93-89dc-8b15e8dc7b85', N'Cửa hàng Q.10', N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'1', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'06222756-a5d1-4e6c-aa48-8b9dbc3ebaf5', N'Rainbow Grocery Store', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'Justin S.', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'55c6d04c-0bf6-4c89-b28a-8ba51f5ad131', N'Royal Blue Grocery', N'a736fa9b-3f66-4d42-bf5d-048a840fc567', N'Lê Thu Hương', N'3', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'5205be29-7a96-49e0-a0cd-8bffa1d58c49', N'Cửa hàng thực phẩm số 1', N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'Phan Ngọc Đức', N'11', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ceea0c82-35ab-43f5-a192-8f63038b4374', N'Cửa hàng Q.10', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'Christain D.', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'211137ba-e008-402c-aae0-8fabd871b8f2', N'Cửa hàng thực phẩm số 1', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'Trần Phương Dung', N'2', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e4b34b3b-d144-410b-b6a2-925a62acfc45', N'Foodie Store', N'2cd935fb-b467-4c62-ab55-3fb788e80a84', N'Mick D.', N'10', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e9d9d7da-6a5a-49cf-b945-969b14e718ee', N'Cửa hàng thực phẩm số 3', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'Trương Tấn Khoa', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'7d12d88b-e7c5-4b58-86ac-987d38fef662', N'Cửa hàng thực phẩm số 4', N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'Nguyễn Ngọc Quỳnh', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'b6e1dfb1-c7b9-48e2-b0e3-9e7255d21542', N'Cửa hàng thực phẩm số 2', N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'Trần Thanh Tâm', N'9', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'000badf9-5378-4d57-9f27-9f67cda7323f', N'Cửa hàng thực phẩm số 3', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'Trương Tấn Khoa', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'61ced6d5-fa1a-43e5-b907-a0120af24803', N'Cửa hàng Q.10', N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'fe55b515-ce5c-44f4-9948-a0ede3c99f92', N'Cửa hàng thực phẩm số 4', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'Trần Phương Dung', N'5', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'1d1811ce-347c-43f2-bd02-a39e11b8fcd7', N'Orlando Grocery', N'47e83d58-2957-4efc-8b4a-81862c6d5284', N'Jane.L', N'1', N'1', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'519b4379-4a56-4b36-8274-a7ccb24f8a1f', N'Cửa hàng Q.10', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'Christain D.', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'03e5ff23-1ec4-492b-8a3f-aff18d3d033c', N'Cửa hàng thực phẩm số 3', N'ae39f8aa-a3a9-451f-a99b-7299f8f505e7', N'Lê Trọng Tín', N'12', N'4', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'c231bdac-d05f-45b9-a221-b33b952b4c68', N'Cửa hàng thực phẩm số 2', N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'Trần Thanh Tâm', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'7e3ebbf1-acb4-408b-bf42-b9e3f28eacf4', N'Cửa hàng thực phẩm số 1', N'088de54e-4163-4e84-8ebd-3d120ead38b0', N'Lê Thành Tài', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'75fa6314-ee29-4f2b-a137-be75fbce8744', N'Cửa hàng thực phẩm số 1', N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'Trần Bình Minh', N'8', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'ac6da2fa-c376-4d3b-9c68-c25bbf1ced91', N'Cửa hàng thực phẩm số 4', N'74b70690-197e-4e79-aa8e-48323c9234d3', N'Huỳnh Hà Thanh', N'11', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'5d8f6d92-0c3c-47ba-a0b8-c7085f9313c4', N'Cửa hàng Q.10', N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'Christain D.', N'7', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'710966d4-4bd1-4605-a6dd-cec93a35b364', N'Royal Blue Grocery', N'ae9d7ab5-6ae7-4e53-a281-e410be0382a0', N'Katerine.M', N'8', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'61243f31-6b49-4a86-8879-cecf3f239274', N'Royal Blue Grocery', N'49acec59-5128-44e8-a98a-b482d92af9fe', N'Justin S.', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'8915a4fe-107e-4cd1-8181-d0e3b7ccdf08', N'Cửa hàng thực phẩm số 4', N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'Trần Phương Dung', N'5', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e0d64a40-03f3-4125-821f-d8c8b087c76e', N'Cửa hàng thực phẩm số 3', N'78f68a5e-aaa9-4e1a-ba97-b0aa8b4201b1', N'Phạm Ngọc Huy', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'4d8b4a4c-7d0b-4ffd-8c44-d9ee1b288342', N'Cửa hàng thực phẩm số 1', N'088de54e-4163-4e84-8ebd-3d120ead38b0', N'Lê Thành Tài', N'6', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'dbe3b9db-d8fd-4292-8536-da6038af01cb', N'Cửa hàng thực phẩm số 3', N'ae273446-5649-4736-86f9-d33d2a68a2ab', N'Nguyễn Thanh Phương', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'a2d4bf6d-a3f9-497b-805b-dbb7c3bdedb3', N'Cửa hàng thực phẩm số 2', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'Phan Thanh Tú', N'7', N'3', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'354ae10e-4b9e-47f5-8fa9-dfb72710fd84', N'Cửa hàng thực phẩm số 2', N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'Phạm Thanh Sơn', N'3', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'e1ec78cf-f5f3-41f0-a560-e3d97316f9ef', N'Cửa hàng thực phẩm số 2', N'0d0bc631-347d-4b1c-947e-2206a174152d', N'Phan Thanh Tú', N'5', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'cb2036d2-0e33-45f1-a315-e7e31ae54a22', N'Cửa hàng thực phẩm số 3', N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'Trương Tấn Khoa', N'9', N'3', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'3d452314-2597-4dde-955c-e99c15363821', N'Cửa hàng thực phẩm số 1', N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'Lê Thanh Bình', N'1', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'fa1414c5-c39e-477f-9ffd-eb44d9071718', N'Cửa hàng thực phẩm số 1', N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'Phan Ngọc Đức', N'2', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'06a80f77-7221-4082-948b-eb7907db5c7c', N'Cửa hàng thực phẩm số 3', N'ff72453d-bff2-4150-91d3-2123b14abeff', N'Nguyễn Cao Cường', N'1', N'1', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'5baef3dd-938a-412b-9ea6-f897aa7d705d', N'Cửa hàng thực phẩm số 2', N'9d348171-95d9-4863-9956-156dc096859f', N'Lê Mỹ Dung', N'12', N'4', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'317176fe-5edd-4695-83ab-fae38733976d', N'Orlando Grocery', N'0a8621e0-103e-437b-832b-26f3c54c5794', N'Selena K.', N'6', N'2', N'2013')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'3f8d3275-684f-4feb-8e8e-fc97de1661c7', N'Cửa hàng Q.5', N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'4', N'2', N'2014')
INSERT [dbo].[tbBanhang] ([id], [tench], [makh], [tenkh], [thang], [quy], [nam]) VALUES (N'0a9348ba-0cb1-4222-a34e-fe8dfd0d4f79', N'Rainbow Grocery Store', N'809c097d-5c39-483a-af68-76aeb581d357', N'Richard S.', N'11', N'4', N'2013')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'12', N'17000', N'204000', N'0ccfb41b-a3e1-4c47-9e03-008cf1349beb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'5', N'14500', N'72500', N'4800d870-1575-40c4-bfd0-0119fb5aa8b3')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'10', N'9000', N'90000', N'ee203765-27df-4ff3-83d7-016d838a0b20')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'15', N'10500', N'157500', N'26e56917-4156-49e9-8b13-08750af7b8d2')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'12', N'8000', N'96000', N'83256f86-d64c-432c-b1a7-0a5e9c146ae2')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'12', N'12500', N'150000', N'bb045e92-fb1e-47e3-adb5-0b266bb02402')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'8', N'14700', N'117600', N'157bb951-da33-4e9c-8a21-0c2ec5f3ac0a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'15', N'21500', N'322500', N'6b1ff647-ee3d-4b72-b214-0e1ab0f482f1')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'10', N'8500', N'85000', N'a26d3832-cd6e-444f-984d-1004db801303')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'11', N'32000', N'352000', N'8b5d0872-f9b3-4ed0-aa63-1096e8908472')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'7', N'16800', N'117600', N'5502f8ed-8890-4667-9691-1272f7c31cb3')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'10', N'12000', N'120000', N'3456ba64-8c7b-4456-bd19-1369bcbd0b8a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'15', N'6500', N'97500', N'd8410abe-c080-447e-b957-13d9d3bb5bdd')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'788ecb59-49de-4e38-9c31-c2d1177ff438', N'15', N'11000', N'165000', N'74759626-53fd-4d31-941f-175b6788ce63')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'5', N'15600', N'78000', N'd33c2670-aeb4-460d-9f9f-1794c96aca8e')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'5', N'14500', N'72500', N'7ad746ad-f848-4992-81a0-1ada14a29ca1')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'7', N'7500', N'52500', N'ed971ad7-cbff-41dc-86e7-1cb541e0ae88')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'7', N'12500', N'87500', N'991b6deb-0a23-4149-b29c-2168f55a6351')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'2', N'38500', N'77000', N'a69191c5-0f7a-4839-a333-21c9a554fe67')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'15', N'16800', N'252000', N'72fd4f49-6313-42de-b7fb-237c10719348')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'3', N'10500', N'31500', N'a3028ff4-6cf0-4af2-a56e-248afd7c0df7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'15', N'18500', N'277500', N'8e552997-1aaf-461f-b532-25113ffba8bf')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'14', N'12500', N'175000', N'77bd8fea-face-4540-9d1c-27dc275143a7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'15', N'6500', N'97500', N'90b5d2d2-d296-46d8-8205-281db58b5884')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'6', N'21500', N'129000', N'e7cd58b1-054d-4608-886b-2c40f720045a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'1', N'14500', N'14500', N'03cd757a-2b56-4cd1-b0b8-2c8f85f4aeb0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'20', N'11000', N'220000', N'8686c90b-b6af-4efa-ad2f-2e4e211c21c6')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'20', N'23000', N'460000', N'3ec76523-850d-457b-b729-2f7dff1f0454')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'5', N'23000', N'115000', N'56bd8f6e-8bb8-4857-8dbf-397ae226f300')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'2', N'23000', N'46000', N'b3bf1e0e-18e0-460f-9b89-4365f185a066')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'8', N'10000', N'80000', N'985c9d33-040d-435b-a920-44ac85ccec80')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'3', N'32000', N'96000', N'ea2a7097-0857-4ddc-ac37-472659df6994')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'12', N'12500', N'150000', N'c1e7d5cd-02c7-4b41-8efe-4811db8d56ef')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'3', N'17000', N'51000', N'b5a41811-2012-45db-9f13-49124688f0be')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'12', N'9000', N'108000', N'ce0307d8-3194-4f72-8d88-49ab2fabb079')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'15', N'10500', N'157500', N'a0d98c00-30b9-4355-8362-4c9219ff778f')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'7', N'21500', N'150500', N'55d4160b-f8db-453f-b2c1-4dc7d0a6e36a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'3', N'16700', N'50100', N'5cbb4dbf-feb0-4db7-ae52-4f394c0e504f')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'5', N'9000', N'45000', N'659ddda9-4ea4-4d15-a424-5122d0e0519c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'12', N'15600', N'187200', N'f80cb2e7-8c76-4db2-9903-51645ea8da00')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'5', N'14500', N'72500', N'bc5e2d5a-8442-444c-af36-5607c6c7ee87')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'15', N'17000', N'255000', N'faaa3908-8e5c-484e-8eb4-587119592c59')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'68', N'9000', N'612000', N'8bae8fdf-09f4-4240-8442-5981e0fb76de')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'7', N'19700', N'137900', N'da2db58c-90e3-40d2-85ed-5c48e8d52388')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'10', N'5800', N'58000', N'bf218e24-235f-492f-b496-5d3d3c81f566')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'103ee851-a6ae-4805-bed3-8be1b8d7c776', N'25', N'5500', N'137500', N'08433624-c382-4194-836d-5dbf8e9c8f6c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'7', N'25000', N'175000', N'2f323ef7-2ef0-4602-8ea2-5deb27075d22')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'17', N'14700', N'249900', N'7ac8dceb-5ac9-4bb0-90ee-5e098bb92482')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'2', N'19700', N'39400', N'b50cc429-e316-45d6-9d01-5e0cc0055ef0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'15', N'15600', N'234000', N'7ca8bae2-e683-4121-b053-5ef6be37a151')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'5', N'25000', N'125000', N'b4446f07-dfd5-4766-a5a8-6049a0842d1e')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'05ce8659-369b-45ac-ac71-3ffe3abc68bc', N'3', N'14500', N'43500', N'27db80df-dd3c-479d-99b2-60f486a649c5')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'15', N'34500', N'517500', N'ca26620e-b51d-4340-a62e-65bbc376584d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'4', N'15600', N'62400', N'e2da0117-cf44-402f-9f00-65fe7fcaa5d6')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'11', N'9000', N'99000', N'd496c796-4568-48e5-8f67-6c5305d7f0a7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'50', N'34500', N'1725000', N'e8280ead-6a7c-4ad2-98cc-6e094bf3fff3')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'2', N'19700', N'39400', N'83b4c118-defc-4316-b373-71617dcb34fe')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'11', N'9000', N'99000', N'dd60427e-4f42-435b-acd6-778af2b829d3')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'10', N'9000', N'90000', N'82cbcb38-365e-427e-a977-77d2117a9d09')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'8', N'10000', N'80000', N'8d677fff-787a-45f3-bb76-7838c92dc21e')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'7', N'8500', N'59500', N'c95db28a-d8ff-4086-b471-791205883b65')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'10', N'7500', N'75000', N'4db3b6bd-85a0-4607-9097-7b83e9372862')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'9', N'15000', N'135000', N'683e293e-f658-4a59-b233-7d9692e29e83')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'8', N'5800', N'46400', N'579d40b3-a8aa-422c-bd12-7e4b643fef17')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'6', N'14700', N'88200', N'99aeb955-d28d-4291-9226-7e5071132e7a')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'3', N'16700', N'50100', N'd0ab2ea8-95f9-405b-9650-7ed1371f8074')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'4', N'8000', N'32000', N'83c9356f-d495-4985-b975-807a531ddf8d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'15', N'34500', N'517500', N'd109d592-28d3-41b1-91be-885d9858dcfd')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'20', N'11000', N'220000', N'987b1053-734e-42cf-b500-88e6ddc58fb3')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'12', N'8500', N'102000', N'b4091fb4-1042-4d37-918f-8a6c5d80cf52')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'2', N'23000', N'46000', N'c1bff36a-1f74-4de5-97f9-8ce9a4cf294e')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'6', N'10500', N'63000', N'f3e681e2-a407-495c-bacd-92c7112ebcf7')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'20', N'23000', N'460000', N'5a474a6b-3214-4c30-a187-94129a4aad34')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'8', N'14700', N'117600', N'8c95abf1-33c0-4145-9595-949f59baa82c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'3', N'7500', N'22500', N'900d0adf-a277-442c-8d46-9ba7cb2e2b3d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'15', N'8500', N'127500', N'e8d0dffb-455a-4338-9af8-9cca92afe1e4')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'1', N'14500', N'14500', N'da11d07a-a593-40a4-ae25-9e55722f9fe9')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'5', N'25000', N'125000', N'e6fa2a93-efdc-4fff-96b0-a016bbbfda40')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'10', N'38500', N'385000', N'e5883dee-1fa2-47a9-ba01-a0a6817cc5cc')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'15', N'18500', N'277500', N'7cc59a82-10f3-464a-ab15-a0f24a58926e')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'4', N'21500', N'86000', N'fa2b74d3-7d65-473f-a896-a153f2502b2d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'13', N'5800', N'75400', N'c6b682a8-2149-4063-8908-a32539bbffac')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'5', N'17000', N'85000', N'5a1dc668-3006-4d19-8606-a501023dc6bc')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'5', N'23000', N'115000', N'55906200-e095-4692-84c2-a5092d29f5a4')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'18', N'9000', N'162000', N'b294f677-00e4-46dc-b83d-a8d541b9bc53')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'10', N'16800', N'168000', N'48cbf146-6363-4d9e-a943-aac1219198de')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'5', N'10500', N'52500', N'43d26051-0366-4b43-b577-ae05a4e8548b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'5', N'21000', N'105000', N'8769081c-41de-4312-b32e-ae112485ee0d')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'3', N'17000', N'51000', N'803d9225-3a1b-4844-b277-b385cc6a7ce8')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'2', N'25000', N'50000', N'd8af43c7-b7ab-4e9b-bb3c-b44ee5755469')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'6', N'8000', N'48000', N'd78f90d5-f224-46be-aee6-b4f3eb9bcf5c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'5', N'7500', N'37500', N'b45793ec-e5f2-4f3a-8e5d-b55407653e53')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'7', N'19700', N'137900', N'83c0ed94-ebb5-4235-858a-bade8be73f13')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'12', N'8500', N'102000', N'596be604-639a-46f8-b83c-bd0fc92072ec')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'5', N'8500', N'42500', N'52f8c745-9366-47b3-8f83-bd6b587cee2b')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'30', N'10500', N'315000', N'93960d92-0311-4ecb-88ef-c2b7b73656ee')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'296dec25-6419-4a5b-b9f9-0391743777ab', N'10', N'7500', N'75000', N'f09d6742-f05d-4f0a-ab86-c7b0457e23de')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'15', N'8500', N'127500', N'd6d9e878-0cd3-4f4e-807d-c814120029f3')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'12', N'8500', N'102000', N'2f489408-e535-4cc4-a3ef-c8c2c05b93cb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'5', N'8500', N'42500', N'74412703-a097-4c03-a049-cd806405bd95')
GO
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'3', N'11000', N'33000', N'f5d4d12b-e4a7-49bb-b016-d16eb3294d75')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'1', N'34500', N'34500', N'4833f60b-a34d-43b8-8907-d1a2bc268d8f')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'3', N'12500', N'37500', N'c02ebba0-7a20-4d61-9210-d1fedef3942c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'4', N'15600', N'62400', N'7fe70b28-6d97-4ae4-958b-d56c6695ba1e')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'9', N'15000', N'135000', N'be358498-badb-4ec9-89a3-d6196a7a37ad')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'15', N'12000', N'180000', N'b174edee-f67f-4b5e-8778-d65c06952d38')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'5', N'32000', N'160000', N'e3f83422-f8be-4b46-88e3-d6732e635a43')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'7', N'32000', N'224000', N'2ce18e5f-53ac-4a09-bcab-d7a6c0712ec8')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'7', N'38500', N'269500', N'50a34c05-60ac-4b1a-bf25-e0f3696e70fb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'4', N'38500', N'154000', N'4e78c62d-0556-4802-a407-e20253ebc50c')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'10', N'8000', N'80000', N'51e27ab2-1889-4d0f-a306-e387d67e5d92')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'6', N'12000', N'72000', N'41ccebfd-b814-4475-9568-e6888d1e10c9')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'13', N'5800', N'75400', N'453f59f3-0dc9-49df-97a1-e95b9d07cb42')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'10', N'8500', N'85000', N'23792dfb-7233-45cf-9e50-ec79791e50d0')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'8', N'10500', N'84000', N'a3dc21ac-7016-4848-95be-efdb5f96b694')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'5', N'21000', N'105000', N'aac32744-f5d8-491e-8102-f40e1393be61')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'6', N'17000', N'102000', N'07f6c788-d30e-47ba-93c4-f5a0c0d0d3eb')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'5', N'38500', N'192500', N'7e6980d7-c6cc-4202-865f-f5e766b984ca')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'2', N'25000', N'50000', N'60788b58-0172-46e4-a268-f6db0f6e3e40')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'50', N'34500', N'1725000', N'41c67bcc-1d31-4a40-9034-fb0b2e940e14')
INSERT [dbo].[tbChitietBanhang] ([mahh], [soluong], [dongia], [thanhtien], [saledetailid]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'68', N'9000', N'612000', N'5504404d-2074-4475-bb0a-febe29bf64ad')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'296dec25-6419-4a5b-b9f9-0391743777ab', N'0_Bánh Solo', N'Bánh Solo', N'0_Bánh kẹo', N'Bánh Solo khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'b717e9da-91ec-498e-be4d-30bb709317a1', N'HH008', N'Pepsi', N'Nước giải khát', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'10115bf6-8074-4d1e-a9dc-33e423baf5a6', N'HH004', N'Dầu ăn Tường An', N'Dầu ăn', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'bf7a17d4-183e-4223-9a91-3bf5d65951ba', N'HH009', N'Cam ép Twister', N'Nước giải khát', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'05ce8659-369b-45ac-ac71-3ffe3abc68bc', N'0_Snack khoai tây Slide', N'Snack khoai tây Slide', N'0_Bánh kẹo', N'Snack khoai tây Slidekhông tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'aaaed83f-6e24-4083-90a4-40250e9c9a46', N'HH006', N'Dầu ăn Neptune', N'Dầu ăn', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'5062109d-9b4d-4a04-b44b-5b6e3ce9b027', N'HH002', N'Coca cola', N'Nước giải khát', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'da921c55-0926-40d0-be43-6d28db0becfc', N'0_Bia Heineken', N'Bia Heineken', N'0_Nước ngọt', N'Bia Heineken khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'029d4e62-cd4c-4dfb-8e98-7b7d415a7b06', N'HH003', N'Bánh ChocoPie', N'Bánh kẹo', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'5fb0eff7-1613-4598-93c2-7e24d55853f4', N'0_Bánh Oreo', N'Bánh Oreo', N'0_Bánh kẹo', N'Bánh Oreo khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'103ee851-a6ae-4805-bed3-8be1b8d7c776', N'0_Snack khoai tây O''star', N'Snack khoai tây O''star', N'0_Bánh kẹo', N'Snack khoai tây O''starkhông tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'a6b4ae0b-1e99-4ee8-8c0c-953dd4197cbe', N'0_Bánh Hura', N'Bánh Hura', N'0_Bánh kẹo', N'Bánh Hura khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'12825d17-ee17-4b23-bb11-9994163024b4', N'HH015', N'Kẹo Golia', N'Bánh kẹo', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'f77bbb5f-0a89-47b8-acbf-a57f5c6943d4', N'HH014', N'Kẹo Alpenliebe', N'Bánh kẹo', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'17018c7c-30bc-4691-9378-aee35f2d5bfd', N'0_Bánh AFC', N'Bánh AFC', N'0_Bánh kẹo', N'Bánh AFC khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'14b48ffd-7339-4cd9-beb5-b934ed3c6346', N'HH013', N'Bánh Goute', N'Bánh kẹo', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'788ecb59-49de-4e38-9c31-c2d1177ff438', N'0_Bánh Custa', N'Bánh Custa', N'0_Bánh kẹo', N'Bánh Custa khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'521c1e74-3956-442a-b98c-d0a0dbefb1f7', N'0_Sữa đậu nành Soya', N'Sữa đậu nành Soya', N'0_Nước ngọt', N'Sữa đậu nành Soya khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'63db44a8-8d67-49f3-85a9-d699c754d75f', N'0_Bánh Cosy', N'Bánh Cosy', N'0_Bánh kẹo', N'Bánh Cosy khong co trong danh muc')
INSERT [dbo].[tbHanghoa] ([id], [mahh], [tenhh], [chungloai], [ghichu]) VALUES (N'fb5e019d-b464-46b0-8c4d-fd81f7345d8c', N'HH001', N'Trà xanh O2', N'Nước giải khát', N'hàng hóa đã tồn tại')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'a736fa9b-3f66-4d42-bf5d-048a840fc567', N'Lê Thu Hương', N'Nữ', N'df2b289d-8088-4117-9f95-6d154241a511')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'1c43b291-bb3c-4415-869a-14c73a0e0af0', N'Nguyễn Cẩm Tú', N'Nữ', N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'9d348171-95d9-4863-9956-156dc096859f', N'Lê Mỹ Dung', N'Nữ', N'32173f1a-dac5-4189-b863-49b6df6cbf16')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'ff72453d-bff2-4150-91d3-2123b14abeff', N'Nguyễn Cao Cường', N'Nam', N'419bec55-bb9d-4262-a607-d393ba3d4e1d')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'0d0bc631-347d-4b1c-947e-2206a174152d', N'Phan Thanh Tú', N'Nam', N'acfd9937-2731-4939-8c3c-e89d117658ef')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'0a8621e0-103e-437b-832b-26f3c54c5794', N'Selena K.', N'Nữ', N'9f37416b-9776-47d8-831b-2ff950b0e5ca')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'0e4cf79f-7ae4-4b4a-a153-2785ca5eede2', N'Lê Thanh Bình', N'Nam', N'9b46d377-93fa-47e3-b290-97cb5d3f9509')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'088de54e-4163-4e84-8ebd-3d120ead38b0', N'Lê Thành Tài', N'Nam', N'309ceae6-2fd3-4cdf-a908-32b9ea6eb0c2')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'2cd935fb-b467-4c62-ab55-3fb788e80a84', N'Mick D.', N'Nam', N'9abb1193-8ff1-4282-b25b-3c56812ed1f0')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'28615e68-6b91-4dbb-a589-4024b57cf5b5', N'Christain D.', N'Nam', N'a5f5eb6c-36cf-464e-87b5-7cd0cffeb854')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'74b70690-197e-4e79-aa8e-48323c9234d3', N'Huỳnh Hà Thanh', N'Nữ', N'c2ef1581-d062-4390-b6a8-e93d0ac397dd')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'98c66e0b-1f19-406f-9387-50341f027d5d', N'Michael N.', N'Nam', N'7bd9ac38-0467-4f04-8320-e3b73e1b6895')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'5db6dae7-bc2e-45b3-ac79-5258331838fc', N'Roger L.', N'Nam', N'8eef93dd-ba49-4e23-8887-3dc0afb2292b')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'456516b7-9adb-4d06-8a09-5931efd3b566', N'Lê Anh Minh', N'Nam', N'29f1f733-19f6-4c8b-9601-d165e8347ec7')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'4e4b8dbc-c20f-4e8f-8aee-65828a4c6219', N'Nguyễn Thanh Hằng', N'Nữ', N'9b46d377-93fa-47e3-b290-97cb5d3f9509')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'4bbe2a3c-951f-49c4-a3d3-6670d5cca6b1', N'Lê Như Quỳnh', N'Nữ', N'02f8c709-97a8-49d2-b135-092bbad24b77')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'ae39f8aa-a3a9-451f-a99b-7299f8f505e7', N'Lê Trọng Tín', N'Nam', N'498f39a6-9e54-461b-8026-9cc4018b0094')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'809c097d-5c39-483a-af68-76aeb581d357', N'Richard S.', N'Nam', N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'66ad711a-aaa2-4b0e-b4fc-815e423894c7', N'Trần Thanh Tâm', N'Nữ', N'b5b3a14c-ffcd-4f91-8a52-15dd9656a35e')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'47e83d58-2957-4efc-8b4a-81862c6d5284', N'Jane.L', N'Nữ', N'291d829c-a289-4c56-adce-a39258c3b32f')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'384d84e2-178b-4a42-b6d7-83543bceca8b', N'Phạm Thanh Sơn', N'Nam', N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'6172aa21-fe78-4474-8cca-8f6199d2316f', N'Trần Phương Dung', N'Nữ', N'a84cd236-e668-4e23-a72a-c006eb70e3dc')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'9ff9a2e8-6267-4741-b01b-96da6d98994e', N'Trần Bình Minh', N'Nam', N'ff87abe1-1474-47bb-8a91-7d5338edc27f')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'9db37eee-65c0-4559-9960-986bedfb878c', N'Trịnh Thanh Sang', N'Nam', N'df2b289d-8088-4117-9f95-6d154241a511')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'78f68a5e-aaa9-4e1a-ba97-b0aa8b4201b1', N'Phạm Ngọc Huy', N'Nam', N'631f47b8-4ee4-4d05-a3e9-a28fd7e9a880')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'49acec59-5128-44e8-a98a-b482d92af9fe', N'Justin S.', N'Nam', N'178bc0e5-2397-425c-b383-c2b36e447d02')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'be801b26-011e-42c0-af3a-d15874c63151', N'John F.', N'Nam', N'291d829c-a289-4c56-adce-a39258c3b32f')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'ae273446-5649-4736-86f9-d33d2a68a2ab', N'Nguyễn Thanh Phương', N'Nữ', N'6a7f496f-a6c3-4426-9be8-76078024e372')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'5ce59bc8-7ad1-43e3-8739-d4bb723cd3f4', N'Phan Ngọc Đức', N'Nam', N'257f585d-ea5d-4391-8e4b-890bbabec556')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'ae9d7ab5-6ae7-4e53-a281-e410be0382a0', N'Katerine.M', N'Nữ', N'7bd9ac38-0467-4f04-8320-e3b73e1b6895')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'8264a7b0-7168-4a46-a6e0-e5a51819f5e4', N'Nguyễn Ngọc Quỳnh', N'Nữ', N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a')
INSERT [dbo].[tbKhachhang] ([id], [tenkh], [phai], [makv]) VALUES (N'a78391d0-2d6d-4696-8779-ea74fb254e85', N'Trương Tấn Khoa', N'Nam', N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'291d829c-a289-4c56-adce-a39258c3b32f', N'Austin', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'309ceae6-2fd3-4cdf-a908-32b9ea6eb0c2', N'Bình Dương', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'e7c0c772-a3a0-450c-a31c-bd2431dd3c6e', N'Boston', N'Hoa Kỳ', N'New Jersey')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'419bec55-bb9d-4262-a607-d393ba3d4e1d', N'Cần Thơ', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'ff87abe1-1474-47bb-8a91-7d5338edc27f', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'4dc1d089-5bdb-4f56-9c80-1cf6e4953a5e', N'Đồng Nai', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'32173f1a-dac5-4189-b863-49b6df6cbf16', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'b5b3a14c-ffcd-4f91-8a52-15dd9656a35e', N'Hải Phòng', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'9b46d377-93fa-47e3-b290-97cb5d3f9509', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'257f585d-ea5d-4391-8e4b-890bbabec556', N'Huế', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'df2b289d-8088-4117-9f95-6d154241a511', N'Tp. Hồ Chí Minh', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'29f1f733-19f6-4c8b-9601-d165e8347ec7', N'Bến Tre', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'acfd9937-2731-4939-8c3c-e89d117658ef', N'Kiên Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'ba3ccff9-75a3-4e89-b66e-29f7e2b4358d', N'Tiền Giang', N'Việt Nam', N'Miền Nam')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'a84cd236-e668-4e23-a72a-c006eb70e3dc', N'Tp. Hà Nội', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'9bd788f2-acb7-4d68-9429-9c5a0021ee5a', N'Ninh Bình', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'c2ef1581-d062-4390-b6a8-e93d0ac397dd', N'Hải Dương', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'498f39a6-9e54-461b-8026-9cc4018b0094', N'Tp.Đà Nẵng', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'6a7f496f-a6c3-4426-9be8-76078024e372', N'Quảng Trị', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'631f47b8-4ee4-4d05-a3e9-a28fd7e9a880', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'9f37416b-9776-47d8-831b-2ff950b0e5ca', N'Chicago', N'Hoa Kỳ', N'Illinois')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'8eef93dd-ba49-4e23-8887-3dc0afb2292b', N'San Antonio', N'Hoa Kỳ', N'Texas')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'178bc0e5-2397-425c-b383-c2b36e447d02', N'Columbus', N'Hoa Kỳ', N'Ohio')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'a5f5eb6c-36cf-464e-87b5-7cd0cffeb854', N'Atlanta', N'Hoa Kỳ', N'Georgia')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'02f8c709-97a8-49d2-b135-092bbad24b77', N'Nam Định', N'Việt Nam', N'Miền Bắc')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'7bd9ac38-0467-4f04-8320-e3b73e1b6895', N'Orlando', N'Hoa Kỳ', N'Florida')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'566b5bef-a025-4ef4-b1b8-5bcd3f956d7f', N'Quảng Ngãi', N'Việt Nam', N'Miền Trung')
INSERT [dbo].[tbKhuvuc] ([id], [thanhpho], [quocgia], [vungmien]) VALUES (N'9abb1193-8ff1-4282-b25b-3c56812ed1f0', N'San Francisco', N'Hoa Kỳ', N'California')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'8d3a1e2a-eac3-4a36-8912-016532c406dc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'038bb1cf-5098-4daa-99cf-016ef34eba70')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'f0ae9d8f-c0dd-4b8a-8743-01a28aa17737')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'07fc968e-e2e7-4c69-b0f2-01e009524419')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'a41effd0-147b-449f-b55d-04665844b87e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'77eb6f46-e4d1-48ad-b1e1-047e2b08533d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e7e37ddf-2971-4fcc-8377-051ad2725554')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'2e6e8250-a983-4f6d-ae7c-05e6d8e4bf27')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'ef059dfc-7215-492f-a235-063a1017b872')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0c8b611c-99b1-4afb-b337-0753063512e8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'dcd0d6e5-d23d-41ca-ba5f-08e31928c083')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'95be05c6-8936-42da-ba38-0a0a1bd23d92')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'4cf9ccd5-11ac-4f14-b630-0ac9dc08c9be')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'c73cdc2b-b43c-4d9e-9162-0c7aee2d4a7d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'4a6baa7d-1c49-40da-9667-0d0222121068')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'834a53b1-05a2-4c2a-9005-0dea6e2a5a05')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'86b39573-a8a9-4ebf-92e8-0df7693ef00a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'a9410e40-f21e-4fad-a37f-0f26c5fe03eb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'c09a6de3-80a6-48a7-b6cc-0f42c4d16048')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'f36bc602-7142-4b1d-bd65-0fd0c9c2f421')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'aef781e4-7631-4d7a-bcda-156857dabced')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'124d6f1d-b71f-4736-8736-16bca91517ce')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'de70e0df-59a1-4f67-9901-17641cafc1d1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'cfc900b1-f2af-4999-b658-17f6a90c77da')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'ad026cb2-646e-4816-ac8e-18544aa86ae6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'9292e952-84c4-4ea4-8fd7-1d1bf059317c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'37796d93-4c4d-41e1-846e-1dad6ccd187b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'43a78b86-3d67-4cbf-8f55-1e564bc0ced0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'0f2674bc-7de4-40be-878e-1f157e453b8d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'ce46750c-41f5-4ea7-984b-1f3a76c0d4d7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'a987bdfe-1f29-4cb1-8118-2132b72bb353')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e41732b6-cc9e-4b34-a7d8-23efdcb1274d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'7f1efd3c-7f1f-4e89-a688-2400201e451f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e4837ce2-0d1a-4252-b25c-243823900745')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'fd3bd28f-ffbe-4ed5-b2ec-246a996d1c5f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'dfeea4b0-de28-4740-b8e0-24d860fb4f18')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'e45a99e1-48ae-4cea-abb6-2514f42a0d67')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'20758f94-9980-4c33-a03a-25530017454d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'd7fc8974-1cf4-474b-92ea-25daf074b4a6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'c88763a9-61a8-476f-9113-29655c0f3abc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'858995d8-8352-4850-b504-297934407021')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'26970732-51d7-445e-830e-29f7ce415630')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1573d13e-26e7-4e44-9e71-2a12e1fc5336')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'73ed2a3e-4be2-4ebf-8434-2a7532fc3774')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'e6fe29f8-dafb-47a7-99aa-2b31d52bf897')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'28706f24-419c-4676-a3f5-2b64af156e4f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'a280cecd-a891-49f6-ba48-2c7a29dd9597')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'7abd75a5-82a5-49dc-b469-2d2aa3150fbf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'40e19385-fae8-4e32-a451-2e24781b74ef')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'01a7b00a-f6cf-42c3-84a3-2ee24980c9df')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'4048d578-5d36-4bd9-8268-2ee82573b6d8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'dc4ca625-b5da-4105-91e9-31797ce98a24')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'c6fb4e14-56ec-4685-b7a4-3202a0db1757')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'20c323ca-2d39-454e-83ff-33184a4d96f9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd8b1033d-a136-471e-b832-3403be6cbede')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'e8dfd0c1-cd27-4853-8c92-34d1568a652f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2c3257e1-2e92-4ad7-8f57-38848a16b7b5')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b65a553-f08e-450f-92c1-38e6b68015bb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'd660f922-dc5f-4fcc-bc0a-3950d35a2cbc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'83c71286-5e0a-4ba7-8ffb-3c0fe634aef7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'54dfd49c-8f1b-4ca6-8af9-3c13e9ce9fd0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'c82eca76-6789-411c-82c7-3ddb59810a99')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'5ae1f92d-fb28-4817-b607-3f4b523f6127')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'bb043825-4f77-403e-8687-3f609fbc6cf1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'af44fd4d-942a-4a73-ae0e-406a67e79b86')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'8c1071ab-659e-44df-89c2-4332afad58c8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'6242709c-5f1e-4900-b2c9-44922e86cb5b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'eecc4cd5-6c7a-487b-bb19-45b1aa53ba12')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'2c47f744-572e-48f6-93d6-46437aaa9b37')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'0d60300d-a5d6-449a-9ee3-47066ce69c89')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'84c6c176-7996-401b-bfd9-478772f4eb5b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'fbec1ec7-a677-4cf8-badf-478fadfbcd96')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'48c5873f-93b6-4019-96cd-47abfae73de3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'e06adeff-85b5-4d8d-915c-47f9cf46a8ad')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'7dbc36bf-f175-49e5-b23f-4b3a8065a426')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'e31263ec-4fc3-44e2-95b5-4eb7547c1db3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'8b66dff1-ecf4-4e28-8546-53bde63c4d80')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'a6439344-c1ca-463a-8989-552b42e3fc1f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'aff650df-9edd-40c8-b360-55b6f4b2770a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd7e735fe-3621-4ec2-9276-58de05708119')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'3947ef44-5679-45ec-84c7-603c29368514')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'71aaee71-17d4-4a83-a7ec-65028b3b3029')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'32349857-fa87-4040-a19d-658605158aa2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'de897daa-e13b-488e-8ada-678d04a05930')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'8ad2af2f-c3d6-4eee-9666-67b595c3fc60')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'97c03748-1973-41d5-ac23-6854ebc1f553')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'88a1c28d-49b1-4873-81e9-699b587a4548')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'8d554208-5aa0-4d4b-bb8d-6d9666b6256a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'ac6ce44c-7b46-4f21-ad65-6f55cc98a5e9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'c8eef8b4-47d3-4a93-85f1-70ebe9c8197a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'bee10db2-a28a-4966-a860-710a6cd755c6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0d6d5aed-79b6-4887-b376-71ea0b1bd225')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'92777e41-6e9b-40e7-a37b-71f0cb1f4946')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'0cf6a437-8c53-4920-a45a-71fd3f00f57a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'7a23af5a-249a-4b8d-bf7e-720e6c294004')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'1300ff2c-ca2f-4b6f-b065-72924d3318e4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'62c2fcae-c7ad-4081-ade2-72f96195b426')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'61520925-e8ec-46f2-b5df-73c595240674')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'067c7f3d-ef84-47fc-8401-7454807a8bf1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'c43403e6-a074-4534-8f5e-746fbe8f7cf8')
GO
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'2b7c3b71-f013-4282-81ed-76ced7dce80f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'9dc2614d-f7e4-44b4-b574-77ec89fdab65')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'd9d65462-4cfa-4ac0-8f2a-7807743e87ac')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'72281558-32d6-48d6-8989-7874809f326a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'418f723a-4e9c-42db-adfb-797b9fcbc013')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'9ccf1188-02e1-4f3d-9d82-7a5bcfdfe291')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'41c132b0-670d-4770-9768-7a81d39270cb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'99e2e249-f7a6-4816-a207-7ac0def4c10f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'7283bb6c-0da2-4a47-8ac3-7de9ede13ccf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'e12bafe4-9a85-4f30-a532-7ebc1c065490')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'2606bff3-4233-41c6-818b-7ef773f3106b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'f1306f0e-1e16-4435-b093-7f4b1d720739')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4d09333d-cd6a-4b3b-b2ef-80a853031f0e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'd4df0201-cfef-4a82-87c9-810c5c414146')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'4da38791-a252-437c-b7ce-826043d93b20')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'd55ec4b2-9eef-4ce7-b870-837ec598e79c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'6ad0b067-91c6-46e4-908d-87bab721ef86')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'4a89abd6-0125-4f8d-a48d-8a0a695a8f3a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'22820aa3-4e03-4b11-8d0b-8a95f345dccd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'd7f7a66d-fb9f-4aed-9493-8b2f3d5b1dec')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'2b22a4f2-15a0-4f79-ad19-8b6dd8bca45e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'532aceec-ae4e-4f75-a194-8b7eb48e9c06')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'776a6aff-e39f-4de4-914b-8c8624dd21cf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'f92d87b2-99b7-41ae-bb4a-8d0570a5424c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a4f18245-7b62-422a-a11f-8d9b893b5b5a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'da37ff22-c6d2-4842-8daf-8d9dfd396e70')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'745f1b99-07e3-42b2-bd92-8e4cbbf5c25a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'0ce9bc0f-07ee-47f1-8a53-8e8688f071d5')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'9b51c817-4400-4384-aff4-8ed19e54108c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'da2c024e-2738-4cec-8374-90221b7ae7de')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'9a0b287e-8c84-4b77-bab0-906ca0428ef8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'2c3cb943-a8f4-425d-aef9-90fdfe79cacd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'a09e8acd-5bbc-4316-b190-937e91a4a3ab')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'ca3c2520-ebb3-4937-8fe8-94e6aa4cddbd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'2138d75a-c0a1-4020-a029-954243cf5629')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'b0cf8a36-b106-4108-9df8-9593852d6f30')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'0338d84c-9cdf-49d2-932c-962dc6912ab1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'e597232b-6141-4aae-9002-977af580ff30')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'2fe1fe87-ede9-4446-beed-9786d4b953c1')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'560dd071-3b0d-4ca4-aabf-9917717d858c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'6bee79f0-944d-468a-9757-99c07993d378')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'5be4ab8f-68d4-450e-983e-9afb75a0e6dc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'ca2da273-0a44-4bed-b97e-9bffc8c3e8b6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'369d3e01-43a3-499e-bf1f-9c7441009723')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'1e2aafdb-458e-4cba-a884-9cadabe52f57')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'359272ae-3037-492d-9e9e-9d6a28105334')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'3562740d-0e1a-470c-9480-9de9b2d58340')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'dea2beec-767f-4d6e-93af-9efbe31a2c28')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'2fab63b8-c594-408e-b602-9f06bfe2c104')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'30f46cb7-4ed5-42a7-a685-9f1f03260d03')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'a2b0bfeb-b8e3-43bc-82ad-a17e516ed8c2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5750fa80-4145-45ee-a53b-a1ddd8aeb92c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'5a91c08c-e32c-482a-b360-a1e4698ac5ab')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'15589419-ebe3-439f-9957-a4d2aaf52453')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'0e9a1fd3-f78c-4026-a867-a60707d766fb')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'4a53da7a-2c4c-4d5f-abc0-a931f01c5cd8')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'0bad97ce-79d6-4b44-b91a-a9485a2f01d9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'07f15c55-36a2-4a3f-a5e9-ad3c1dd5f9be')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'dfa4137e-4fa1-4cac-b1f9-ad681d3c010e')
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
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'5aa3000b-a5ee-43fb-8b17-ba9732aa7406')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2013, N'3aa1fa8c-c32e-4df4-a5a0-bb56fbaaf4b6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'787bf088-7d6f-4dde-bd6d-be70be54308a')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'092f57ef-f0da-4be6-a0ab-bf5765278263')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'b2c86410-4509-4edc-aa41-bf79f98806ca')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dfe5fb52-2ade-4a1b-91b1-c06a078e2c37')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'2e34f39f-e3d0-46dd-ac64-c0f6af8c5d26')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'38933e94-400e-48de-9139-c109b57bbccf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'779e0cd8-0fb1-4418-8538-c354c2a342cc')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'4731adc7-45d9-4bdc-a42c-c48b2b5f8d5d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'bf80deb6-38c6-4062-a177-c4a97405b6d0')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'a0e1a810-07de-4b06-b45d-c4cac942beb4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'bba4917d-6cdb-4b77-9f79-c4ee14e9b5b2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'96336475-14af-488b-9351-c75bc07c81dd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'98758005-240e-4494-99af-c9aa8cbb04ec')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'cf664e3d-0f25-4b86-83c5-cb2a3c84f24e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'5db27fe9-15d4-4df0-bbd2-cc329ebd3ff7')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'fe55aede-a8b8-43ac-ab31-ce2bfd433d2c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'95be8573-0e1b-4cd5-9c0e-d0706094a68e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'3a9b61c0-5142-4306-aa27-d09b621edaea')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'32fb6f49-fc63-47d8-8b2e-d1b146692c75')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'2ccc9a01-3fe4-4abe-b937-d25c439d39b6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2014, N'c226e891-2110-4949-8afc-d3a74bf5263e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'b91af905-29a5-4cc9-9746-d409cac9d433')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'9a818c5e-17c7-4509-a675-d45cb27ad277')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'67d4f2b2-431d-4c94-a77e-d504b5ed5545')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'0754b310-28ac-456f-a95a-d5e890c3953b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'f6972236-3a64-439a-a18a-d62dcae79116')
GO
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'cbd38855-255f-4fab-95d8-d6afad2bbd85')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'6b586ba6-35a2-4912-830d-d742fa065bce')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'dee869d9-ec53-455b-bdca-d7e3fa599a78')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2014, N'e2f36cfe-758a-4822-9784-dbf4c80aef79')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2013, N'662e3aad-9595-449a-b9e0-dcc96d60b29d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'eab2fa90-4b74-4dd8-ade2-e09a3abe18de')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'f06c7241-fcd1-4bf5-9937-e2a13a5b9a73')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'3133b156-3a21-466f-85c9-e2e9d588030d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2014, N'45949560-0258-417f-8364-e3e9942b262f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'a36418c3-12b9-4256-a643-e49218038a53')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2014, N'e3bec632-fc30-446c-a021-e4cce4af8d9f')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2014, N'4f5caa97-ae08-4512-aa7d-ea18bcc9589d')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ccba9d68-ed0a-4b49-9a03-eabe30f162b6')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'dc451215-fb52-41e2-9ddb-eb2bd0087eb9')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'806274e3-0633-45b0-aa5b-eb35006d5a9b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'671ca051-afb6-4637-82a1-eb6989e5fb27')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2013, N'6191910d-1e04-4cd4-b664-ecbb532da926')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2013, N'99dd11fd-64f5-4a28-bd02-edf47b59dbe5')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'e93851ff-7b86-4665-bb6d-ee844f8108cd')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2014, N'423545aa-82d0-4bd0-af0d-f0e1318c86c2')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (1, 1, 2014, N'c3fd87bd-c788-42e6-b01f-f19d93c26ad4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (11, 4, 2014, N'1fe056ed-3067-4f4c-a6ad-f1f828fa5308')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (12, 4, 2013, N'87b25935-fe46-47ca-9de3-f32ba785ad95')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'3291c3d4-ecfa-4080-9cb4-f4a5074bae72')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'1fba1de7-2bcd-4a9e-b9cb-f4d24cd6a77e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'052860b3-e9ec-49ec-8495-f5a3c1245ce3')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2013, N'ea03156b-ca2d-4301-ae84-f645373fdfab')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (9, 3, 2013, N'113b658a-5f66-45d0-a364-f646b3444d25')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2014, N'dfe05c5b-7f2c-4ceb-a267-f6aeda05732e')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (5, 2, 2013, N'428b3462-2285-46ce-b698-f6b373afd564')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (10, 4, 2014, N'88359991-5f59-411c-8cbd-f7a3a4ced8cf')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'5da31754-6c87-4745-aa73-f891648d0126')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (4, 2, 2013, N'f69268c1-f45f-4a38-abd3-f96d62b840ad')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (8, 3, 2014, N'16c581d0-797a-447f-b5d0-fa3dcb52dcc4')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (7, 3, 2013, N'a7951f51-20e5-4854-90e6-fa5401314a6c')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (6, 2, 2014, N'72388e63-eb27-4776-9feb-fc582e2ba99b')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (2, 1, 2013, N'7aee0692-3d0f-4db3-ba1b-fc8841eaaa16')
INSERT [dbo].[Thoigian] ([thang], [quy], [nam], [id]) VALUES (3, 1, 2013, N'ff7f1795-3f48-4657-9d00-fd2ec5d8fd80')
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
