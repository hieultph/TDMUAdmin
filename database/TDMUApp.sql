USE [TDMUApp]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[ID] [varchar](50) NOT NULL,
	[IDTLBaiViet] [varchar](50) NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[ImagePath] [varchar](max) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiViet_NguoiChinhSua]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet_NguoiChinhSua](
	[ID] [varchar](50) NOT NULL,
	[IDBaiViet] [varchar](50) NULL,
	[IDNguoiChinhSua] [varchar](50) NULL,
	[NgayChinhSua] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BaiViet_NguoiThamGia]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet_NguoiThamGia](
	[ID] [varchar](50) NOT NULL,
	[IDBaiViet] [varchar](50) NULL,
	[IDNguoiThamGia] [varchar](50) NULL,
	[NgayDangKy] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BangDiem]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangDiem](
	[ID] [varchar](50) NOT NULL,
	[IDSinhVien] [varchar](50) NULL,
	[IDMonHoc] [varchar](50) NULL,
	[DiemGiuaKy] [float] NULL,
	[DiemCuoiKy] [float] NULL,
	[DiemTongKet] [float] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuoiHoc]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuoiHoc](
	[ID] [varchar](50) NOT NULL,
	[NgayDienRa] [datetime] NULL,
	[NgayKetThuc] [datetime] NULL,
	[SoTiet] [int] NULL,
	[Phong] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi](
	[ID] [varchar](50) NOT NULL,
	[IDNguoiGui] [varchar](50) NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[NgayGui] [datetime] NULL,
	[DuocDuyet] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi_ChuDeCauHoi]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi_ChuDeCauHoi](
	[ID] [varchar](50) NOT NULL,
	[IDCauHoi] [varchar](50) NULL,
	[IDChuDeCauHoi] [varchar](50) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi_NguoiDanhGia]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi_NguoiDanhGia](
	[ID] [varchar](50) NOT NULL,
	[IDCauHoi] [varchar](50) NULL,
	[IDNguoiDanhGia] [varchar](50) NULL,
	[HuuIch] [int] NULL,
	[NgayDanhGia] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi_NguoiTraLoi]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi_NguoiTraLoi](
	[ID] [varchar](50) NOT NULL,
	[IDCauHoi] [varchar](50) NULL,
	[IDNguoiTraLoi] [varchar](50) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[NgayTraLoi] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi](
	[ID] [varchar](50) NOT NULL,
	[IDCauHoi_NguoiTraLoi] [varchar](50) NULL,
	[IDNguoiTraLoi] [varchar](50) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[NgayTraLoi] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDeCauHoi]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDeCauHoi](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiemRenLuyen]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemRenLuyen](
	[ID] [varchar](50) NOT NULL,
	[IDSinhVien] [varchar](50) NULL,
	[IDHocKy] [varchar](50) NULL,
	[IDNamHoc] [varchar](50) NULL,
	[TongDiem] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HocKy]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocKy](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiThongBao]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiThongBao](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[CapDo] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lop](
	[ID] [varchar](50) NOT NULL,
	[IDGiangVien] [varchar](50) NULL,
	[IDNhomNganh] [varchar](50) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[ID] [varchar](50) NOT NULL,
	[IDHocKy] [varchar](50) NULL,
	[IDNamHoc] [varchar](50) NULL,
	[Ten] [nvarchar](500) NULL,
	[SoTC] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NamHoc]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamHoc](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomChat]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomChat](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[NgayTao] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomChat_NguoiThamGia]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomChat_NguoiThamGia](
	[ID] [varchar](50) NOT NULL,
	[IDNhomChat] [varchar](50) NULL,
	[IDNguoiThamGia] [varchar](50) NULL,
	[NgayThamGia] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomMonHoc]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMonHoc](
	[ID] [varchar](50) NOT NULL,
	[IDGiangVien] [varchar](50) NULL,
	[IDMonHoc] [varchar](50) NULL,
	[SoLuong] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomMonHoc_BuoiHoc]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMonHoc_BuoiHoc](
	[ID] [varchar](50) NOT NULL,
	[IDNhomMonHoc] [varchar](50) NULL,
	[IDBuoiHoc] [varchar](50) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomMonHoc_SinhVien]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMonHoc_SinhVien](
	[ID] [varchar](50) NOT NULL,
	[IDSinhVien] [varchar](50) NULL,
	[IDNhomMonHoc] [varchar](50) NULL,
	[NgayDangKy] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomNganh]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomNganh](
	[ID] [varchar](50) NOT NULL,
	[IDKhoa] [varchar](50) NULL,
	[Ten] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyenTruyCap]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenTruyCap](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[CapDo] [int] NOT NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID] [varchar](50) NOT NULL,
	[IDThoiKhoaBieu] [varchar](50) NULL,
	[IDLop] [varchar](50) NULL,
	[HoTen] [nvarchar](500) NULL,
	[NgaySinh] [datetime] NULL,
	[Email] [varchar](max) NULL,
	[SDT] [varchar](50) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[CCCD] [varchar](50) NULL,
	[ChucVu] [nvarchar](500) NULL,
	[IDQuyenTruyCap] [varchar](50) NOT NULL,
	[TenTaiKhoan] [nvarchar](500) NULL,
	[MatKhau] [varchar](max) NULL,
	[ImagePath] [varchar](max) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiKhoaBieu]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiKhoaBieu](
	[ID] [varchar](50) NOT NULL,
	[IDTaiKhoan] [varchar](50) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThoiKhoaBieu_BuoiHoc]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThoiKhoaBieu_BuoiHoc](
	[ID] [varchar](50) NOT NULL,
	[IDThoiKhoaBieu] [varchar](50) NULL,
	[IDBuoiHoc] [varchar](50) NULL,
	[NgayThu] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[ID] [varchar](50) NOT NULL,
	[IDLoaiThongBao] [varchar](50) NULL,
	[TieuDe] [nvarchar](500) NULL,
	[NoiDung] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao_NguoiChinhSua]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao_NguoiChinhSua](
	[ID] [varchar](50) NOT NULL,
	[IDThongBao] [varchar](50) NULL,
	[IDNguoiChinhSua] [varchar](50) NULL,
	[NgayChinhSua] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongBao_NguoiNhan]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao_NguoiNhan](
	[ID] [varchar](50) NOT NULL,
	[IDThongBao] [varchar](50) NULL,
	[IDNguoiNhan] [varchar](50) NULL,
	[NgayNhan] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinNhan]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinNhan](
	[ID] [varchar](50) NOT NULL,
	[IDTaiKhoan] [varchar](50) NULL,
	[NoiDung] [varchar](500) NULL,
	[NgayGui] [datetime] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinNhan_GuiDen]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinNhan_GuiDen](
	[ID] [varchar](50) NOT NULL,
	[IDTinNhan] [varchar](50) NULL,
	[IDNguoiNhan] [varchar](50) NULL,
	[IDNhomNhan] [varchar](50) NULL,
	[DaXem] [int] NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TLBaiViet]    Script Date: 12/22/2023 2:15:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TLBaiViet](
	[ID] [varchar](50) NOT NULL,
	[Ten] [nvarchar](500) NULL,
	[GhiChu] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BaiViet] ([ID], [IDTLBaiViet], [TieuDe], [NoiDung], [ImagePath], [GhiChu]) VALUES (N'BV0000000001', N'TLBV0000000002', N'Đồng tổ chức thành công hội thảo khoa học quốc gia STAIS-2023', N'<p>Ng&agrave;y 26/10/2023, tại trường Đại học Sư phạm Kỹ thuật Vinh, hội thảo &ldquo;Ứng dụng C&ocirc;ng nghệ th&ocirc;ng minh trong C&ocirc;ng nghiệp 4.0, Th&agrave;nh phố th&ocirc;ng minh v&agrave; Ph&aacute;t triển bền vững STAIS-2023&rdquo; đ&atilde; diễn ra th&agrave;nh c&ocirc;ng.</p>', N'article (1).png', N'')
GO
INSERT [dbo].[BaiViet] ([ID], [IDTLBaiViet], [TieuDe], [NoiDung], [ImagePath], [GhiChu]) VALUES (N'BV0000000002', N'TLBV0000000002', N'Phát triển giáo dục về hiệu quả năng lượng và chiếu sáng thông minh', N'Sáng ngày 24/10/2023, tại Trung tâm Sáng kiến Cộng đồng và Hỗ trợ khởi nghiệp tỉnh Bình Dương, trường ĐH Thủ Dầu Một đã tổ chức hội thảo với chủ đề “Phát triển giáo dục về hiệu quả năng lượng và chiếu sáng thông minh tại Việt Nam và Myanmar.', N'article (2).png', NULL)
GO
INSERT [dbo].[BaiViet] ([ID], [IDTLBaiViet], [TieuDe], [NoiDung], [ImagePath], [GhiChu]) VALUES (N'BV0000000003', N'TLBV0000000003', N'Chúc mừng sinh viên Bùi Xuân Sáng đạt Giải thưởng Kiến trúc xanh sinh viên 2023', N'Tại lễ trao giải diễn ra vào 14 giờ 30 ngày 26/10/2023, sinh viên Bùi Xuân Sáng - ngành Kiến trúc trường ĐH Thủ Dầu Một đã đạt giải khuyến khích với tác phẩm “Trung tâm Bảo tồn và Phát triển Văn hóa dân tộc Ê Đê - Tây Nguyên”.', N'article (3).png', NULL)
GO
INSERT [dbo].[BaiViet] ([ID], [IDTLBaiViet], [TieuDe], [NoiDung], [ImagePath], [GhiChu]) VALUES (N'BV0000000004', N'TLBV0000000003', N'Từ phòng thí nghiệm đến sản phẩm hữu cơ', N'<p>Để tạo ra sản phẩm chất lượng c&oacute; nguồn gốc hữu cơ, n&acirc;ng cao gi&aacute; trị thương mại, cần c&oacute; vai tr&ograve; của nh&agrave; nghi&ecirc;n cứu. Những th&agrave;nh quả của Viện Ph&aacute;t triển ứng dụng l&agrave; một v&iacute; dụ.</p>', N'article (4).png', N'')
GO
INSERT [dbo].[BaiViet] ([ID], [IDTLBaiViet], [TieuDe], [NoiDung], [ImagePath], [GhiChu]) VALUES (N'BV0000000005', N'TLBV0000000001', N'Khoa Y Dược ghi dấu ấn với diễn đàn y khoa định kỳ hàng tháng', N'Ngày 16/6/2023, khoa Y Dược tổ chức hội nghị y khoa định kỳ hàng tháng kết hợp tổng kết hoạt động nghiên cứu khoa học, tuyên dương CB-GV, học viên có nhiều đóng góp công tác nghiên cứu, đào tạo của khoa.', N'article (5).png', NULL)
GO
INSERT [dbo].[BaiViet] ([ID], [IDTLBaiViet], [TieuDe], [NoiDung], [ImagePath], [GhiChu]) VALUES (N'BV0000000006', N'TLBV0000000002', N'fdsfsdf', N'<p>dsfdsfsd</p>', NULL, N'')
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000001', N'BV0000000001', N'TK0000000001', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000002', N'BV0000000002', N'TK0000000002', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000003', N'BV0000000003', N'TK0000000003', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000004', N'BV0000000004', N'TK0000000004', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000005', N'BV0000000005', N'TK0000000005', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000006', N'BV0000000001', N'TK0000000002', CAST(N'2023-06-23T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000007', N'BV0000000006', N'TK0000000001', CAST(N'2023-12-22T14:09:23.983' AS DateTime), N'')
GO
INSERT [dbo].[BaiViet_NguoiChinhSua] ([ID], [IDBaiViet], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'BV_NCS0000000008', N'BV0000000001', N'TK0000000001', CAST(N'2023-12-22T14:10:37.867' AS DateTime), N'note')
GO
INSERT [dbo].[BaiViet_NguoiThamGia] ([ID], [IDBaiViet], [IDNguoiThamGia], [NgayDangKy], [GhiChu]) VALUES (N'BV_NTG0000000001', N'BV0000000001', N'TK0000000001', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiThamGia] ([ID], [IDBaiViet], [IDNguoiThamGia], [NgayDangKy], [GhiChu]) VALUES (N'BV_NTG0000000002', N'BV0000000001', N'TK0000000002', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiThamGia] ([ID], [IDBaiViet], [IDNguoiThamGia], [NgayDangKy], [GhiChu]) VALUES (N'BV_NTG0000000003', N'BV0000000001', N'TK0000000003', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiThamGia] ([ID], [IDBaiViet], [IDNguoiThamGia], [NgayDangKy], [GhiChu]) VALUES (N'BV_NTG0000000004', N'BV0000000005', N'TK0000000004', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BaiViet_NguoiThamGia] ([ID], [IDBaiViet], [IDNguoiThamGia], [NgayDangKy], [GhiChu]) VALUES (N'BV_NTG0000000005', N'BV0000000005', N'TK0000000005', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000001', N'TK0000000001', N'MH0000000001', 7, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000002', N'TK0000000001', N'MH0000000002', 6, 8.9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000003', N'TK0000000001', N'MH0000000003', 7.2, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000004', N'TK0000000001', N'MH0000000004', 4, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000005', N'TK0000000001', N'MH0000000005', 7, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000006', N'TK0000000001', N'MH0000000006', 3, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000007', N'TK0000000001', N'MH0000000007', 8, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000008', N'TK0000000001', N'MH0000000008', 6.5, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000009', N'TK0000000001', N'MH0000000009', 7.8, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000010', N'TK0000000001', N'MH0000000010', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000011', N'TK0000000001', N'MH0000000011', 8.6, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000012', N'TK0000000001', N'MH0000000012', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000013', N'TK0000000001', N'MH0000000013', 5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000014', N'TK0000000001', N'MH0000000014', 4.5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000015', N'TK0000000001', N'MH0000000015', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000016', N'TK0000000001', N'MH0000000016', 7, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000017', N'TK0000000001', N'MH0000000017', 6, 8.9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000018', N'TK0000000001', N'MH0000000018', 2, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000019', N'TK0000000001', N'MH0000000019', 1, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000020', N'TK0000000001', N'MH0000000020', 7, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000021', N'TK0000000001', N'MH0000000021', 3, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000022', N'TK0000000001', N'MH0000000022', 8, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000023', N'TK0000000001', N'MH0000000023', 6.5, 5.5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000024', N'TK0000000001', N'MH0000000024', 7, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000025', N'TK0000000001', N'MH0000000025', 5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000026', N'TK0000000001', N'MH0000000026', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000027', N'TK0000000001', N'MH0000000027', 8, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000028', N'TK0000000001', N'MH0000000028', 5, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000029', N'TK0000000001', N'MH0000000029', 7, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000030', N'TK0000000001', N'MH0000000030', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000031', N'TK0000000001', N'MH0000000031', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000032', N'TK0000000001', N'MH0000000032', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000033', N'TK0000000001', N'MH0000000033', 6, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000034', N'TK0000000001', N'MH0000000034', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000035', N'TK0000000001', N'MH0000000035', 6, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000036', N'TK0000000001', N'MH0000000036', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000037', N'TK0000000001', N'MH0000000037', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000038', N'TK0000000001', N'MH0000000038', 5, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000039', N'TK0000000001', N'MH0000000039', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000040', N'TK0000000001', N'MH0000000040', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000041', N'TK0000000001', N'MH0000000041', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000042', N'TK0000000001', N'MH0000000042', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000043', N'TK0000000001', N'MH0000000043', 5.5, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000044', N'TK0000000001', N'MH0000000044', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000045', N'TK0000000001', N'MH0000000045', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000046', N'TK0000000001', N'MH0000000046', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000047', N'TK0000000001', N'MH0000000047', 4.6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000048', N'TK0000000001', N'MH0000000048', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000049', N'TK0000000001', N'MH0000000049', 9, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000050', N'TK0000000001', N'MH0000000050', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000051', N'TK0000000001', N'MH0000000051', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000052', N'TK0000000001', N'MH0000000052', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000053', N'TK0000000001', N'MH0000000053', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000054', N'TK0000000001', N'MH0000000054', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000055', N'TK0000000001', N'MH0000000055', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000056', N'TK0000000001', N'MH0000000056', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000057', N'TK0000000001', N'MH0000000057', 5, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000058', N'TK0000000001', N'MH0000000058', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000059', N'TK0000000001', N'MH0000000059', 1, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000060', N'TK0000000001', N'MH0000000060', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000061', N'TK0000000002', N'MH0000000001', 5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000062', N'TK0000000002', N'MH0000000002', 6, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000063', N'TK0000000002', N'MH0000000003', 5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000064', N'TK0000000002', N'MH0000000004', 8, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000065', N'TK0000000002', N'MH0000000005', 4, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000066', N'TK0000000002', N'MH0000000006', 6, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000067', N'TK0000000002', N'MH0000000007', 3, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000068', N'TK0000000002', N'MH0000000008', 6.5, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000069', N'TK0000000002', N'MH0000000009', 6.8, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000070', N'TK0000000002', N'MH0000000010', 6, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000071', N'TK0000000002', N'MH0000000011', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000072', N'TK0000000002', N'MH0000000012', 8.6, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000073', N'TK0000000002', N'MH0000000013', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000074', N'TK0000000002', N'MH0000000014', 5.9, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000075', N'TK0000000002', N'MH0000000015', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000076', N'TK0000000002', N'MH0000000016', 7, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000077', N'TK0000000002', N'MH0000000017', 6.9, 8.9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000078', N'TK0000000002', N'MH0000000018', 4, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000079', N'TK0000000002', N'MH0000000019', 4, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000080', N'TK0000000002', N'MH0000000020', 7, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000081', N'TK0000000002', N'MH0000000021', 3, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000082', N'TK0000000002', N'MH0000000022', 8, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000083', N'TK0000000002', N'MH0000000023', 6, 5.5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000084', N'TK0000000002', N'MH0000000024', 7, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000085', N'TK0000000002', N'MH0000000025', 5, 8.5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000086', N'TK0000000002', N'MH0000000026', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000087', N'TK0000000002', N'MH0000000027', 8.5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000088', N'TK0000000002', N'MH0000000028', 5, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000089', N'TK0000000002', N'MH0000000029', 7, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000090', N'TK0000000002', N'MH0000000030', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000091', N'TK0000000002', N'MH0000000031', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000092', N'TK0000000002', N'MH0000000032', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000093', N'TK0000000002', N'MH0000000033', 6, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000094', N'TK0000000002', N'MH0000000034', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000095', N'TK0000000002', N'MH0000000035', 6, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000096', N'TK0000000002', N'MH0000000036', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000097', N'TK0000000002', N'MH0000000037', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000098', N'TK0000000002', N'MH0000000038', 5, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000099', N'TK0000000002', N'MH0000000039', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000100', N'TK0000000002', N'MH0000000040', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000101', N'TK0000000002', N'MH0000000041', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000102', N'TK0000000002', N'MH0000000042', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000103', N'TK0000000002', N'MH0000000043', 5.5, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000104', N'TK0000000002', N'MH0000000044', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000105', N'TK0000000002', N'MH0000000045', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000106', N'TK0000000002', N'MH0000000046', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000107', N'TK0000000002', N'MH0000000047', 4.6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000108', N'TK0000000002', N'MH0000000048', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000109', N'TK0000000002', N'MH0000000049', 9, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000110', N'TK0000000002', N'MH0000000050', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000111', N'TK0000000002', N'MH0000000051', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000112', N'TK0000000002', N'MH0000000052', 6, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000113', N'TK0000000002', N'MH0000000053', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000114', N'TK0000000002', N'MH0000000054', 6, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000115', N'TK0000000002', N'MH0000000055', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000116', N'TK0000000002', N'MH0000000056', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000117', N'TK0000000002', N'MH0000000057', 5, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000118', N'TK0000000002', N'MH0000000058', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000119', N'TK0000000002', N'MH0000000059', 1, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000120', N'TK0000000002', N'MH0000000060', 6, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000121', N'TK0000000003', N'MH0000000001', 5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000122', N'TK0000000003', N'MH0000000002', 6, 8.6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000123', N'TK0000000003', N'MH0000000003', 6, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000124', N'TK0000000003', N'MH0000000004', 8, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000125', N'TK0000000003', N'MH0000000005', 7, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000126', N'TK0000000003', N'MH0000000006', 6, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000127', N'TK0000000003', N'MH0000000007', 3, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000128', N'TK0000000003', N'MH0000000008', 6.5, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000129', N'TK0000000003', N'MH0000000009', 6.8, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000130', N'TK0000000003', N'MH0000000010', 5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000131', N'TK0000000003', N'MH0000000011', 4, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000132', N'TK0000000003', N'MH0000000012', 8.6, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000133', N'TK0000000003', N'MH0000000013', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000134', N'TK0000000003', N'MH0000000014', 5.9, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000135', N'TK0000000003', N'MH0000000015', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000136', N'TK0000000003', N'MH0000000016', 7, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000137', N'TK0000000003', N'MH0000000017', 6.9, 8.9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000138', N'TK0000000003', N'MH0000000018', 6, 5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000139', N'TK0000000003', N'MH0000000019', 4, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000140', N'TK0000000003', N'MH0000000020', 7, 9, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000141', N'TK0000000003', N'MH0000000021', 3, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000142', N'TK0000000003', N'MH0000000022', 8, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000143', N'TK0000000003', N'MH0000000023', 6, 5.5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000144', N'TK0000000003', N'MH0000000024', 4.5, 7, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000145', N'TK0000000003', N'MH0000000025', 5, 8.5, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000146', N'TK0000000003', N'MH0000000026', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000147', N'TK0000000003', N'MH0000000027', 8.5, 8, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000148', N'TK0000000003', N'MH0000000028', 5.5, 4, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000149', N'TK0000000003', N'MH0000000029', 7, 6, NULL, NULL)
GO
INSERT [dbo].[BangDiem] ([ID], [IDSinhVien], [IDMonHoc], [DiemGiuaKy], [DiemCuoiKy], [DiemTongKet], [GhiChu]) VALUES (N'BD0000000150', N'TK0000000003', N'MH0000000030', 4, 8, NULL, NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000001', CAST(N'2023-11-03T07:00:00.000' AS DateTime), CAST(N'2023-10-03T11:30:00.000' AS DateTime), 5, N'I4.203', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000002', CAST(N'2023-11-05T07:00:00.000' AS DateTime), CAST(N'2023-11-05T11:30:00.000' AS DateTime), 5, N'E3.104', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000003', CAST(N'2023-11-10T12:30:00.000' AS DateTime), CAST(N'2023-11-10T17:00:00.000' AS DateTime), 5, N'C2.202', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000004', CAST(N'2023-11-14T07:00:00.000' AS DateTime), CAST(N'2024-11-14T11:30:00.000' AS DateTime), 5, N'H1.404', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000005', CAST(N'2023-11-15T12:30:00.000' AS DateTime), CAST(N'2024-11-15T17:00:00.000' AS DateTime), 5, N'I1.401', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000006', CAST(N'2023-11-17T12:30:00.000' AS DateTime), CAST(N'2023-11-17T17:00:00.000' AS DateTime), 5, N'I2.201', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000007', CAST(N'2023-11-18T12:30:00.000' AS DateTime), CAST(N'2023-11-18T17:00:00.000' AS DateTime), 5, N'I3.301', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000008', CAST(N'2023-11-21T12:30:00.000' AS DateTime), CAST(N'2023-11-21T17:00:00.000' AS DateTime), 5, N'I3.101', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000009', CAST(N'2023-11-26T12:30:00.000' AS DateTime), CAST(N'2023-11-26T17:00:00.000' AS DateTime), 5, N'I1.101', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000010', CAST(N'2023-12-01T12:30:00.000' AS DateTime), CAST(N'2023-12-01T17:00:00.000' AS DateTime), 5, N'I4.203', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000011', CAST(N'2023-12-05T12:30:00.000' AS DateTime), CAST(N'2023-12-05T17:00:00.000' AS DateTime), 5, N'I2.404', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000012', CAST(N'2023-12-10T12:30:00.000' AS DateTime), CAST(N'2023-12-10T17:00:00.000' AS DateTime), 5, N'I2.409', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000013', CAST(N'2023-12-15T12:30:00.000' AS DateTime), CAST(N'2023-12-15T17:00:00.000' AS DateTime), 5, N'I3.408', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000014', CAST(N'2023-12-16T12:30:00.000' AS DateTime), CAST(N'2023-12-16T17:00:00.000' AS DateTime), 5, N'H1.408', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000015', CAST(N'2023-12-17T12:30:00.000' AS DateTime), CAST(N'2023-12-17T17:00:00.000' AS DateTime), 5, N'H1.208', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000016', CAST(N'2023-12-20T12:30:00.000' AS DateTime), CAST(N'2023-12-20T17:00:00.000' AS DateTime), 5, N'I1.402', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000017', CAST(N'2023-12-24T12:30:00.000' AS DateTime), CAST(N'2023-12-24T17:00:00.000' AS DateTime), 5, N'I1.405', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000018', CAST(N'2023-12-28T12:30:00.000' AS DateTime), CAST(N'2023-12-28T17:00:00.000' AS DateTime), 5, N'I1.406', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000019', CAST(N'2024-01-03T12:30:00.000' AS DateTime), CAST(N'2024-01-03T17:00:00.000' AS DateTime), 5, N'I1.407', NULL)
GO
INSERT [dbo].[BuoiHoc] ([ID], [NgayDienRa], [NgayKetThuc], [SoTiet], [Phong], [GhiChu]) VALUES (N'BH0000000020', CAST(N'2024-01-07T12:30:00.000' AS DateTime), CAST(N'2024-01-07T17:00:00.000' AS DateTime), 5, N'I1.408', NULL)
GO
INSERT [dbo].[CauHoi] ([ID], [IDNguoiGui], [TieuDe], [NoiDung], [NgayGui], [DuocDuyet], [GhiChu]) VALUES (N'CH0000000001', N'TK0000000001', N'Làm sao để đóng học phí?', N'How to đóng tiền', CAST(N'2023-02-20T00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[CauHoi] ([ID], [IDNguoiGui], [TieuDe], [NoiDung], [NgayGui], [DuocDuyet], [GhiChu]) VALUES (N'CH0000000002', N'TK0000000002', N'Nhận học bổng như thế nào?', N'How to lấy học bổng', CAST(N'2023-06-20T00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[CauHoi] ([ID], [IDNguoiGui], [TieuDe], [NoiDung], [NgayGui], [DuocDuyet], [GhiChu]) VALUES (N'CH0000000003', N'TK0000000002', N'Xin giấy hoãn NVQS', N'How to xin giấy hoãn quân sự', CAST(N'2023-03-20T00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[CauHoi] ([ID], [IDNguoiGui], [TieuDe], [NoiDung], [NgayGui], [DuocDuyet], [GhiChu]) VALUES (N'CH0000000004', N'TK0000000001', N'Làm sao để xin nghỉ học trong lớp', N'How to pro english', CAST(N'2023-08-20T00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[CauHoi] ([ID], [IDNguoiGui], [TieuDe], [NoiDung], [NgayGui], [DuocDuyet], [GhiChu]) VALUES (N'CH0000000005', N'TK0000000004', N'Gia hạn đóng tiền như thế nào?', N'How to nghỉ học', CAST(N'2023-06-20T00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[CauHoi_ChuDeCauHoi] ([ID], [IDCauHoi], [IDChuDeCauHoi], [GhiChu]) VALUES (N'CH_CDCH0000000001', N'CH0000000001', N'CDCH0000000001', NULL)
GO
INSERT [dbo].[CauHoi_ChuDeCauHoi] ([ID], [IDCauHoi], [IDChuDeCauHoi], [GhiChu]) VALUES (N'CH_CDCH0000000002', N'CH0000000002', N'CDCH0000000002', NULL)
GO
INSERT [dbo].[CauHoi_ChuDeCauHoi] ([ID], [IDCauHoi], [IDChuDeCauHoi], [GhiChu]) VALUES (N'CH_CDCH0000000003', N'CH0000000003', N'CDCH0000000001', NULL)
GO
INSERT [dbo].[CauHoi_ChuDeCauHoi] ([ID], [IDCauHoi], [IDChuDeCauHoi], [GhiChu]) VALUES (N'CH_CDCH0000000004', N'CH0000000004', N'CDCH0000000001', NULL)
GO
INSERT [dbo].[CauHoi_ChuDeCauHoi] ([ID], [IDCauHoi], [IDChuDeCauHoi], [GhiChu]) VALUES (N'CH_CDCH0000000005', N'CH0000000005', N'CDCH0000000005', NULL)
GO
INSERT [dbo].[CauHoi_NguoiDanhGia] ([ID], [IDCauHoi], [IDNguoiDanhGia], [HuuIch], [NgayDanhGia], [GhiChu]) VALUES (N'CH_NDG0000000001', N'CH0000000001', N'TK0000000001', 0, CAST(N'2023-02-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiDanhGia] ([ID], [IDCauHoi], [IDNguoiDanhGia], [HuuIch], [NgayDanhGia], [GhiChu]) VALUES (N'CH_NDG0000000002', N'CH0000000002', N'TK0000000003', 0, CAST(N'2023-02-22T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiDanhGia] ([ID], [IDCauHoi], [IDNguoiDanhGia], [HuuIch], [NgayDanhGia], [GhiChu]) VALUES (N'CH_NDG0000000003', N'CH0000000003', N'TK0000000001', 1, CAST(N'2023-02-24T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiDanhGia] ([ID], [IDCauHoi], [IDNguoiDanhGia], [HuuIch], [NgayDanhGia], [GhiChu]) VALUES (N'CH_NDG0000000004', N'CH0000000004', N'TK0000000003', 1, CAST(N'2023-02-26T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiDanhGia] ([ID], [IDCauHoi], [IDNguoiDanhGia], [HuuIch], [NgayDanhGia], [GhiChu]) VALUES (N'CH_NDG0000000005', N'CH0000000005', N'TK0000000001', 0, CAST(N'2023-02-28T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi] ([ID], [IDCauHoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL0000000001', N'CH0000000001', N'TK0000000002', N'Xin chào! rất vui được gặp bạn.', CAST(N'2023-02-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi] ([ID], [IDCauHoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL0000000002', N'CH0000000002', N'TK0000000002', N'Bạn ăn cơm chưa?', CAST(N'2023-02-22T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi] ([ID], [IDCauHoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL0000000003', N'CH0000000003', N'TK0000000002', N'Bạn ơi, mình hỏi bài xíu được không?', CAST(N'2023-02-24T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi] ([ID], [IDCauHoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL0000000004', N'CH0000000004', N'TK0000000005', N'Tối nay tranh thủ soạn ppt thuyết trình nha', CAST(N'2023-02-26T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi] ([ID], [IDCauHoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL0000000005', N'CH0000000005', N'TK0000000005', N'Bạn lên đọc Q&A của trường nha', CAST(N'2023-02-28T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi] ([ID], [IDCauHoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL0000000006', N'CH0000000001', N'TK0000000001', N'haha', CAST(N'2023-12-22T14:11:14.997' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000001', N'CH_NTL0000000001', N'TK0000000001', N'Rất vui được gặp bạn!', CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000002', N'CH_NTL0000000001', N'TK0000000004', N'Chào bạn', CAST(N'2023-02-21T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000003', N'CH_NTL0000000002', N'TK0000000005', N'Chưa bạn ơi', CAST(N'2023-02-23T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000004', N'CH_NTL0000000002', N'TK0000000003', N'Bạn chở mình đi ăn hay gì?', CAST(N'2023-02-23T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000005', N'CH_NTL0000000003', N'TK0000000004', N'Không bạn :))', CAST(N'2023-02-25T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000006', N'CH_NTL0000000003', N'TK0000000005', N'Tự làm đi, hỏi gì', CAST(N'2023-02-25T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000007', N'CH_NTL0000000004', N'TK0000000001', N'Tối mình bận chơi game rồi, bạn tự làm đi', CAST(N'2023-02-27T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000008', N'CH_NTL0000000004', N'TK0000000003', N'OK, tối nay làm liền.', CAST(N'2023-02-27T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000009', N'CH_NTL0000000005', N'TK0000000003', N'Trường có Q&A à bạn?', CAST(N'2023-03-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi] ([ID], [IDCauHoi_NguoiTraLoi], [IDNguoiTraLoi], [NoiDung], [NgayTraLoi], [GhiChu]) VALUES (N'CH_NTL_NTL0000000010', N'CH_NTL0000000005', N'TK0000000002', N'Bạn đọc ở đâu vậy?', CAST(N'2023-03-01T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ChuDeCauHoi] ([ID], [Ten], [GhiChu]) VALUES (N'CDCH0000000001', N'Học phí', NULL)
GO
INSERT [dbo].[ChuDeCauHoi] ([ID], [Ten], [GhiChu]) VALUES (N'CDCH0000000002', N'Cấp giấy chứng nhận', NULL)
GO
INSERT [dbo].[ChuDeCauHoi] ([ID], [Ten], [GhiChu]) VALUES (N'CDCH0000000003', N'Môn học', NULL)
GO
INSERT [dbo].[ChuDeCauHoi] ([ID], [Ten], [GhiChu]) VALUES (N'CDCH0000000004', N'Học bổng', NULL)
GO
INSERT [dbo].[ChuDeCauHoi] ([ID], [Ten], [GhiChu]) VALUES (N'CDCH0000000005', N'Gia hạn đóng học phí', NULL)
GO
INSERT [dbo].[DiemRenLuyen] ([ID], [IDSinhVien], [IDHocKy], [IDNamHoc], [TongDiem], [GhiChu]) VALUES (N'DRL0000000001', N'TK0000000001', N'HK0000000001', N'NH0000000001', 81, NULL)
GO
INSERT [dbo].[DiemRenLuyen] ([ID], [IDSinhVien], [IDHocKy], [IDNamHoc], [TongDiem], [GhiChu]) VALUES (N'DRL0000000002', N'TK0000000002', N'HK0000000002', N'NH0000000002', 77, NULL)
GO
INSERT [dbo].[DiemRenLuyen] ([ID], [IDSinhVien], [IDHocKy], [IDNamHoc], [TongDiem], [GhiChu]) VALUES (N'DRL0000000003', N'TK0000000003', N'HK0000000002', N'NH0000000003', 65, NULL)
GO
INSERT [dbo].[DiemRenLuyen] ([ID], [IDSinhVien], [IDHocKy], [IDNamHoc], [TongDiem], [GhiChu]) VALUES (N'DRL0000000004', N'TK0000000004', N'HK0000000001', N'NH0000000004', 90, NULL)
GO
INSERT [dbo].[DiemRenLuyen] ([ID], [IDSinhVien], [IDHocKy], [IDNamHoc], [TongDiem], [GhiChu]) VALUES (N'DRL0000000005', N'TK0000000005', N'HK0000000001', N'NH0000000005', 45, NULL)
GO
INSERT [dbo].[HocKy] ([ID], [Ten], [GhiChu]) VALUES (N'HK0000000001', N'Học kỳ 1', NULL)
GO
INSERT [dbo].[HocKy] ([ID], [Ten], [GhiChu]) VALUES (N'HK0000000002', N'Học kỳ 2', NULL)
GO
INSERT [dbo].[HocKy] ([ID], [Ten], [GhiChu]) VALUES (N'HK0000000003', N'Học kỳ 3', NULL)
GO
INSERT [dbo].[Khoa] ([ID], [Ten], [GhiChu]) VALUES (N'K0000000001', N'Kỹ thuật - công nghệ', NULL)
GO
INSERT [dbo].[Khoa] ([ID], [Ten], [GhiChu]) VALUES (N'K0000000002', N'Kinh tế', NULL)
GO
INSERT [dbo].[Khoa] ([ID], [Ten], [GhiChu]) VALUES (N'K0000000003', N'Khoa học quản lý', NULL)
GO
INSERT [dbo].[LoaiThongBao] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'LTB0000000001', N'Quan trọng', 1, NULL)
GO
INSERT [dbo].[LoaiThongBao] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'LTB0000000002', N'Đáng chú ý', 2, NULL)
GO
INSERT [dbo].[LoaiThongBao] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'LTB0000000003', N'Bình thường', 3, NULL)
GO
INSERT [dbo].[Lop] ([ID], [IDGiangVien], [IDNhomNganh], [GhiChu]) VALUES (N'L0000000001', N'TK0000000001', N'NN0000000001', NULL)
GO
INSERT [dbo].[Lop] ([ID], [IDGiangVien], [IDNhomNganh], [GhiChu]) VALUES (N'L0000000002', N'TK0000000002', N'NN0000000001', NULL)
GO
INSERT [dbo].[Lop] ([ID], [IDGiangVien], [IDNhomNganh], [GhiChu]) VALUES (N'L0000000003', N'TK0000000003', N'NN0000000001', NULL)
GO
INSERT [dbo].[Lop] ([ID], [IDGiangVien], [IDNhomNganh], [GhiChu]) VALUES (N'L0000000004', N'TK0000000004', N'NN0000000002', NULL)
GO
INSERT [dbo].[Lop] ([ID], [IDGiangVien], [IDNhomNganh], [GhiChu]) VALUES (N'L0000000005', N'TK0000000005', N'NN0000000003', NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000001', N'HK0000000001', N'NH0000000001', N'Kỹ thuật phần mềm', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000002', N'HK0000000001', N'NH0000000001', N'Kinh tế chính trị', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000003', N'HK0000000001', N'NH0000000001', N'Mạng máy tính', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000004', N'HK0000000001', N'NH0000000001', N'Triết học', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000005', N'HK0000000001', N'NH0000000001', N'Pháp luật', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000006', N'HK0000000002', N'NH0000000001', N'KT Đông Nam Bộ', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000007', N'HK0000000002', N'NH0000000001', N'Kỹ thuật lập trình', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000008', N'HK0000000002', N'NH0000000001', N'Cơ sở dữ liệu', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000009', N'HK0000000002', N'NH0000000001', N'Hệ QT CSDL', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000010', N'HK0000000002', N'NH0000000001', N'Tư tưởng HCM', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000011', N'HK0000000003', N'NH0000000001', N'Cơ sở lập trình', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000012', N'HK0000000003', N'NH0000000001', N'Đồ án cơ sở ngành', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000013', N'HK0000000003', N'NH0000000001', N'Xác suất thống kê', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000014', N'HK0000000003', N'NH0000000001', N'Toán cao cấp 1', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000015', N'HK0000000003', N'NH0000000001', N'Toán cao cấp 2', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000016', N'HK0000000001', N'NH0000000002', N'Toán rời rạc', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000017', N'HK0000000001', N'NH0000000002', N'Tư duy biện luận', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000018', N'HK0000000001', N'NH0000000002', N'Vật lý đại cương', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000019', N'HK0000000001', N'NH0000000002', N'Lập trình web', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000020', N'HK0000000001', N'NH0000000002', N'TH Lập trình web', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000021', N'HK0000000002', N'NH0000000002', N'Cấu trúc DL và giải thuật', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000022', N'HK0000000002', N'NH0000000002', N'TH Cấu trúc DL và giải thuật', 4, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000023', N'HK0000000002', N'NH0000000002', N'Đổi mới, sáng tạo và khởi nghiệp', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000024', N'HK0000000002', N'NH0000000002', N'PP lập trình hướng đối tượng', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000025', N'HK0000000002', N'NH0000000002', N'TH PP lập trình hướng đối tượng', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000026', N'HK0000000003', N'NH0000000002', N'Phân tích thiết kế', 4, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000027', N'HK0000000003', N'NH0000000002', N'TH Phân tích thiết kế', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000028', N'HK0000000003', N'NH0000000002', N'Lập trình window', 1, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000029', N'HK0000000003', N'NH0000000002', N'TH Lập trình window', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000030', N'HK0000000003', N'NH0000000002', N'Phương pháp NCKH', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000031', N'HK0000000001', N'NH0000000003', N'An ninh mạng', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000032', N'HK0000000001', N'NH0000000003', N'CN XHKH', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000033', N'HK0000000001', N'NH0000000003', N'Thiết kế web', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000034', N'HK0000000001', N'NH0000000003', N'TH Thiết kế web', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000035', N'HK0000000001', N'NH0000000003', N'Lý thuyết đồ thị', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000036', N'HK0000000002', N'NH0000000003', N'TH Lý thuyết đồ thị', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000037', N'HK0000000002', N'NH0000000003', N'Hệ điều hành', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000038', N'HK0000000002', N'NH0000000003', N'TH Hệ điều hành', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000039', N'HK0000000002', N'NH0000000003', N'LS Đảng CSVN', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000040', N'HK0000000002', N'NH0000000003', N'Công nghệ phần mềm', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000041', N'HK0000000003', N'NH0000000003', N'TH Công nghệ phần mềm', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000042', N'HK0000000003', N'NH0000000003', N'Kiến trúc máy tính', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000043', N'HK0000000003', N'NH0000000003', N'Quản trị dự án CNTT', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000044', N'HK0000000003', N'NH0000000003', N'Quản trị Marketing', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000045', N'HK0000000003', N'NH0000000003', N'Trí tuệ nhân tạo', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000046', N'HK0000000001', N'NH0000000004', N'TH An ninh mạng', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000047', N'HK0000000001', N'NH0000000004', N'Chuyên đề sử lý dữ liệu lớn', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000048', N'HK0000000001', N'NH0000000004', N'TH Chuyên đề sử lý dữ liệu lớn', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000049', N'HK0000000001', N'NH0000000004', N'Chuyên đề IOT', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000050', N'HK0000000001', N'NH0000000004', N'TH Chuyên đề IOT', 4, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000051', N'HK0000000002', N'NH0000000004', N'Điện toán đám mây', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000052', N'HK0000000002', N'NH0000000004', N'TH Điện toán đám mây', 4, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000053', N'HK0000000002', N'NH0000000004', N'Phát triển ứng dụng di động', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000054', N'HK0000000002', N'NH0000000004', N'TH Phát triển ứng dụng di động', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000055', N'HK0000000002', N'NH0000000004', N'Quản trị hệ thống', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000056', N'HK0000000003', N'NH0000000004', N'TH Quản trị hệ thống', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000057', N'HK0000000003', N'NH0000000004', N'Phát triển phầm mềm mã nguồn mở', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000058', N'HK0000000003', N'NH0000000004', N'TH Phát triển phầm mềm mã nguồn mở', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000059', N'HK0000000003', N'NH0000000004', N'Đồ án chuyên ngành', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000060', N'HK0000000003', N'NH0000000004', N'TH Đồ án chuyên ngành', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000061', N'HK0000000001', N'NH0000000005', N'Kiểm thử xâm nhập', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000062', N'HK0000000001', N'NH0000000005', N'TH Kiểm thử xâm nhập', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000063', N'HK0000000001', N'NH0000000005', N'An toàn ứng dụng', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000064', N'HK0000000001', N'NH0000000005', N'TH An toàn ứng dụng', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000065', N'HK0000000001', N'NH0000000005', N'Thực tập doanh nghiệp', 4, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000066', N'HK0000000002', N'NH0000000005', N'Thực tập tốt nghiệp', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000067', N'HK0000000002', N'NH0000000005', N'Báo cáo tốt nghiệp', 4, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000068', N'HK0000000002', N'NH0000000005', N'Đồ án tốt nghiệp', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000069', N'HK0000000002', N'NH0000000005', N'Tiếng Anh', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000070', N'HK0000000002', N'NH0000000005', N'Tiếng Trung', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000071', N'HK0000000003', N'NH0000000005', N'Kỹ năng XH', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000072', N'HK0000000003', N'NH0000000005', N'TH CSLT', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000073', N'HK0000000003', N'NH0000000005', N'TH Vật lý', 2, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000074', N'HK0000000003', N'NH0000000005', N'Nhập môn CNTT', 3, NULL)
GO
INSERT [dbo].[MonHoc] ([ID], [IDHocKy], [IDNamHoc], [Ten], [SoTC], [GhiChu]) VALUES (N'MH0000000075', N'HK0000000003', N'NH0000000005', N'TH Nhập môn CNTT', 3, NULL)
GO
INSERT [dbo].[NamHoc] ([ID], [Ten], [GhiChu]) VALUES (N'NH0000000001', N'Năm nhất', NULL)
GO
INSERT [dbo].[NamHoc] ([ID], [Ten], [GhiChu]) VALUES (N'NH0000000002', N'Năm hai', NULL)
GO
INSERT [dbo].[NamHoc] ([ID], [Ten], [GhiChu]) VALUES (N'NH0000000003', N'Năm ba', NULL)
GO
INSERT [dbo].[NamHoc] ([ID], [Ten], [GhiChu]) VALUES (N'NH0000000004', N'Năm tư', NULL)
GO
INSERT [dbo].[NamHoc] ([ID], [Ten], [GhiChu]) VALUES (N'NH0000000005', N'Năm năm', NULL)
GO
INSERT [dbo].[NhomChat] ([ID], [Ten], [NgayTao], [GhiChu]) VALUES (N'NC0000000001', N'NhomChat1', CAST(N'2023-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat] ([ID], [Ten], [NgayTao], [GhiChu]) VALUES (N'NC0000000002', N'NhomChat2', CAST(N'2023-04-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat] ([ID], [Ten], [NgayTao], [GhiChu]) VALUES (N'NC0000000003', N'NhomChat3', CAST(N'2023-09-29T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat] ([ID], [Ten], [NgayTao], [GhiChu]) VALUES (N'NC0000000004', N'NhomChat4', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat] ([ID], [Ten], [NgayTao], [GhiChu]) VALUES (N'NC0000000005', N'NhomChat5', CAST(N'2023-01-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat_NguoiThamGia] ([ID], [IDNhomChat], [IDNguoiThamGia], [NgayThamGia], [GhiChu]) VALUES (N'NC_NTG0000000001', N'NC0000000001', N'TK0000000001', CAST(N'2023-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat_NguoiThamGia] ([ID], [IDNhomChat], [IDNguoiThamGia], [NgayThamGia], [GhiChu]) VALUES (N'NC_NTG0000000002', N'NC0000000002', N'TK0000000002', CAST(N'2023-04-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat_NguoiThamGia] ([ID], [IDNhomChat], [IDNguoiThamGia], [NgayThamGia], [GhiChu]) VALUES (N'NC_NTG0000000003', N'NC0000000002', N'TK0000000003', CAST(N'2023-09-29T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat_NguoiThamGia] ([ID], [IDNhomChat], [IDNguoiThamGia], [NgayThamGia], [GhiChu]) VALUES (N'NC_NTG0000000004', N'NC0000000005', N'TK0000000004', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomChat_NguoiThamGia] ([ID], [IDNhomChat], [IDNguoiThamGia], [NgayThamGia], [GhiChu]) VALUES (N'NC_NTG0000000005', N'NC0000000005', N'TK0000000005', CAST(N'2023-01-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomMonHoc] ([ID], [IDGiangVien], [IDMonHoc], [SoLuong], [GhiChu]) VALUES (N'NMH0000000001', N'TK0000000006', N'MH0000000001', 1, NULL)
GO
INSERT [dbo].[NhomMonHoc] ([ID], [IDGiangVien], [IDMonHoc], [SoLuong], [GhiChu]) VALUES (N'NMH0000000002', N'TK0000000007', N'MH0000000002', 2, NULL)
GO
INSERT [dbo].[NhomMonHoc] ([ID], [IDGiangVien], [IDMonHoc], [SoLuong], [GhiChu]) VALUES (N'NMH0000000003', N'TK0000000008', N'MH0000000003', 3, NULL)
GO
INSERT [dbo].[NhomMonHoc] ([ID], [IDGiangVien], [IDMonHoc], [SoLuong], [GhiChu]) VALUES (N'NMH0000000004', N'TK0000000009', N'MH0000000004', 4, NULL)
GO
INSERT [dbo].[NhomMonHoc] ([ID], [IDGiangVien], [IDMonHoc], [SoLuong], [GhiChu]) VALUES (N'NMH0000000005', N'TK0000000010', N'MH0000000005', 5, NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000001', N'NMH0000000001', N'BH0000000001', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000002', N'NMH0000000001', N'BH0000000002', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000003', N'NMH0000000001', N'BH0000000003', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000004', N'NMH0000000001', N'BH0000000004', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000005', N'NMH0000000001', N'BH0000000005', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000006', N'NMH0000000001', N'BH0000000006', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000007', N'NMH0000000002', N'BH0000000007', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000008', N'NMH0000000002', N'BH0000000008', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000009', N'NMH0000000002', N'BH0000000009', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000010', N'NMH0000000002', N'BH0000000010', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000011', N'NMH0000000002', N'BH0000000011', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000012', N'NMH0000000002', N'BH0000000012', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000013', N'NMH0000000003', N'BH0000000013', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000014', N'NMH0000000003', N'BH0000000014', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000015', N'NMH0000000003', N'BH0000000015', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000016', N'NMH0000000003', N'BH0000000016', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000017', N'NMH0000000003', N'BH0000000017', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000018', N'NMH0000000003', N'BH0000000018', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000019', N'NMH0000000004', N'BH0000000019', NULL)
GO
INSERT [dbo].[NhomMonHoc_BuoiHoc] ([ID], [IDNhomMonHoc], [IDBuoiHoc], [GhiChu]) VALUES (N'NMH_BH0000000020', N'NMH0000000004', N'BH0000000020', NULL)
GO
INSERT [dbo].[NhomMonHoc_SinhVien] ([ID], [IDSinhVien], [IDNhomMonHoc], [NgayDangKy], [GhiChu]) VALUES (N'NMH_SV0000000001', N'TK0000000001', N'NMH0000000001', CAST(N'2023-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomMonHoc_SinhVien] ([ID], [IDSinhVien], [IDNhomMonHoc], [NgayDangKy], [GhiChu]) VALUES (N'NMH_SV0000000002', N'TK0000000002', N'NMH0000000002', CAST(N'2023-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomMonHoc_SinhVien] ([ID], [IDSinhVien], [IDNhomMonHoc], [NgayDangKy], [GhiChu]) VALUES (N'NMH_SV0000000003', N'TK0000000003', N'NMH0000000003', CAST(N'2023-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomMonHoc_SinhVien] ([ID], [IDSinhVien], [IDNhomMonHoc], [NgayDangKy], [GhiChu]) VALUES (N'NMH_SV0000000004', N'TK0000000004', N'NMH0000000004', CAST(N'2023-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomMonHoc_SinhVien] ([ID], [IDSinhVien], [IDNhomMonHoc], [NgayDangKy], [GhiChu]) VALUES (N'NMH_SV0000000005', N'TK0000000005', N'NMH0000000005', CAST(N'2023-06-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[NhomNganh] ([ID], [IDKhoa], [Ten], [GhiChu]) VALUES (N'NN0000000001', N'K0000000001', N'CNTT', NULL)
GO
INSERT [dbo].[NhomNganh] ([ID], [IDKhoa], [Ten], [GhiChu]) VALUES (N'NN0000000002', N'K0000000001', N'KTPM', NULL)
GO
INSERT [dbo].[NhomNganh] ([ID], [IDKhoa], [Ten], [GhiChu]) VALUES (N'NN0000000003', N'K0000000002', N'QTKD', NULL)
GO
INSERT [dbo].[NhomNganh] ([ID], [IDKhoa], [Ten], [GhiChu]) VALUES (N'NN0000000004', N'K0000000001', N'CNOTO', NULL)
GO
INSERT [dbo].[NhomNganh] ([ID], [IDKhoa], [Ten], [GhiChu]) VALUES (N'NN0000000005', N'K0000000003', N'SUPH', NULL)
GO
INSERT [dbo].[QuyenTruyCap] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'QTC0000000001', N'Admin', 1, NULL)
GO
INSERT [dbo].[QuyenTruyCap] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'QTC0000000002', N'Co-Admin', 2, NULL)
GO
INSERT [dbo].[QuyenTruyCap] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'QTC0000000003', N'Support', 3, NULL)
GO
INSERT [dbo].[QuyenTruyCap] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'QTC0000000004', N'Lecturer', 4, NULL)
GO
INSERT [dbo].[QuyenTruyCap] ([ID], [Ten], [CapDo], [GhiChu]) VALUES (N'QTC0000000005', N'Student', 5, NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000001', N'TKB0000000001', N'L0000000001', N'Lê Triều Phương Hiếu', CAST(N'2003-05-22T00:00:00.000' AS DateTime), N'lehieulearn0@gmail.com', N'0908376890', N'Củ Chi', N'Nam', N'080203456478', N'Sinh Viên', N'QTC0000000001', N'ltphieu', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (1).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000002', N'TKB0000000002', N'L0000000002', N'Nguyễn Hoàng Bảo Vương', CAST(N'2003-06-22T00:00:00.000' AS DateTime), N'lehieulearn1@gmail.com', N'0908632541', N'Bình Dương', N'Nam', N'080203456512', N'Sinh Viên', N'QTC0000000005', N'admin1', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (2).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000003', N'TKB0000000003', N'L0000000003', N'Nguyễn Minh Khiêm', CAST(N'2003-05-19T00:00:00.000' AS DateTime), N'lehieulearn2@gmail.com', N'0978642512', N'Bình Dương', N'Nam', N'070287456478', N'Sinh Viên', N'QTC0000000005', N'iamadmin6969', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (3).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000004', N'TKB0000000004', N'L0000000004', N'Nguyễn Thành Nhân', CAST(N'2003-08-30T00:00:00.000' AS DateTime), N'lehieulearn3@gmail.com', N'0917632572', N'Củ Chi', N'Nam', N'090201646478', N'Sinh Viên', N'QTC0000000005', N'admin_45', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (4).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000005', N'TKB0000000005', N'L0000000005', N'Nguyễn Trung Đức', CAST(N'2003-05-30T00:00:00.000' AS DateTime), N'lehieulearn4@gmail.com', N'0908376890', N'Bình Dương', N'Nam', N'080203456478', N'Sinh Viên', N'QTC0000000005', N'taikhoan1', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (5).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000006', N'TKB0000000006', N'L0000000001', N'Nguyễn Quốc Đại', CAST(N'1987-05-22T00:00:00.000' AS DateTime), N'lehieulearn5@gmail.com', N'0908376890', N'Củ Chi', N'Nam', N'080203456478', N'Giảng Viên', N'QTC0000000001', N'daucatmoi123', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (3).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000007', N'TKB0000000007', N'L0000000002', N'Nguyễn Thị Kim Oanh', CAST(N'1987-06-22T00:00:00.000' AS DateTime), N'lehieulearn6@gmail.com', N'0908632541', N'Bình Dương', N'Nữ', N'080203456512', N'Giảng Viên', N'QTC0000000002', N'admin123', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (2).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000008', N'TKB0000000008', N'L0000000003', N'Nguyễn Thị Thu Thảo', CAST(N'1979-05-19T00:00:00.000' AS DateTime), N'lehieulearn7@gmail.com', N'0978642512', N'Bình Dương', N'Nữ', N'070287456478', N'Giảng Viên', N'QTC0000000003', N'iamadmin69', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (1).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000009', N'TKB0000000009', N'L0000000004', N'Lê Anh Đào', CAST(N'1990-08-30T00:00:00.000' AS DateTime), N'lehieulearn8@gmail.com', N'0917632572', N'Củ Chi', N'Nữ', N'090201646478', N'Giảng Viên', N'QTC0000000003', N'admin_456', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (4).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000010', N'TKB0000000010', N'L0000000005', N'Trần Anh Quốc', CAST(N'1992-05-30T00:00:00.000' AS DateTime), N'lehieulearn10@gmail.com', N'0908376890', N'Bình Dương', N'Nam', N'080203456478', N'Giảng Viên', N'QTC0000000003', N'taikhoan123', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (4).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000011', N'TKB0000000011', N'L0000000001', N'Lê Minh Việt', CAST(N'2003-05-22T00:00:00.000' AS DateTime), N'lehieulearn11@gmail.com', N'0908376890', N'Củ Chi', N'Nam', N'080203456478', N'Sinh Viên', N'QTC0000000005', N'leminhviet', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (1).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000012', N'TKB0000000012', N'L0000000001', N'Nguyễn Hoàng Kha', CAST(N'2003-06-22T00:00:00.000' AS DateTime), N'lehieulearn12@gmail.com', N'0908632541', N'Bình Dương', N'Nam', N'080203456512', N'Sinh Viên', N'QTC0000000005', N'nguyenhoankha', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (2).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000013', N'TKB0000000013', N'L0000000001', N'Nguyễn Minh Tâm', CAST(N'2003-05-19T00:00:00.000' AS DateTime), N'lehieulearn13@gmail.com', N'0978642512', N'Bình Dương', N'Nam', N'070287456478', N'Sinh Viên', N'QTC0000000005', N'nguyenminhtam', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (3).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000014', N'TKB0000000014', N'L0000000002', N'Nguyễn Minh Tú', CAST(N'2003-08-30T00:00:00.000' AS DateTime), N'lehieulearn14@gmail.com', N'0917632572', N'Củ Chi', N'Nam', N'090201646478', N'Sinh Viên', N'QTC0000000005', N'nguyenminhtu', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (4).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000015', N'TKB0000000015', N'L0000000002', N'Nguyễn Việt Hoàng', CAST(N'2003-05-30T00:00:00.000' AS DateTime), N'lehieulearn15@gmail.com', N'0908376890', N'Bình Dương', N'Nam', N'080203456478', N'Sinh Viên', N'QTC0000000005', N'nguyenviethoang', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (5).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000016', N'TKB0000000016', N'L0000000001', N'Hoàng Minh Việt', CAST(N'2003-05-22T00:00:00.000' AS DateTime), N'lehieulearn16@gmail.com', N'0908376890', N'Củ Chi', N'Nam', N'080203456478', N'Sinh Viên', N'QTC0000000005', N'tk16', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (1).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000017', N'TKB0000000017', N'L0000000004', N'Nguyễn Hoàng Mười', CAST(N'2003-06-22T00:00:00.000' AS DateTime), N'lehieulearn17@gmail.com', N'0908632541', N'Bình Dương', N'Nam', N'080203456512', N'Sinh Viên', N'QTC0000000005', N'tk17', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (2).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000018', N'TKB0000000018', N'L0000000003', N'Nguyễn Minh Phúc', CAST(N'2003-05-19T00:00:00.000' AS DateTime), N'lehieulearn18@gmail.com', N'0978642512', N'Bình Dương', N'Nam', N'070287456478', N'Sinh Viên', N'QTC0000000005', N'tk18', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (3).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000019', N'TKB0000000019', N'L0000000002', N'Nguyễn Lê Tuyết Nghi', CAST(N'2003-08-30T00:00:00.000' AS DateTime), N'lehieulearn19@gmail.com', N'0917632572', N'Củ Chi', N'Nam', N'090201646478', N'Sinh Viên', N'QTC0000000005', N'tk19', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (4).png', NULL)
GO
INSERT [dbo].[TaiKhoan] ([ID], [IDThoiKhoaBieu], [IDLop], [HoTen], [NgaySinh], [Email], [SDT], [DiaChi], [GioiTinh], [CCCD], [ChucVu], [IDQuyenTruyCap], [TenTaiKhoan], [MatKhau], [ImagePath], [GhiChu]) VALUES (N'TK0000000020', N'TKB0000000020', N'L0000000002', N'Nguyễn Việt Khâm', CAST(N'2003-05-30T00:00:00.000' AS DateTime), N'lehieulearn20@gmail.com', N'0908376890', N'Bình Dương', N'Nam', N'080203456478', N'Sinh Viên', N'QTC0000000005', N'tk20', N'827ccb0eea8a706c4c34a16891f84e7b', N'user (5).png', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000001', N'TK0000000001', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000002', N'TK0000000002', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000003', N'TK0000000003', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000004', N'TK0000000004', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000005', N'TK0000000005', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000006', N'TK0000000006', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000007', N'TK0000000007', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000008', N'TK0000000008', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000009', N'TK0000000009', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000010', N'TK0000000010', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000011', N'TK0000000011', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000012', N'TK0000000012', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000013', N'TK0000000013', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000014', N'TK0000000014', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000015', N'TK0000000015', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000016', N'TK0000000016', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000017', N'TK0000000017', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000018', N'TK0000000018', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000019', N'TK0000000019', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu] ([ID], [IDTaiKhoan], [GhiChu]) VALUES (N'TKB0000000020', N'TK0000000020', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000001', N'TKB0000000001', N'BH0000000001', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000002', N'TKB0000000002', N'BH0000000002', N'2', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000003', N'TKB0000000001', N'BH0000000003', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000004', N'TKB0000000001', N'BH0000000004', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000005', N'TKB0000000001', N'BH0000000005', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000006', N'TKB0000000001', N'BH0000000006', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000007', N'TKB0000000001', N'BH0000000007', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000008', N'TKB0000000001', N'BH0000000008', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000009', N'TKB0000000001', N'BH0000000009', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000010', N'TKB0000000001', N'BH0000000010', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000011', N'TKB0000000001', N'BH0000000011', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000012', N'TKB0000000001', N'BH0000000012', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000013', N'TKB0000000001', N'BH0000000013', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000014', N'TKB0000000001', N'BH0000000014', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000015', N'TKB0000000001', N'BH0000000015', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000016', N'TKB0000000001', N'BH0000000016', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000017', N'TKB0000000001', N'BH0000000017', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000018', N'TKB0000000001', N'BH0000000018', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000019', N'TKB0000000001', N'BH0000000019', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000020', N'TKB0000000001', N'BH0000000020', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000021', N'TKB0000000003', N'BH0000000003', N'3', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000022', N'TKB0000000004', N'BH0000000004', N'4', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000023', N'TKB0000000005', N'BH0000000005', N'5', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000024', N'TKB0000000006', N'BH0000000001', N'1', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000025', N'TKB0000000007', N'BH0000000002', N'2', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000026', N'TKB0000000008', N'BH0000000003', N'3', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000027', N'TKB0000000009', N'BH0000000004', N'4', NULL)
GO
INSERT [dbo].[ThoiKhoaBieu_BuoiHoc] ([ID], [IDThoiKhoaBieu], [IDBuoiHoc], [NgayThu], [GhiChu]) VALUES (N'TKB_BH0000000028', N'TKB0000000010', N'BH0000000005', N'5', NULL)
GO
INSERT [dbo].[ThongBao] ([ID], [IDLoaiThongBao], [TieuDe], [NoiDung], [GhiChu]) VALUES (N'TB0000000001', N'LTB0000000001', N'Thông báo nhắc nợ học phí học kỳ I (NH 2023 - 2024)', N'Viện Kỹ thuật - Công nghệ kính gửi Quý Thầy/Cô và Mến gửi các em sinh viên văn bản đến số 102/TB-ĐHTDM ngày 26/10/2023 Thông báo nhắc nợ học phí học kỳ I năm học 2023-2024.Thời gian thu nợ học phí từ ngày 26/10/2023 đến ngày 06/11/2023.', NULL)
GO
INSERT [dbo].[ThongBao] ([ID], [IDLoaiThongBao], [TieuDe], [NoiDung], [GhiChu]) VALUES (N'TB0000000002', N'LTB0000000002', N'Về việc tổ chức Kỳ thi cấp chứng chỉ năng lực Tiếng Anh EPT-TDMU ', N'thông báo về việc tổ chức Kỳ thi cấp chứng chỉ năng lực Tiếng Anh EPT-TDMU khóa ngày 05/11/2023. Thời gian thi: Cả ngày 05/11/2023 (Chủ nhật)', NULL)
GO
INSERT [dbo].[ThongBao] ([ID], [IDLoaiThongBao], [TieuDe], [NoiDung], [GhiChu]) VALUES (N'TB0000000003', N'LTB0000000003', N'ĐĂNG KÝ THAM GIA CHƯƠNG TRÌNH TẬP HUẤN KỸ NĂNG', N'Kỹ thuật - Công nghệ tổ chức chương trình tập huấn kỹ năng CÁC XU THẾ CÔNG NGHỆ VÀ ỨNG DỤNG CÔNG NGHỆ BLOCKCHAIN VÀO SẢN PHẨM SỐ. Thời gian: 7h00, Sáng thứ Bảy, ngày 11/11/2023', NULL)
GO
INSERT [dbo].[ThongBao] ([ID], [IDLoaiThongBao], [TieuDe], [NoiDung], [GhiChu]) VALUES (N'TB0000000004', N'LTB0000000001', N'NHẮC NHỞ CÀI ĐẶT APP THANH NIÊN VÀ HOÀN THÀNH THI NGHỊ QUYẾT ĐẠI HỘI ĐOÀN', N'Đề nghị các đoàn viên chi đoàn chưa thực hiện cài đặt app Thanh niên nhanh chóng thực hiện cài đặt app Thanh niên và hoàn thành thi nghị quyết(Có danh sách đính kèm). Ban Chấp hành các chi đoàn nhắc nhở đoàn viên chi đoàn mình hoàn thành.', NULL)
GO
INSERT [dbo].[ThongBao] ([ID], [IDLoaiThongBao], [TieuDe], [NoiDung], [GhiChu]) VALUES (N'TB0000000005', N'LTB0000000001', N'Thông báo đăng ký học Ngoại ngữ không chuyên HK1 (đợt 2)', N'Đăng ký học đúng theo các nội dung trong thông báo (file kèm theo)', NULL)
GO
INSERT [dbo].[ThongBao] ([ID], [IDLoaiThongBao], [TieuDe], [NoiDung], [GhiChu]) VALUES (N'TB0000000006', N'LTB0000000003', N'tttr', N'<p>ttrt</p>', N'')
GO
INSERT [dbo].[ThongBao_NguoiChinhSua] ([ID], [IDThongBao], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'TB_NCS0000000001', N'TB0000000001', N'TK0000000001', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiChinhSua] ([ID], [IDThongBao], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'TB_NCS0000000002', N'TB0000000002', N'TK0000000002', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiChinhSua] ([ID], [IDThongBao], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'TB_NCS0000000003', N'TB0000000002', N'TK0000000003', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiChinhSua] ([ID], [IDThongBao], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'TB_NCS0000000004', N'TB0000000001', N'TK0000000004', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiChinhSua] ([ID], [IDThongBao], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'TB_NCS0000000005', N'TB0000000001', N'TK0000000005', CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiChinhSua] ([ID], [IDThongBao], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'TB_NCS0000000006', N'TB0000000005', N'TK0000000002', CAST(N'2023-06-23T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiChinhSua] ([ID], [IDThongBao], [IDNguoiChinhSua], [NgayChinhSua], [GhiChu]) VALUES (N'TB_NCS0000000007', N'TB0000000006', N'TK0000000001', CAST(N'2023-12-22T14:12:41.030' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000001', N'TB0000000001', N'TK0000000001', CAST(N'2023-04-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000002', N'TB0000000002', N'TK0000000002', CAST(N'2023-07-25T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000003', N'TB0000000002', N'TK0000000003', CAST(N'2023-02-24T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000004', N'TB0000000002', N'TK0000000004', CAST(N'2023-01-22T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000005', N'TB0000000005', N'TK0000000005', CAST(N'2023-02-20T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000006', N'TB0000000006', N'TK0000000001', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000007', N'TB0000000006', N'TK0000000002', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000008', N'TB0000000006', N'TK0000000003', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000009', N'TB0000000006', N'TK0000000004', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000010', N'TB0000000006', N'TK0000000006', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000011', N'TB0000000006', N'TK0000000007', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000012', N'TB0000000006', N'TK0000000008', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000013', N'TB0000000006', N'TK0000000009', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000014', N'TB0000000006', N'TK0000000011', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000015', N'TB0000000006', N'TK0000000012', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000016', N'TB0000000006', N'TK0000000013', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000017', N'TB0000000006', N'TK0000000014', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000018', N'TB0000000006', N'TK0000000015', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000019', N'TB0000000006', N'TK0000000016', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000020', N'TB0000000006', N'TK0000000017', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000021', N'TB0000000006', N'TK0000000018', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000022', N'TB0000000006', N'TK0000000019', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[ThongBao_NguoiNhan] ([ID], [IDThongBao], [IDNguoiNhan], [NgayNhan], [GhiChu]) VALUES (N'TB_NN0000000023', N'TB0000000006', N'TK0000000020', CAST(N'2023-12-22T14:12:41.047' AS DateTime), N'')
GO
INSERT [dbo].[TinNhan] ([ID], [IDTaiKhoan], [NoiDung], [NgayGui], [GhiChu]) VALUES (N'TN0000000001', N'TK0000000004', N'Hello', CAST(N'2023-04-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[TinNhan] ([ID], [IDTaiKhoan], [NoiDung], [NgayGui], [GhiChu]) VALUES (N'TN0000000002', N'TK0000000001', N'Xin chào b?n', CAST(N'2023-04-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[TinNhan] ([ID], [IDTaiKhoan], [NoiDung], [NgayGui], [GhiChu]) VALUES (N'TN0000000003', N'TK0000000002', N'B?n kh?e không?', CAST(N'2023-04-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[TinNhan] ([ID], [IDTaiKhoan], [NoiDung], [NgayGui], [GhiChu]) VALUES (N'TN0000000004', N'TK0000000003', N'Không có gì', CAST(N'2023-04-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[TinNhan] ([ID], [IDTaiKhoan], [NoiDung], [NgayGui], [GhiChu]) VALUES (N'TN0000000005', N'TK0000000002', N'T? ?n!', CAST(N'2023-04-10T00:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[TinNhan_GuiDen] ([ID], [IDTinNhan], [IDNguoiNhan], [IDNhomNhan], [DaXem], [GhiChu]) VALUES (N'TN_GD0000000001', N'TN0000000001', N'TK0000000001', N'NC0000000001', 1, NULL)
GO
INSERT [dbo].[TinNhan_GuiDen] ([ID], [IDTinNhan], [IDNguoiNhan], [IDNhomNhan], [DaXem], [GhiChu]) VALUES (N'TN_GD0000000002', N'TN0000000002', N'TK0000000003', N'NC0000000002', 1, NULL)
GO
INSERT [dbo].[TinNhan_GuiDen] ([ID], [IDTinNhan], [IDNguoiNhan], [IDNhomNhan], [DaXem], [GhiChu]) VALUES (N'TN_GD0000000003', N'TN0000000003', N'TK0000000004', N'NC0000000003', 1, NULL)
GO
INSERT [dbo].[TinNhan_GuiDen] ([ID], [IDTinNhan], [IDNguoiNhan], [IDNhomNhan], [DaXem], [GhiChu]) VALUES (N'TN_GD0000000004', N'TN0000000004', N'TK0000000004', N'NC0000000004', 1, NULL)
GO
INSERT [dbo].[TinNhan_GuiDen] ([ID], [IDTinNhan], [IDNguoiNhan], [IDNhomNhan], [DaXem], [GhiChu]) VALUES (N'TN_GD0000000005', N'TN0000000005', N'TK0000000001', N'NC0000000005', 1, NULL)
GO
INSERT [dbo].[TLBaiViet] ([ID], [Ten], [GhiChu]) VALUES (N'TLBV0000000001', N'Tin tức', NULL)
GO
INSERT [dbo].[TLBaiViet] ([ID], [Ten], [GhiChu]) VALUES (N'TLBV0000000002', N'Hoạt động', NULL)
GO
INSERT [dbo].[TLBaiViet] ([ID], [Ten], [GhiChu]) VALUES (N'TLBV0000000003', N'Sự kiện', NULL)
GO
ALTER TABLE [dbo].[QuyenTruyCap] ADD  DEFAULT ((3)) FOR [CapDo]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([IDTLBaiViet])
REFERENCES [dbo].[TLBaiViet] ([ID])
GO
ALTER TABLE [dbo].[BaiViet_NguoiChinhSua]  WITH CHECK ADD FOREIGN KEY([IDBaiViet])
REFERENCES [dbo].[BaiViet] ([ID])
GO
ALTER TABLE [dbo].[BaiViet_NguoiChinhSua]  WITH CHECK ADD FOREIGN KEY([IDNguoiChinhSua])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[BaiViet_NguoiThamGia]  WITH CHECK ADD FOREIGN KEY([IDBaiViet])
REFERENCES [dbo].[BaiViet] ([ID])
GO
ALTER TABLE [dbo].[BaiViet_NguoiThamGia]  WITH CHECK ADD FOREIGN KEY([IDNguoiThamGia])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[BangDiem]  WITH CHECK ADD FOREIGN KEY([IDMonHoc])
REFERENCES [dbo].[MonHoc] ([ID])
GO
ALTER TABLE [dbo].[BangDiem]  WITH CHECK ADD FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[CauHoi]  WITH CHECK ADD FOREIGN KEY([IDNguoiGui])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_ChuDeCauHoi]  WITH CHECK ADD FOREIGN KEY([IDCauHoi])
REFERENCES [dbo].[CauHoi] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_ChuDeCauHoi]  WITH CHECK ADD FOREIGN KEY([IDChuDeCauHoi])
REFERENCES [dbo].[ChuDeCauHoi] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_NguoiDanhGia]  WITH CHECK ADD FOREIGN KEY([IDCauHoi])
REFERENCES [dbo].[CauHoi] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_NguoiDanhGia]  WITH CHECK ADD FOREIGN KEY([IDNguoiDanhGia])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_NguoiTraLoi]  WITH CHECK ADD FOREIGN KEY([IDCauHoi])
REFERENCES [dbo].[CauHoi] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_NguoiTraLoi]  WITH CHECK ADD FOREIGN KEY([IDNguoiTraLoi])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi]  WITH CHECK ADD FOREIGN KEY([IDCauHoi_NguoiTraLoi])
REFERENCES [dbo].[CauHoi_NguoiTraLoi] ([ID])
GO
ALTER TABLE [dbo].[CauHoi_NguoiTraLoi_NguoiTraLoi]  WITH CHECK ADD FOREIGN KEY([IDNguoiTraLoi])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[DiemRenLuyen]  WITH CHECK ADD FOREIGN KEY([IDHocKy])
REFERENCES [dbo].[HocKy] ([ID])
GO
ALTER TABLE [dbo].[DiemRenLuyen]  WITH CHECK ADD FOREIGN KEY([IDNamHoc])
REFERENCES [dbo].[NamHoc] ([ID])
GO
ALTER TABLE [dbo].[DiemRenLuyen]  WITH CHECK ADD FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD FOREIGN KEY([IDGiangVien])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[Lop]  WITH CHECK ADD FOREIGN KEY([IDNhomNganh])
REFERENCES [dbo].[NhomNganh] ([ID])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([IDHocKy])
REFERENCES [dbo].[HocKy] ([ID])
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD FOREIGN KEY([IDNamHoc])
REFERENCES [dbo].[NamHoc] ([ID])
GO
ALTER TABLE [dbo].[NhomChat_NguoiThamGia]  WITH CHECK ADD FOREIGN KEY([IDNguoiThamGia])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[NhomChat_NguoiThamGia]  WITH CHECK ADD FOREIGN KEY([IDNhomChat])
REFERENCES [dbo].[NhomChat] ([ID])
GO
ALTER TABLE [dbo].[NhomMonHoc]  WITH CHECK ADD FOREIGN KEY([IDGiangVien])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[NhomMonHoc]  WITH CHECK ADD FOREIGN KEY([IDMonHoc])
REFERENCES [dbo].[MonHoc] ([ID])
GO
ALTER TABLE [dbo].[NhomMonHoc_BuoiHoc]  WITH CHECK ADD FOREIGN KEY([IDBuoiHoc])
REFERENCES [dbo].[BuoiHoc] ([ID])
GO
ALTER TABLE [dbo].[NhomMonHoc_BuoiHoc]  WITH CHECK ADD FOREIGN KEY([IDNhomMonHoc])
REFERENCES [dbo].[NhomMonHoc] ([ID])
GO
ALTER TABLE [dbo].[NhomMonHoc_SinhVien]  WITH CHECK ADD FOREIGN KEY([IDNhomMonHoc])
REFERENCES [dbo].[NhomMonHoc] ([ID])
GO
ALTER TABLE [dbo].[NhomMonHoc_SinhVien]  WITH CHECK ADD FOREIGN KEY([IDSinhVien])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[NhomNganh]  WITH CHECK ADD FOREIGN KEY([IDKhoa])
REFERENCES [dbo].[Khoa] ([ID])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([IDLop])
REFERENCES [dbo].[Lop] ([ID])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([IDQuyenTruyCap])
REFERENCES [dbo].[QuyenTruyCap] ([ID])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([IDThoiKhoaBieu])
REFERENCES [dbo].[ThoiKhoaBieu] ([ID])
GO
ALTER TABLE [dbo].[ThoiKhoaBieu]  WITH CHECK ADD FOREIGN KEY([IDTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[ThoiKhoaBieu_BuoiHoc]  WITH CHECK ADD FOREIGN KEY([IDBuoiHoc])
REFERENCES [dbo].[BuoiHoc] ([ID])
GO
ALTER TABLE [dbo].[ThoiKhoaBieu_BuoiHoc]  WITH CHECK ADD FOREIGN KEY([IDThoiKhoaBieu])
REFERENCES [dbo].[ThoiKhoaBieu] ([ID])
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD FOREIGN KEY([IDLoaiThongBao])
REFERENCES [dbo].[LoaiThongBao] ([ID])
GO
ALTER TABLE [dbo].[ThongBao_NguoiChinhSua]  WITH CHECK ADD FOREIGN KEY([IDNguoiChinhSua])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[ThongBao_NguoiChinhSua]  WITH CHECK ADD FOREIGN KEY([IDThongBao])
REFERENCES [dbo].[ThongBao] ([ID])
GO
ALTER TABLE [dbo].[ThongBao_NguoiNhan]  WITH CHECK ADD FOREIGN KEY([IDNguoiNhan])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[ThongBao_NguoiNhan]  WITH CHECK ADD FOREIGN KEY([IDThongBao])
REFERENCES [dbo].[ThongBao] ([ID])
GO
ALTER TABLE [dbo].[TinNhan]  WITH CHECK ADD FOREIGN KEY([IDTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[TinNhan_GuiDen]  WITH CHECK ADD FOREIGN KEY([IDNguoiNhan])
REFERENCES [dbo].[TaiKhoan] ([ID])
GO
ALTER TABLE [dbo].[TinNhan_GuiDen]  WITH CHECK ADD FOREIGN KEY([IDNhomNhan])
REFERENCES [dbo].[NhomChat] ([ID])
GO
ALTER TABLE [dbo].[TinNhan_GuiDen]  WITH CHECK ADD FOREIGN KEY([IDTinNhan])
REFERENCES [dbo].[TinNhan] ([ID])
GO
