-- create database
use master
create database TDMUAppDB
go

use TDMUAppDB
go

-- create table

create table Khoa
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	GhiChu nvarchar(500),
)

create table NhomNganh
(
	ID varchar(50) primary key,
	IDKhoa varchar(50),
	Ten nvarchar(500),
	GhiChu nvarchar(500),
)

create table Lop
(
	ID varchar(50) primary key,
	IDGiangVien varchar(50),
	IDNhomNganh varchar(50),
	GhiChu nvarchar(500),
)

create table HocKy
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	GhiChu nvarchar(500),
)

create table NamHoc
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	GhiChu nvarchar(500),
)

create table MonHoc
(
	ID varchar(50) primary key,
	IDHocKy varchar(50),
	IDNamHoc varchar(50),
	Ten nvarchar(500),
	SoTC int,
	GhiChu nvarchar(500),
)

create table QuyenTruyCap
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	CapDo int not null default(3),
	GhiChu nvarchar(500),
)

create table TaiKhoan
(
	ID varchar(50) primary key,
	IDThoiKhoaBieu varchar(50),
	IDLop varchar(50),
	HoTen nvarchar(500),
	NgaySinh datetime,
	Email varchar(max),
	SDT varchar(50),
	DiaChi nvarchar(500),
	GioiTinh nvarchar(50),
	CCCD varchar(50),
	ChucVu nvarchar(500),
	IDQuyenTruyCap varchar(50) not null,
	TenTaiKhoan nvarchar(500),
	MatKhau varchar(max),
	ImagePath varchar(max),
	GhiChu nvarchar(500),
)

create table BuoiHoc
(
	ID varchar(50) primary key,
	NgayDienRa datetime,
	NgayKetThuc datetime,
	SoTiet int,
	Phong nvarchar(500),
	GhiChu nvarchar(500),
)

create table BangDiem
(	
	ID varchar(50) primary key,
	IDSinhVien varchar(50),
	IDMonHoc varchar(50),
	DiemGiuaKy float,
	DiemCuoiKy float,
	DiemTongKet float,
	GhiChu nvarchar(500),
)

create table NhomMonHoc
(
	ID varchar(50) primary key,
	IDGiangVien varchar(50),
	IDMonHoc varchar(50),
	SoLuong int,
	GhiChu nvarchar(500),
)

create table NhomMonHoc_SinhVien -- DK
(
	ID varchar(50) primary key,
	IDSinhVien varchar(50),
	IDNhomMonHoc varchar(50),
	NgayDangKy datetime,
	GhiChu nvarchar(500),
)

create table NhomMonHoc_BuoiHoc -- CT
(
	ID varchar(50) primary key,
	IDNhomMonHoc varchar(50),
	IDBuoiHoc varchar(50),
	GhiChu nvarchar(500),
)

create table DiemRenLuyen
(
	ID varchar(50) primary key,
	IDSinhVien varchar(50),
	IDHocKy varchar(50),
	IDNamHoc varchar(50),
	TongDiem int,
	GhiChu nvarchar(500),
)

create table ThoiKhoaBieu
(
	ID varchar(50) primary key,
	IDTaiKhoan varchar(50),
	GhiChu nvarchar(500),
)

create table ThoiKhoaBieu_BuoiHoc
(
	ID varchar(50) primary key,
	IDThoiKhoaBieu varchar(50),
	IDBuoiHoc varchar(50),
	NgayThu nvarchar(500),
	GhiChu nvarchar(500),
)

create table LoaiThongBao
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	CapDo int,
	GhiChu nvarchar(500),
)

create table ThongBao
(
	ID varchar(50) primary key,
	IDLoaiThongBao varchar(50),
	TieuDe nvarchar(500),
	NoiDung nvarchar(500),
	GhiChu nvarchar(500),
)

create table ThongBao_NguoiNhan
(
	ID varchar(50) primary key,
	IDThongBao varchar(50),
	IDNguoiNhan varchar(50),
	NgayNhan datetime,
	GhiChu nvarchar(500),
)

create table ThongBao_NguoiChinhSua
(
	ID varchar(50) primary key,
	IDThongBao varchar(50),
	IDNguoiChinhSua varchar(50),
	NgayChinhSua datetime,
	GhiChu nvarchar(500),
)

create table TLBaiViet
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	GhiChu nvarchar(500),
)

create table BaiViet
(
	ID varchar(50) primary key,
	IDTLBaiViet varchar(50),
	TieuDe nvarchar(500),
	NoiDung nvarchar(500),
	ImagePath varchar(max),
	GhiChu nvarchar(500),
)

create table BaiViet_NguoiChinhSua -- Dang bai/chinh sua
(
	ID varchar(50) primary key,
	IDBaiViet varchar(50),
	IDNguoiChinhSua varchar(50),
	NgayChinhSua datetime,
	GhiChu nvarchar(500),
)

create table BaiViet_NguoiThamGia
(
	ID varchar(50) primary key,
	IDBaiViet varchar(50),
	IDNguoiThamGia varchar(50),
	NgayDangKy datetime,
	GhiChu nvarchar(500),
)

create table NhomChat
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	NgayTao datetime,
	GhiChu nvarchar(500),
)

create table NhomChat_NguoiThamGia -- thonng tin nguoi tham gia
(
	ID varchar(50) primary key,
	IDNhomChat varchar(50),
	IDNguoiThamGia varchar(50),
	NgayThamGia datetime,
	GhiChu nvarchar(500),
)

create table TinNhan
(
	ID varchar(50) primary key,
	IDTaiKhoan varchar(50),
	NoiDung varchar(500),
	NgayGui datetime,
	GhiChu nvarchar(500),
)

create table TinNhan_GuiDen -- Tin nhan duoc gui di
(
	ID varchar(50) primary key,
	IDTinNhan varchar(50),
	IDNguoiNhan varchar(50),
	IDNhomNhan varchar(50),
	DaXem int,
	GhiChu nvarchar(500),
)

create table ChuDeCauHoi
(
	ID varchar(50) primary key,
	Ten nvarchar(500),
	GhiChu nvarchar(500),
)

create table CauHoi
(
	ID varchar(50) primary key,
	IDNguoiGui varchar(50),
	TieuDe nvarchar(500),
	NoiDung nvarchar(500),
	NgayGui datetime,
	DuocDuyet int,
	GhiChu nvarchar(500),
)

create table CauHoi_ChuDeCauHoi
(
	ID varchar(50) primary key,
	IDCauHoi varchar(50),
	IDChuDeCauHoi varchar(50),
	GhiChu nvarchar(500),
)

create table CauHoi_NguoiTraLoi
(
	ID varchar(50) primary key,
	IDCauHoi varchar(50),
	IDNguoiTraLoi varchar(50),
	NoiDung nvarchar(500),
	NgayTraLoi datetime,
	GhiChu nvarchar(500),
)

create table CauHoi_NguoiTraLoi_NguoiTraLoi
(
	ID varchar(50) primary key,
	IDCauHoi_NguoiTraLoi varchar(50),
	IDNguoiTraLoi varchar(50),
	NoiDung nvarchar(500),
	NgayTraLoi datetime,
	GhiChu nvarchar(500),
)

create table CauHoi_NguoiDanhGia
(
	ID varchar(50) primary key,
	IDCauHoi varchar(50),
	IDNguoiDanhGia varchar(50),
	HuuIch int,
	NgayDanhGia datetime,
	GhiChu nvarchar(500),
)

-- ============================================

use TDMUAppDB
go

-- DATA

insert into Khoa
values ('K0000000001', N'Kỹ thuật - công nghệ', null),
	('K0000000002', N'Kinh tế', null),
	('K0000000003', N'Khoa học quản lý', null);

insert into NhomNganh
values ('NN0000000001', 'K0000000001', N'CNTT', null),
	('NN0000000002', 'K0000000001', N'KTPM', null),
	('NN0000000003', 'K0000000002', N'QTKD', null),
	('NN0000000004', 'K0000000001', N'CNOTO', null),
	('NN0000000005', 'K0000000003', N'SUPH', null);

insert into Lop
values ('L0000000001', 'TK0000000001', 'NN0000000001', null),
	('L0000000002', 'TK0000000002', 'NN0000000001', null),
	('L0000000003', 'TK0000000003', 'NN0000000001', null),
	('L0000000004', 'TK0000000004', 'NN0000000002', null),
	('L0000000005', 'TK0000000005', 'NN0000000003', null)

insert into HocKy
values ('HK0000000001', N'Học kỳ 1', null),
	('HK0000000002', N'Học kỳ 2', null),
	('HK0000000003', N'Học kỳ 3', null);

insert into NamHoc
values ('NH0000000001', N'Năm nhất', null),
	('NH0000000002', N'Năm hai', null),
	('NH0000000003', N'Năm ba', null),
	('NH0000000004', N'Năm tư', null),
	('NH0000000005', N'Năm năm', null);

insert into MonHoc
values ('MH0000000001', 'HK0000000001', 'NH0000000001', N'Kỹ thuật phần mềm', '3', null),
	('MH0000000002', 'HK0000000001', 'NH0000000001', N'Kinh tế chính trị', '2', null),
	('MH0000000003', 'HK0000000001', 'NH0000000001', N'Mạng máy tính', '3', null),
	('MH0000000004', 'HK0000000001', 'NH0000000001', N'Triết học', '2', null),
	('MH0000000005', 'HK0000000001', 'NH0000000001', N'Pháp luật', '3', null),
	('MH0000000006', 'HK0000000002', 'NH0000000001', N'KT Đông Nam Bộ', '2', null),
	('MH0000000007', 'HK0000000002', 'NH0000000001', N'Kỹ thuật lập trình', '3', null),
	('MH0000000008', 'HK0000000002', 'NH0000000001', N'Cơ sở dữ liệu', '2', null),
	('MH0000000009', 'HK0000000002', 'NH0000000001', N'Hệ QT CSDL', '3', null),
	('MH0000000010', 'HK0000000002', 'NH0000000001', N'Tư tưởng HCM', '2', null),
	('MH0000000011', 'HK0000000003', 'NH0000000001', N'Cơ sở lập trình', '3', null),
	('MH0000000012', 'HK0000000003', 'NH0000000001', N'Đồ án cơ sở ngành', '2', null),
	('MH0000000013', 'HK0000000003', 'NH0000000001', N'Xác suất thống kê', '3', null),
	('MH0000000014', 'HK0000000003', 'NH0000000001', N'Toán cao cấp 1', '2', null),
	('MH0000000015', 'HK0000000003', 'NH0000000001', N'Toán cao cấp 2', '3', null),
	-- Nam thu 2
	('MH0000000016', 'HK0000000001', 'NH0000000002', N'Toán rời rạc', '3', null),
	('MH0000000017', 'HK0000000001', 'NH0000000002', N'Tư duy biện luận', '2', null),
	('MH0000000018', 'HK0000000001', 'NH0000000002', N'Vật lý đại cương', '3', null),
	('MH0000000019', 'HK0000000001', 'NH0000000002', N'Lập trình web', '2', null),
	('MH0000000020', 'HK0000000001', 'NH0000000002', N'TH Lập trình web', '2', null),
	('MH0000000021', 'HK0000000002', 'NH0000000002', N'Cấu trúc DL và giải thuật', '3', null),
	('MH0000000022', 'HK0000000002', 'NH0000000002', N'TH Cấu trúc DL và giải thuật', '4', null),
	('MH0000000023', 'HK0000000002', 'NH0000000002', N'Đổi mới, sáng tạo và khởi nghiệp', '3', null),
	('MH0000000024', 'HK0000000002', 'NH0000000002', N'PP lập trình hướng đối tượng', '3', null),
	('MH0000000025', 'HK0000000002', 'NH0000000002', N'TH PP lập trình hướng đối tượng', '3', null),
	('MH0000000026', 'HK0000000003', 'NH0000000002', N'Phân tích thiết kế', '4', null),
	('MH0000000027', 'HK0000000003', 'NH0000000002', N'TH Phân tích thiết kế', '3', null),
	('MH0000000028', 'HK0000000003', 'NH0000000002', N'Lập trình window', '1', null),
	('MH0000000029', 'HK0000000003', 'NH0000000002', N'TH Lập trình window', '3', null),
	('MH0000000030', 'HK0000000003', 'NH0000000002', N'Phương pháp NCKH', '3', null),
	-- Nam thu 3
	('MH0000000031', 'HK0000000001', 'NH0000000003', N'An ninh mạng', '2', null),
	('MH0000000032', 'HK0000000001', 'NH0000000003', N'CN XHKH', '2', null),
	('MH0000000033', 'HK0000000001', 'NH0000000003', N'Thiết kế web', '2', null),
	('MH0000000034', 'HK0000000001', 'NH0000000003', N'TH Thiết kế web', '2', null),
	('MH0000000035', 'HK0000000001', 'NH0000000003', N'Lý thuyết đồ thị', '2', null),
	('MH0000000036', 'HK0000000002', 'NH0000000003', N'TH Lý thuyết đồ thị', '2', null),
	('MH0000000037', 'HK0000000002', 'NH0000000003', N'Hệ điều hành', '2', null),
	('MH0000000038', 'HK0000000002', 'NH0000000003', N'TH Hệ điều hành', '2', null),
	('MH0000000039', 'HK0000000002', 'NH0000000003', N'LS Đảng CSVN', '2', null),
	('MH0000000040', 'HK0000000002', 'NH0000000003', N'Công nghệ phần mềm', '2', null),
	('MH0000000041', 'HK0000000003', 'NH0000000003', N'TH Công nghệ phần mềm', '2', null),
	('MH0000000042', 'HK0000000003', 'NH0000000003', N'Kiến trúc máy tính', '2', null),
	('MH0000000043', 'HK0000000003', 'NH0000000003', N'Quản trị dự án CNTT', '2', null),
	('MH0000000044', 'HK0000000003', 'NH0000000003', N'Quản trị Marketing', '2', null),
	('MH0000000045', 'HK0000000003', 'NH0000000003', N'Trí tuệ nhân tạo', '3', null),
	-- Nam thu 4
	('MH0000000046', 'HK0000000001', 'NH0000000004', N'TH An ninh mạng', '2', null),
	('MH0000000047', 'HK0000000001', 'NH0000000004', N'Chuyên đề sử lý dữ liệu lớn', '3', null),
	('MH0000000048', 'HK0000000001', 'NH0000000004', N'TH Chuyên đề sử lý dữ liệu lớn', '2', null),
	('MH0000000049', 'HK0000000001', 'NH0000000004', N'Chuyên đề IOT', '2', null),
	('MH0000000050', 'HK0000000001', 'NH0000000004', N'TH Chuyên đề IOT', '4', null),
	('MH0000000051', 'HK0000000002', 'NH0000000004', N'Điện toán đám mây', '2', null),
	('MH0000000052', 'HK0000000002', 'NH0000000004', N'TH Điện toán đám mây', '4', null),
	('MH0000000053', 'HK0000000002', 'NH0000000004', N'Phát triển ứng dụng di động', '2', null),
	('MH0000000054', 'HK0000000002', 'NH0000000004', N'TH Phát triển ứng dụng di động', '3', null),
	('MH0000000055', 'HK0000000002', 'NH0000000004', N'Quản trị hệ thống', '3', null),
	('MH0000000056', 'HK0000000003', 'NH0000000004', N'TH Quản trị hệ thống', '2', null),
	('MH0000000057', 'HK0000000003', 'NH0000000004', N'Phát triển phầm mềm mã nguồn mở', '3', null),
	('MH0000000058', 'HK0000000003', 'NH0000000004', N'TH Phát triển phầm mềm mã nguồn mở', '2', null),
	('MH0000000059', 'HK0000000003', 'NH0000000004', N'Đồ án chuyên ngành', '3', null),
	('MH0000000060', 'HK0000000003', 'NH0000000004', N'TH Đồ án chuyên ngành', '3', null),

	-- Nam thu 5
	('MH0000000061', 'HK0000000001', 'NH0000000005', N'Kiểm thử xâm nhập', '2', null),
	('MH0000000062', 'HK0000000001', 'NH0000000005', N'TH Kiểm thử xâm nhập', '3', null),
	('MH0000000063', 'HK0000000001', 'NH0000000005', N'An toàn ứng dụng', '2', null),
	('MH0000000064', 'HK0000000001', 'NH0000000005', N'TH An toàn ứng dụng', '2', null),
	('MH0000000065', 'HK0000000001', 'NH0000000005', N'Thực tập doanh nghiệp', '4', null),
	('MH0000000066', 'HK0000000002', 'NH0000000005', N'Thực tập tốt nghiệp', '2', null),
	('MH0000000067', 'HK0000000002', 'NH0000000005', N'Báo cáo tốt nghiệp', '4', null),
	('MH0000000068', 'HK0000000002', 'NH0000000005', N'Đồ án tốt nghiệp', '2', null),
	('MH0000000069', 'HK0000000002', 'NH0000000005', N'Tiếng Anh', '3', null),
	('MH0000000070', 'HK0000000002', 'NH0000000005', N'Tiếng Trung', '3', null),
	('MH0000000071', 'HK0000000003', 'NH0000000005', N'Kỹ năng XH', '2', null),
	('MH0000000072', 'HK0000000003', 'NH0000000005', N'TH CSLT', '3', null),
	('MH0000000073', 'HK0000000003', 'NH0000000005', N'TH Vật lý', '2', null),
	('MH0000000074', 'HK0000000003', 'NH0000000005', N'Nhập môn CNTT', '3', null),
	('MH0000000075', 'HK0000000003', 'NH0000000005', N'TH Nhập môn CNTT', '3', null);

insert into QuyenTruyCap
values ('QTC0000000001', 'Admin', '1', null),
	('QTC0000000002', 'Co-Admin', '2', null),
	('QTC0000000003', 'Support', '3', null),
	('QTC0000000004', 'Lecturer', '4', null),
	('QTC0000000005', 'Student', '5', null);

insert into TaiKhoan
values ('TK0000000001', 'TKB0000000001', 'L0000000001', N'Lê Triều Phương Hiếu', '2003/05/22', 'lehieulearn0@gmail.com', '0908376890', N'Củ Chi', N'Nam', '080203456478', N'Sinh Viên', 'QTC0000000001', 'ltphieu', '827ccb0eea8a706c4c34a16891f84e7b', 'user (1).png', null),
	('TK0000000002', 'TKB0000000002', 'L0000000002', N'Nguyễn Hoàng Bảo Vương', '2003/06/22', 'lehieulearn1@gmail.com', '0908632541', N'Bình Dương', N'Nam', '080203456512', N'Sinh Viên', 'QTC0000000005', 'admin1', '827ccb0eea8a706c4c34a16891f84e7b', 'user (2).png', null),
	('TK0000000003', 'TKB0000000003', 'L0000000003', N'Nguyễn Minh Khiêm', '2003/05/19', 'lehieulearn2@gmail.com', '0978642512', N'Bình Dương', N'Nam', '070287456478', N'Sinh Viên', 'QTC0000000005', 'iamadmin6969', '827ccb0eea8a706c4c34a16891f84e7b', 'user (3).png', null),
	('TK0000000004', 'TKB0000000004', 'L0000000004', N'Nguyễn Thành Nhân', '2003/08/30', 'lehieulearn3@gmail.com', '0917632572', N'Củ Chi', N'Nam', '090201646478', N'Sinh Viên', 'QTC0000000005', 'admin_45', '827ccb0eea8a706c4c34a16891f84e7b', 'user (4).png', null),
	('TK0000000005', 'TKB0000000005', 'L0000000005', N'Nguyễn Trung Đức', '2003/05/30', 'lehieulearn4@gmail.com', '0908376890', N'Bình Dương', N'Nam', '080203456478', N'Sinh Viên', 'QTC0000000005', 'taikhoan1', '827ccb0eea8a706c4c34a16891f84e7b', 'user (5).png', null),
	('TK0000000006', 'TKB0000000006', 'L0000000001', N'Nguyễn Quốc Đại', '1987/05/22', 'lehieulearn5@gmail.com', '0908376890', N'Củ Chi', N'Nam', '080203456478', N'Giảng Viên', 'QTC0000000001', 'daucatmoi123', '827ccb0eea8a706c4c34a16891f84e7b', 'user (3).png', null),
	('TK0000000007', 'TKB0000000007', 'L0000000002', N'Nguyễn Thị Kim Oanh', '1987/06/22', 'lehieulearn6@gmail.com', '0908632541', N'Bình Dương', N'Nữ', '080203456512', N'Giảng Viên', 'QTC0000000002', 'admin123', '827ccb0eea8a706c4c34a16891f84e7b', 'user (2).png', null),
	('TK0000000008', 'TKB0000000008', 'L0000000003', N'Nguyễn Thị Thu Thảo', '1979/05/19', 'lehieulearn7@gmail.com', '0978642512', N'Bình Dương', N'Nữ', '070287456478', N'Giảng Viên', 'QTC0000000003', 'iamadmin69', '827ccb0eea8a706c4c34a16891f84e7b', 'user (1).png',  null),
	('TK0000000009', 'TKB0000000009', 'L0000000004', N'Lê Anh Đào', '1990/08/30', 'lehieulearn8@gmail.com', '0917632572', N'Củ Chi', N'Nữ', '090201646478', N'Giảng Viên', 'QTC0000000003', 'admin_456', '827ccb0eea8a706c4c34a16891f84e7b', 'user (4).png', null),
	('TK0000000010', 'TKB0000000010', 'L0000000005', N'Trần Anh Quốc', '1992/05/30', 'lehieulearn10@gmail.com', '0908376890', N'Bình Dương', N'Nam', '080203456478', N'Giảng Viên', 'QTC0000000003', 'taikhoan123', '827ccb0eea8a706c4c34a16891f84e7b', 'user (4).png', null),
	('TK0000000011', 'TKB0000000011', 'L0000000001', N'Lê Minh Việt', '2003/05/22', 'lehieulearn11@gmail.com', '0908376890', N'Củ Chi', N'Nam', '080203456478', N'Sinh Viên', 'QTC0000000005', 'leminhviet', '827ccb0eea8a706c4c34a16891f84e7b', 'user (1).png', null),
	('TK0000000012', 'TKB0000000012', 'L0000000001', N'Nguyễn Hoàng Kha', '2003/06/22', 'lehieulearn12@gmail.com', '0908632541', N'Bình Dương', N'Nam', '080203456512', N'Sinh Viên', 'QTC0000000005', 'nguyenhoankha', '827ccb0eea8a706c4c34a16891f84e7b', 'user (2).png', null),
	('TK0000000013', 'TKB0000000013', 'L0000000001', N'Nguyễn Minh Tâm', '2003/05/19', 'lehieulearn13@gmail.com', '0978642512', N'Bình Dương', N'Nam', '070287456478', N'Sinh Viên', 'QTC0000000005', 'nguyenminhtam', '827ccb0eea8a706c4c34a16891f84e7b', 'user (3).png', null),
	('TK0000000014', 'TKB0000000014', 'L0000000002', N'Nguyễn Minh Tú', '2003/08/30', 'lehieulearn14@gmail.com', '0917632572', N'Củ Chi', N'Nam', '090201646478', N'Sinh Viên', 'QTC0000000005', 'nguyenminhtu', '827ccb0eea8a706c4c34a16891f84e7b', 'user (4).png', null),
	('TK0000000015', 'TKB0000000015', 'L0000000002', N'Nguyễn Việt Hoàng', '2003/05/30', 'lehieulearn15@gmail.com', '0908376890', N'Bình Dương', N'Nam', '080203456478', N'Sinh Viên', 'QTC0000000005', 'nguyenviethoang', '827ccb0eea8a706c4c34a16891f84e7b', 'user (5).png', null),
	('TK0000000016', 'TKB0000000016', 'L0000000001', N'Hoàng Minh Việt', '2003/05/22', 'lehieulearn16@gmail.com', '0908376890', N'Củ Chi', N'Nam', '080203456478', N'Sinh Viên', 'QTC0000000005', 'tk16', '827ccb0eea8a706c4c34a16891f84e7b', 'user (1).png', null),
	('TK0000000017', 'TKB0000000017', 'L0000000004', N'Nguyễn Hoàng Mười', '2003/06/22', 'lehieulearn17@gmail.com', '0908632541', N'Bình Dương', N'Nam', '080203456512', N'Sinh Viên', 'QTC0000000005', 'tk17', '827ccb0eea8a706c4c34a16891f84e7b', 'user (2).png', null),
	('TK0000000018', 'TKB0000000018', 'L0000000003', N'Nguyễn Minh Phúc', '2003/05/19', 'lehieulearn18@gmail.com', '0978642512', N'Bình Dương', N'Nam', '070287456478', N'Sinh Viên', 'QTC0000000005', 'tk18', '827ccb0eea8a706c4c34a16891f84e7b', 'user (3).png', null),
	('TK0000000019', 'TKB0000000019', 'L0000000002', N'Nguyễn Lê Tuyết Nghi', '2003/08/30', 'lehieulearn19@gmail.com', '0917632572', N'Củ Chi', N'Nam', '090201646478', N'Sinh Viên', 'QTC0000000005', 'tk19', '827ccb0eea8a706c4c34a16891f84e7b', 'user (4).png', null),
	('TK0000000020', 'TKB0000000020', 'L0000000002', N'Nguyễn Việt Khâm', '2003/05/30', 'lehieulearn20@gmail.com', '0908376890', N'Bình Dương', N'Nam', '080203456478', N'Sinh Viên', 'QTC0000000005', 'tk20', '827ccb0eea8a706c4c34a16891f84e7b', 'user (5).png', null);

insert into BuoiHoc
values ('BH0000000001', '2023-11-03 07:00:00', '2023-10-03 11:30:00', '5', 'I4.203', null),
	('BH0000000002', '2023-11-05 07:00:00', '2023-11-05 11:30:00', '5', 'E3.104', null),
	('BH0000000003', '2023-11-10 12:30:00', '2023-11-10 17:00:00', '5', 'C2.202', null),
	('BH0000000004', '2023-11-14 07:00:00', '2024-11-14 11:30:00', '5', 'H1.404', null),
	('BH0000000005', '2023-11-15 12:30:00', '2024-11-15 17:00:00', '5', 'I1.401', null),
	('BH0000000006', '2023-11-17 12:30:00', '2023-11-17 17:00:00', '5', 'I2.201', null),
	('BH0000000007', '2023-11-18 12:30:00', '2023-11-18 17:00:00', '5', 'I3.301', null),
	('BH0000000008', '2023-11-21 12:30:00', '2023-11-21 17:00:00', '5', 'I3.101', null),
	('BH0000000009', '2023-11-26 12:30:00', '2023-11-26 17:00:00', '5', 'I1.101', null),
	('BH0000000010', '2023-12-01 12:30:00', '2023-12-01 17:00:00', '5', 'I4.203', null),
	('BH0000000011', '2023-12-05 12:30:00', '2023-12-05 17:00:00', '5', 'I2.404', null),
	('BH0000000012', '2023-12-10 12:30:00', '2023-12-10 17:00:00', '5', 'I2.409', null),
	('BH0000000013', '2023-12-15 12:30:00', '2023-12-15 17:00:00', '5', 'I3.408', null),
	('BH0000000014', '2023-12-16 12:30:00', '2023-12-16 17:00:00', '5', 'H1.408', null),
	('BH0000000015', '2023-12-17 12:30:00', '2023-12-17 17:00:00', '5', 'H1.208', null),
	('BH0000000016', '2023-12-20 12:30:00', '2023-12-20 17:00:00', '5', 'I1.402', null),
	('BH0000000017', '2023-12-24 12:30:00', '2023-12-24 17:00:00', '5', 'I1.405', null),
	('BH0000000018', '2023-12-28 12:30:00', '2023-12-28 17:00:00', '5', 'I1.406', null),
	('BH0000000019', '2024-01-03 12:30:00', '2024-01-03 17:00:00', '5', 'I1.407', null),
	('BH0000000020', '2024-01-07 12:30:00', '2024-01-07 17:00:00', '5', 'I1.408', null);

insert into BangDiem
values ('BD0000000001', 'TK0000000001', 'MH0000000001', '7', '8', null, null),
	('BD0000000002', 'TK0000000001', 'MH0000000002', '6', '8.9', null, null),
	('BD0000000003', 'TK0000000001', 'MH0000000003', '7.2', '8', null, null),
	('BD0000000004', 'TK0000000001', 'MH0000000004', '4', '6', null, null),
	('BD0000000005', 'TK0000000001', 'MH0000000005', '7', '5', null, null),

	('BD0000000006', 'TK0000000001', 'MH0000000006', '3', '5', null, null),
	('BD0000000007', 'TK0000000001', 'MH0000000007', '8', '5', null, null),
	('BD0000000008', 'TK0000000001', 'MH0000000008', '6.5', '5', null, null),
	('BD0000000009', 'TK0000000001', 'MH0000000009', '7.8', '7', null, null),
	('BD0000000010', 'TK0000000001', 'MH0000000010', '4', '8', null, null),

	('BD0000000011', 'TK0000000001', 'MH0000000011', '8.6', '8', null, null),
	('BD0000000012', 'TK0000000001', 'MH0000000012', '4', '8', null, null),
	('BD0000000013', 'TK0000000001', 'MH0000000013', '5', '8', null, null),
	('BD0000000014', 'TK0000000001', 'MH0000000014', '4.5', '8', null, null),
	('BD0000000015', 'TK0000000001', 'MH0000000015', '6', '9', null, null),
	-- Nam thu 2
	('BD0000000016', 'TK0000000001', 'MH0000000016', '7', '8', null, null),
	('BD0000000017', 'TK0000000001', 'MH0000000017', '6', '8.9', null, null),
	('BD0000000018', 'TK0000000001', 'MH0000000018', '2', '5', null, null),
	('BD0000000019', 'TK0000000001', 'MH0000000019', '1', '6', null, null),
	('BD0000000020', 'TK0000000001', 'MH0000000020', '7', '9', null, null),

	('BD0000000021', 'TK0000000001', 'MH0000000021', '3', '6', null, null),
	('BD0000000022', 'TK0000000001', 'MH0000000022', '8', '7', null, null),
	('BD0000000023', 'TK0000000001', 'MH0000000023', '6.5', '5.5', null, null),
	('BD0000000024', 'TK0000000001', 'MH0000000024', '7', '7', null, null),
	('BD0000000025', 'TK0000000001', 'MH0000000025', '5', '8', null, null),

	('BD0000000026', 'TK0000000001', 'MH0000000026', '4', '8', null, null),
	('BD0000000027', 'TK0000000001', 'MH0000000027', '8', '8', null, null),
	('BD0000000028', 'TK0000000001', 'MH0000000028', '5', '5', null, null),
	('BD0000000029', 'TK0000000001', 'MH0000000029', '7', '8', null, null),
	('BD0000000030', 'TK0000000001', 'MH0000000030', '4', '8', null, null),
	-- Nam thu 3
	('BD0000000031', 'TK0000000001', 'MH0000000031', '6', '9', null, null),
	('BD0000000032', 'TK0000000001', 'MH0000000032', '6', '9', null, null),
	('BD0000000033', 'TK0000000001', 'MH0000000033', '6', '8', null, null),
	('BD0000000034', 'TK0000000001', 'MH0000000034', '6', '9', null, null),
	('BD0000000035', 'TK0000000001', 'MH0000000035', '6', '7', null, null),

	('BD0000000036', 'TK0000000001', 'MH0000000036', '6', '9', null, null),
	('BD0000000037', 'TK0000000001', 'MH0000000037', '6', '9', null, null),
	('BD0000000038', 'TK0000000001', 'MH0000000038', '5', '6', null, null),
	('BD0000000039', 'TK0000000001', 'MH0000000039', '6', '9', null, null),
	('BD0000000040', 'TK0000000001', 'MH0000000040', '6', '9', null, null),

	('BD0000000041', 'TK0000000001', 'MH0000000041', '6', '9', null, null),
	('BD0000000042', 'TK0000000001', 'MH0000000042', '6', '9', null, null),
	('BD0000000043', 'TK0000000001', 'MH0000000043', '5.5', '9', null, null),
	('BD0000000044', 'TK0000000001', 'MH0000000044', '6', '9', null, null),
	('BD0000000045', 'TK0000000001', 'MH0000000045', '6', '9', null, null),
	-- Nam thu 4
	('BD0000000046', 'TK0000000001', 'MH0000000046', '6', '9', null, null),
	('BD0000000047', 'TK0000000001', 'MH0000000047', '4.6', '9', null, null),
	('BD0000000048', 'TK0000000001', 'MH0000000048', '6', '9', null, null),
	('BD0000000049', 'TK0000000001', 'MH0000000049', '9', '9', null, null),
	('BD0000000050', 'TK0000000001', 'MH0000000050', '6', '9', null, null),

	('BD0000000051', 'TK0000000001', 'MH0000000051', '6', '9', null, null),
	('BD0000000052', 'TK0000000001', 'MH0000000052', '6', '9', null, null),
	('BD0000000053', 'TK0000000001', 'MH0000000053', '6', '9', null, null),
	('BD0000000054', 'TK0000000001', 'MH0000000054', '6', '9', null, null),
	('BD0000000055', 'TK0000000001', 'MH0000000055', '6', '9', null, null),

	('BD0000000056', 'TK0000000001', 'MH0000000056', '6', '9', null, null),
	('BD0000000057', 'TK0000000001', 'MH0000000057', '5', '9', null, null),
	('BD0000000058', 'TK0000000001', 'MH0000000058', '6', '9', null, null),
	('BD0000000059', 'TK0000000001', 'MH0000000059', '1', '9', null, null),
	('BD0000000060', 'TK0000000001', 'MH0000000060', '6', '9', null, null),

	-- SV2
	-- Nam thu 1
	('BD0000000061', 'TK0000000002', 'MH0000000001', '5', '8', null, null),
	('BD0000000062', 'TK0000000002', 'MH0000000002', '6', '8', null, null),
	('BD0000000063', 'TK0000000002', 'MH0000000003', '5', '8', null, null),
	('BD0000000064', 'TK0000000002', 'MH0000000004', '8', '6', null, null),
	('BD0000000065', 'TK0000000002', 'MH0000000005', '4', '5', null, null),

	('BD0000000066', 'TK0000000002', 'MH0000000006', '6', '5', null, null),
	('BD0000000067', 'TK0000000002', 'MH0000000007', '3', '9', null, null),
	('BD0000000068', 'TK0000000002', 'MH0000000008', '6.5', '5', null, null),
	('BD0000000069', 'TK0000000002', 'MH0000000009', '6.8', '7', null, null),
	('BD0000000070', 'TK0000000002', 'MH0000000010', '6', '8', null, null),

	('BD0000000071', 'TK0000000002', 'MH0000000011', '4', '8', null, null),
	('BD0000000072', 'TK0000000002', 'MH0000000012', '8.6', '8', null, null),
	('BD0000000073', 'TK0000000002', 'MH0000000013', '4', '8', null, null),
	('BD0000000074', 'TK0000000002', 'MH0000000014', '5.9', '8', null, null),
	('BD0000000075', 'TK0000000002', 'MH0000000015', '4', '8', null, null),
	-- Nam thu 2
	('BD0000000076', 'TK0000000002', 'MH0000000016', '7', '8', null, null),
	('BD0000000077', 'TK0000000002', 'MH0000000017', '6.9', '8.9', null, null),
	('BD0000000078', 'TK0000000002', 'MH0000000018', '4', '5', null, null),
	('BD0000000079', 'TK0000000002', 'MH0000000019', '4', '6', null, null),
	('BD0000000080', 'TK0000000002', 'MH0000000020', '7', '9', null, null),

	('BD0000000081', 'TK0000000002', 'MH0000000021', '3', '6', null, null),
	('BD0000000082', 'TK0000000002', 'MH0000000022', '8', '7', null, null),
	('BD0000000083', 'TK0000000002', 'MH0000000023', '6', '5.5', null, null),
	('BD0000000084', 'TK0000000002', 'MH0000000024', '7', '7', null, null),
	('BD0000000085', 'TK0000000002', 'MH0000000025', '5', '8.5', null, null),

	('BD0000000086', 'TK0000000002', 'MH0000000026', '4', '8', null, null),
	('BD0000000087', 'TK0000000002', 'MH0000000027', '8.5', '8', null, null),
	('BD0000000088', 'TK0000000002', 'MH0000000028', '5', '5', null, null),
	('BD0000000089', 'TK0000000002', 'MH0000000029', '7', '6', null, null),
	('BD0000000090', 'TK0000000002', 'MH0000000030', '4', '8', null, null),
	-- Nam thu 3
	('BD0000000091', 'TK0000000002', 'MH0000000031', '6', '9', null, null),
	('BD0000000092', 'TK0000000002', 'MH0000000032', '6', '9', null, null),
	('BD0000000093', 'TK0000000002', 'MH0000000033', '6', '8', null, null),
	('BD0000000094', 'TK0000000002', 'MH0000000034', '6', '9', null, null),
	('BD0000000095', 'TK0000000002', 'MH0000000035', '6', '7', null, null),

	('BD0000000096', 'TK0000000002', 'MH0000000036', '6', '9', null, null),
	('BD0000000097', 'TK0000000002', 'MH0000000037', '6', '9', null, null),
	('BD0000000098', 'TK0000000002', 'MH0000000038', '5', '6', null, null),
	('BD0000000099', 'TK0000000002', 'MH0000000039', '6', '9', null, null),
	('BD0000000100', 'TK0000000002', 'MH0000000040', '6', '9', null, null),

	('BD0000000101', 'TK0000000002', 'MH0000000041', '6', '9', null, null),
	('BD0000000102', 'TK0000000002', 'MH0000000042', '6', '9', null, null),
	('BD0000000103', 'TK0000000002', 'MH0000000043', '5.5', '9', null, null),
	('BD0000000104', 'TK0000000002', 'MH0000000044', '6', '9', null, null),
	('BD0000000105', 'TK0000000002', 'MH0000000045', '6', '9', null, null),
	-- Nam thu 4
	('BD0000000106', 'TK0000000002', 'MH0000000046', '6', '9', null, null),
	('BD0000000107', 'TK0000000002', 'MH0000000047', '4.6', '9', null, null),
	('BD0000000108', 'TK0000000002', 'MH0000000048', '6', '9', null, null),
	('BD0000000109', 'TK0000000002', 'MH0000000049', '9', '9', null, null),
	('BD0000000110', 'TK0000000002', 'MH0000000050', '6', '9', null, null),

	('BD0000000111', 'TK0000000002', 'MH0000000051', '6', '9', null, null),
	('BD0000000112', 'TK0000000002', 'MH0000000052', '6', '7', null, null),
	('BD0000000113', 'TK0000000002', 'MH0000000053', '6', '9', null, null),
	('BD0000000114', 'TK0000000002', 'MH0000000054', '6', '7', null, null),
	('BD0000000115', 'TK0000000002', 'MH0000000055', '6', '9', null, null),

	('BD0000000116', 'TK0000000002', 'MH0000000056', '6', '9', null, null),
	('BD0000000117', 'TK0000000002', 'MH0000000057', '5', '9', null, null),
	('BD0000000118', 'TK0000000002', 'MH0000000058', '6', '9', null, null),
	('BD0000000119', 'TK0000000002', 'MH0000000059', '1', '6', null, null),
	('BD0000000120', 'TK0000000002', 'MH0000000060', '6', '9', null, null),

	-- SV3
	-- Nam thu 1
	('BD0000000121', 'TK0000000003', 'MH0000000001', '5', '8', null, null),
	('BD0000000122', 'TK0000000003', 'MH0000000002', '6', '8.6', null, null),
	('BD0000000123', 'TK0000000003', 'MH0000000003', '6', '7', null, null),
	('BD0000000124', 'TK0000000003', 'MH0000000004', '8', '6', null, null),
	('BD0000000125', 'TK0000000003', 'MH0000000005', '7', '5', null, null),

	('BD0000000126', 'TK0000000003', 'MH0000000006', '6', '5', null, null),
	('BD0000000127', 'TK0000000003', 'MH0000000007', '3', '9', null, null),
	('BD0000000128', 'TK0000000003', 'MH0000000008', '6.5', '5', null, null),
	('BD0000000129', 'TK0000000003', 'MH0000000009', '6.8', '7', null, null),
	('BD0000000130', 'TK0000000003', 'MH0000000010', '5', '8', null, null),

	('BD0000000131', 'TK0000000003', 'MH0000000011', '4', '7', null, null),
	('BD0000000132', 'TK0000000003', 'MH0000000012', '8.6', '5', null, null),
	('BD0000000133', 'TK0000000003', 'MH0000000013', '4', '8', null, null),
	('BD0000000134', 'TK0000000003', 'MH0000000014', '5.9', '8', null, null),
	('BD0000000135', 'TK0000000003', 'MH0000000015', '4', '8', null, null),
	-- Nam thu 2
	('BD0000000136', 'TK0000000003', 'MH0000000016', '7', '8', null, null),
	('BD0000000137', 'TK0000000003', 'MH0000000017', '6.9', '8.9', null, null),
	('BD0000000138', 'TK0000000003', 'MH0000000018', '6', '5', null, null),
	('BD0000000139', 'TK0000000003', 'MH0000000019', '4', '9', null, null),
	('BD0000000140', 'TK0000000003', 'MH0000000020', '7', '9', null, null),

	('BD0000000141', 'TK0000000003', 'MH0000000021', '3', '6', null, null),
	('BD0000000142', 'TK0000000003', 'MH0000000022', '8', '7', null, null),
	('BD0000000143', 'TK0000000003', 'MH0000000023', '6', '5.5', null, null),
	('BD0000000144', 'TK0000000003', 'MH0000000024', '4.5', '7', null, null),
	('BD0000000145', 'TK0000000003', 'MH0000000025', '5', '8.5', null, null),

	('BD0000000146', 'TK0000000003', 'MH0000000026', '4', '8', null, null),
	('BD0000000147', 'TK0000000003', 'MH0000000027', '8.5', '8', null, null),
	('BD0000000148', 'TK0000000003', 'MH0000000028', '5.5', '4', null, null),
	('BD0000000149', 'TK0000000003', 'MH0000000029', '7', '6', null, null),
	('BD0000000150', 'TK0000000003', 'MH0000000030', '4', '8', null, null);

insert into NhomMonHoc
values ('NMH0000000001', 'TK0000000006', 'MH0000000001', '1', null),
	('NMH0000000002', 'TK0000000007', 'MH0000000002', '2', null),
	('NMH0000000003', 'TK0000000008', 'MH0000000003', '3', null),
	('NMH0000000004', 'TK0000000009', 'MH0000000004', '4', null),
	('NMH0000000005', 'TK0000000010', 'MH0000000005', '5', null);

insert into NhomMonHoc_SinhVien
values ('NMH_SV0000000001', 'TK0000000001', 'NMH0000000001', '2023/06/10', null),
	('NMH_SV0000000002', 'TK0000000002', 'NMH0000000002', '2023/06/10', null),
	('NMH_SV0000000003', 'TK0000000003', 'NMH0000000003', '2023/06/10', null),
	('NMH_SV0000000004', 'TK0000000004', 'NMH0000000004', '2023/06/10', null),
	('NMH_SV0000000005', 'TK0000000005', 'NMH0000000005', '2023/06/10', null);

insert into NhomMonHoc_BuoiHoc
values ('NMH_BH0000000001', 'NMH0000000001', 'BH0000000001', null),
	('NMH_BH0000000002', 'NMH0000000001', 'BH0000000002', null),
	('NMH_BH0000000003', 'NMH0000000001', 'BH0000000003', null),
	('NMH_BH0000000004', 'NMH0000000001', 'BH0000000004', null),
	('NMH_BH0000000005', 'NMH0000000001', 'BH0000000005', null),
	('NMH_BH0000000006', 'NMH0000000001', 'BH0000000006', null),
	('NMH_BH0000000007', 'NMH0000000002', 'BH0000000007', null),
	('NMH_BH0000000008', 'NMH0000000002', 'BH0000000008', null),
	('NMH_BH0000000009', 'NMH0000000002', 'BH0000000009', null),
	('NMH_BH0000000010', 'NMH0000000002', 'BH0000000010', null),
	('NMH_BH0000000011', 'NMH0000000002', 'BH0000000011', null),
	('NMH_BH0000000012', 'NMH0000000002', 'BH0000000012', null),
	('NMH_BH0000000013', 'NMH0000000003', 'BH0000000013', null),
	('NMH_BH0000000014', 'NMH0000000003', 'BH0000000014', null),
	('NMH_BH0000000015', 'NMH0000000003', 'BH0000000015', null),
	('NMH_BH0000000016', 'NMH0000000003', 'BH0000000016', null),
	('NMH_BH0000000017', 'NMH0000000003', 'BH0000000017', null),
	('NMH_BH0000000018', 'NMH0000000003', 'BH0000000018', null),
	('NMH_BH0000000019', 'NMH0000000004', 'BH0000000019', null),
	('NMH_BH0000000020', 'NMH0000000004', 'BH0000000020', null);
	


insert into DiemRenLuyen
values ('DRL0000000001', 'TK0000000001', 'HK0000000001', 'NH0000000001', 81, null),
	('DRL0000000002', 'TK0000000002', 'HK0000000002', 'NH0000000002', 77, null),
	('DRL0000000003', 'TK0000000003', 'HK0000000002', 'NH0000000003', 65, null),
	('DRL0000000004', 'TK0000000004', 'HK0000000001', 'NH0000000004', 90, null),
	('DRL0000000005', 'TK0000000005', 'HK0000000001', 'NH0000000005', 45, null);

insert into ThoiKhoaBieu
values ('TKB0000000001', 'TK0000000001', null),
	('TKB0000000002', 'TK0000000002', null),
	('TKB0000000003', 'TK0000000003', null),
	('TKB0000000004', 'TK0000000004', null),
	('TKB0000000005', 'TK0000000005', null),
	('TKB0000000006', 'TK0000000006', null),
	('TKB0000000007', 'TK0000000007', null),
	('TKB0000000008', 'TK0000000008', null),
	('TKB0000000009', 'TK0000000009', null),
	('TKB0000000010', 'TK0000000010', null),
	('TKB0000000011', 'TK0000000011', null),
	('TKB0000000012', 'TK0000000012', null),
	('TKB0000000013', 'TK0000000013', null),
	('TKB0000000014', 'TK0000000014', null),
	('TKB0000000015', 'TK0000000015', null),
	('TKB0000000016', 'TK0000000016', null),
	('TKB0000000017', 'TK0000000017', null),
	('TKB0000000018', 'TK0000000018', null),
	('TKB0000000019', 'TK0000000019', null),
	('TKB0000000020', 'TK0000000020', null);

insert into ThoiKhoaBieu_BuoiHoc
values ('TKB_BH0000000001', 'TKB0000000001', 'BH0000000001', '1', null),
	('TKB_BH0000000002', 'TKB0000000002', 'BH0000000002', '2', null),
	('TKB_BH0000000003', 'TKB0000000001', 'BH0000000003', '1', null),
	('TKB_BH0000000004', 'TKB0000000001', 'BH0000000004', '1', null),
	('TKB_BH0000000005', 'TKB0000000001', 'BH0000000005', '1', null),
	('TKB_BH0000000006', 'TKB0000000001', 'BH0000000006', '1', null),
	('TKB_BH0000000007', 'TKB0000000001', 'BH0000000007', '1', null),
	('TKB_BH0000000008', 'TKB0000000001', 'BH0000000008', '1', null),
	('TKB_BH0000000009', 'TKB0000000001', 'BH0000000009', '1', null),
	('TKB_BH0000000010', 'TKB0000000001', 'BH0000000010', '1', null),
	('TKB_BH0000000011', 'TKB0000000001', 'BH0000000011', '1', null),
	('TKB_BH0000000012', 'TKB0000000001', 'BH0000000012', '1', null),
	('TKB_BH0000000013', 'TKB0000000001', 'BH0000000013', '1', null),
	('TKB_BH0000000014', 'TKB0000000001', 'BH0000000014', '1', null),
	('TKB_BH0000000015', 'TKB0000000001', 'BH0000000015', '1', null),
	('TKB_BH0000000016', 'TKB0000000001', 'BH0000000016', '1', null),
	('TKB_BH0000000017', 'TKB0000000001', 'BH0000000017', '1', null),
	('TKB_BH0000000018', 'TKB0000000001', 'BH0000000018', '1', null),
	('TKB_BH0000000019', 'TKB0000000001', 'BH0000000019', '1', null),
	('TKB_BH0000000020', 'TKB0000000001', 'BH0000000020', '1', null),
	
	('TKB_BH0000000021', 'TKB0000000003', 'BH0000000003', '3', null),
	('TKB_BH0000000022', 'TKB0000000004', 'BH0000000004', '4', null),
	('TKB_BH0000000023', 'TKB0000000005', 'BH0000000005', '5', null),
	('TKB_BH0000000024', 'TKB0000000006', 'BH0000000001', '1', null),
	('TKB_BH0000000025', 'TKB0000000007', 'BH0000000002', '2', null),
	('TKB_BH0000000026', 'TKB0000000008', 'BH0000000003', '3', null),
	('TKB_BH0000000027', 'TKB0000000009', 'BH0000000004', '4', null),
	('TKB_BH0000000028', 'TKB0000000010', 'BH0000000005', '5', null);

insert into LoaiThongBao
values ('LTB0000000001', N'Quan trọng', 1, null),
	('LTB0000000002', N'Đáng chú ý', 2, null),
	('LTB0000000003', N'Bình thường', 3, null);

insert into ThongBao
values ('TB0000000001', 'LTB0000000001', N'Thông báo nhắc nợ học phí học kỳ I (NH 2023 - 2024)', N'Viện Kỹ thuật - Công nghệ kính gửi Quý Thầy/Cô và Mến gửi các em sinh viên văn bản đến số 102/TB-ĐHTDM ngày 26/10/2023 Thông báo nhắc nợ học phí học kỳ I năm học 2023-2024.Thời gian thu nợ học phí từ ngày 26/10/2023 đến ngày 06/11/2023.', null),
	('TB0000000002', 'LTB0000000002', N'Về việc tổ chức Kỳ thi cấp chứng chỉ năng lực Tiếng Anh EPT-TDMU ', N'thông báo về việc tổ chức Kỳ thi cấp chứng chỉ năng lực Tiếng Anh EPT-TDMU khóa ngày 05/11/2023. Thời gian thi: Cả ngày 05/11/2023 (Chủ nhật)', null),
	('TB0000000003', 'LTB0000000003', N'ĐĂNG KÝ THAM GIA CHƯƠNG TRÌNH TẬP HUẤN KỸ NĂNG', N'Kỹ thuật - Công nghệ tổ chức chương trình tập huấn kỹ năng CÁC XU THẾ CÔNG NGHỆ VÀ ỨNG DỤNG CÔNG NGHỆ BLOCKCHAIN VÀO SẢN PHẨM SỐ. Thời gian: 7h00, Sáng thứ Bảy, ngày 11/11/2023', null),
	('TB0000000004', 'LTB0000000001', N'NHẮC NHỞ CÀI ĐẶT APP THANH NIÊN VÀ HOÀN THÀNH THI NGHỊ QUYẾT ĐẠI HỘI ĐOÀN', N'Đề nghị các đoàn viên chi đoàn chưa thực hiện cài đặt app Thanh niên nhanh chóng thực hiện cài đặt app Thanh niên và hoàn thành thi nghị quyết(Có danh sách đính kèm). Ban Chấp hành các chi đoàn nhắc nhở đoàn viên chi đoàn mình hoàn thành.', null),
	('TB0000000005', 'LTB0000000001', N'Thông báo đăng ký học Ngoại ngữ không chuyên HK1 (đợt 2)', N'Đăng ký học đúng theo các nội dung trong thông báo (file kèm theo)', null)

insert into ThongBao_NguoiChinhSua
values ('TB_NCS0000000001', 'TB0000000001', 'TK0000000001', '2023/06/20', null),
	('TB_NCS0000000002', 'TB0000000002', 'TK0000000002', '2023/06/20', null),
	('TB_NCS0000000003', 'TB0000000002', 'TK0000000003', '2023/06/20', null),
	('TB_NCS0000000004', 'TB0000000001', 'TK0000000004', '2023/06/20', null),
	('TB_NCS0000000005', 'TB0000000001', 'TK0000000005', '2023/06/20', null),
	('TB_NCS0000000006', 'TB0000000005', 'TK0000000002', '2023/06/23', null)

insert into ThongBao_NguoiNhan
values ('TB_NN0000000001', 'TB0000000001', 'TK0000000001', '2023/04/10', null),
	('TB_NN0000000002', 'TB0000000002', 'TK0000000002', '2023/07/25', null),
	('TB_NN0000000003', 'TB0000000002', 'TK0000000003', '2023/02/24', null),
	('TB_NN0000000004', 'TB0000000002', 'TK0000000004', '2023/01/22', null),
	('TB_NN0000000005', 'TB0000000005', 'TK0000000005', '2023/02/20', null);

insert into TLBaiViet
values ('TLBV0000000001', N'Tin tức', null),
	('TLBV0000000002', N'Hoạt động', null),
	('TLBV0000000003', N'Sự kiện', null);

insert into BaiViet
values ('BV0000000001', 'TLBV0000000001', N'Đồng tổ chức thành công hội thảo khoa học quốc gia STAIS-2023', N'Ngày 26/10/2023, tại trường Đại học Sư phạm Kỹ thuật Vinh, hội thảo “Ứng dụng Công nghệ thông minh trong Công nghiệp 4.0, Thành phố thông minh và Phát triển bền vững STAIS-2023” đã diễn ra thành công.', 'article (1).png', null),
	('BV0000000002', 'TLBV0000000002', N'Phát triển giáo dục về hiệu quả năng lượng và chiếu sáng thông minh', N'Sáng ngày 24/10/2023, tại Trung tâm Sáng kiến Cộng đồng và Hỗ trợ khởi nghiệp tỉnh Bình Dương, trường ĐH Thủ Dầu Một đã tổ chức hội thảo với chủ đề “Phát triển giáo dục về hiệu quả năng lượng và chiếu sáng thông minh tại Việt Nam và Myanmar.', 'article (2).png', null),
	('BV0000000003', 'TLBV0000000003', N'Chúc mừng sinh viên Bùi Xuân Sáng đạt Giải thưởng Kiến trúc xanh sinh viên 2023', N'Tại lễ trao giải diễn ra vào 14 giờ 30 ngày 26/10/2023, sinh viên Bùi Xuân Sáng - ngành Kiến trúc trường ĐH Thủ Dầu Một đã đạt giải khuyến khích với tác phẩm “Trung tâm Bảo tồn và Phát triển Văn hóa dân tộc Ê Đê - Tây Nguyên”.', 'article (3).png', null),
	('BV0000000004', 'TLBV0000000002', N'Từ phòng thí nghiệm đến sản phẩm hữu cơ', N'Để tạo ra sản phẩm chất lượng có nguồn gốc hữu cơ, nâng cao giá trị thương mại, cần có vai trò của nhà nghiên cứu. Những thành quả của Viện Phát triển ứng dụng là một ví dụ.', 'article (4).png', null),
	('BV0000000005', 'TLBV0000000001', N'Khoa Y Dược ghi dấu ấn với diễn đàn y khoa định kỳ hàng tháng', N'Ngày 16/6/2023, khoa Y Dược tổ chức hội nghị y khoa định kỳ hàng tháng kết hợp tổng kết hoạt động nghiên cứu khoa học, tuyên dương CB-GV, học viên có nhiều đóng góp công tác nghiên cứu, đào tạo của khoa.', 'article (5).png', null)

insert into BaiViet_NguoiChinhSua
values ('BV_NCS0000000001', 'BV0000000001', 'TK0000000001', '2023/06/20', null),
	('BV_NCS0000000002', 'BV0000000002', 'TK0000000002', '2023/06/20', null),
	('BV_NCS0000000003', 'BV0000000003', 'TK0000000003', '2023/06/20', null),
	('BV_NCS0000000004', 'BV0000000004', 'TK0000000004', '2023/06/20', null),
	('BV_NCS0000000005', 'BV0000000005', 'TK0000000005', '2023/06/20', null),
	('BV_NCS0000000006', 'BV0000000001', 'TK0000000002', '2023/06/23', null)

insert into BaiViet_NguoiThamGia
values ('BV_NTG0000000001', 'BV0000000001', 'TK0000000001', '2023/06/20', null),
	('BV_NTG0000000002', 'BV0000000001', 'TK0000000002', '2023/06/20', null),
	('BV_NTG0000000003', 'BV0000000001', 'TK0000000003', '2023/06/20', null),
	('BV_NTG0000000004', 'BV0000000005', 'TK0000000004', '2023/06/20', null),
	('BV_NTG0000000005', 'BV0000000005', 'TK0000000005', '2023/06/20', null)

insert into NhomChat
values ('NC0000000001', 'NhomChat1', '2023/06/10', null),
	('NC0000000002', 'NhomChat2', '2023/04/20', null),
	('NC0000000003', 'NhomChat3', '2023/09/29', null),
	('NC0000000004', 'NhomChat4', '2023/06/20', null),
	('NC0000000005', 'NhomChat5', '2023/01/20', null)

insert into NhomChat_NguoiThamGia
values ('NC_NTG0000000001', 'NC0000000001', 'TK0000000001', '2023/06/10', null),
	('NC_NTG0000000002', 'NC0000000002', 'TK0000000002', '2023/04/20', null),
	('NC_NTG0000000003', 'NC0000000002', 'TK0000000003', '2023/09/29', null),
	('NC_NTG0000000004', 'NC0000000005', 'TK0000000004', '2023/06/20', null),
	('NC_NTG0000000005', 'NC0000000005', 'TK0000000005', '2023/01/20', null);

insert into TinNhan
values ('TN0000000001', 'TK0000000001', N'Hello', '2023/04/10', null),
	('TN0000000002', 'TK0000000001', N'Xin chào bạn', '2023/04/10', null),
	('TN0000000003', 'TK0000000002', N'Bạn khỏe không?', '2023/04/10', null),
	('TN0000000004', 'TK0000000003', N'Không có gì', '2023/04/10', null),
	('TN0000000005', 'TK0000000001', N'Tớ ổn!', '2023/04/10', null);

insert into TinNhan_GuiDen
values ('TN_GD0000000001', 'TN0000000001', 'TK0000000001', 'NC0000000001', '1', null),
	('TN_GD0000000002', 'TN0000000002', 'TK0000000003', 'NC0000000002', '1', null),
	('TN_GD0000000003', 'TN0000000003', 'TK0000000004', 'NC0000000003', '1', null),
	('TN_GD0000000004', 'TN0000000004', 'TK0000000004', 'NC0000000004', '1', null),
	('TN_GD0000000005', 'TN0000000005', 'TK0000000001', 'NC0000000005', '1', null);

insert into ChuDeCauHoi
values ('CDCH0000000001', N'Học phí', null),
	('CDCH0000000002', N'Cấp giấy chứng nhận', null),
	('CDCH0000000003', N'Môn học', null),
	('CDCH0000000004', N'Học bổng', null),
	('CDCH0000000005', N'Gia hạn đóng học phí', null)

insert into CauHoi
values ('CH0000000001', 'TK0000000001', N'Làm sao để đóng học phí?', N'How to đóng tiền', '2023/02/20', 1, null),
	('CH0000000002', 'TK0000000002', N'Nhận học bổng như thế nào?', N'How to lấy học bổng', '2023/06/20', 1, null),
	('CH0000000003', 'TK0000000002', N'Xin giấy hoãn NVQS', N'How to xin giấy hoãn quân sự', '2023/03/20', 1, null),
	('CH0000000004', 'TK0000000001', N'Làm sao để xin nghỉ học trong lớp', N'How to pro english', '2023/08/20', 1, null),
	('CH0000000005', 'TK0000000004', N'Gia hạn đóng tiền như thế nào?', N'How to nghỉ học', '2023/06/20', 1, null);

insert into CauHoi_ChuDeCauHoi
values ('CH_CDCH0000000001', 'CH0000000001', 'CDCH0000000001', null),
	('CH_CDCH0000000002', 'CH0000000002', 'CDCH0000000002', null),
	('CH_CDCH0000000003', 'CH0000000003', 'CDCH0000000001', null),
	('CH_CDCH0000000004', 'CH0000000004', 'CDCH0000000001', null),
	('CH_CDCH0000000005', 'CH0000000005', 'CDCH0000000005', null)

insert into CauHoi_NguoiTraLoi
values ('CH_NTL0000000001', 'CH0000000001', 'TK0000000002', N'Xin chào! rất vui được gặp bạn.', '2023/02/20', null),
	('CH_NTL0000000002', 'CH0000000002', 'TK0000000002', N'Bạn ăn cơm chưa?', '2023/02/22', null),
	('CH_NTL0000000003', 'CH0000000003', 'TK0000000002', N'Bạn ơi, mình hỏi bài xíu được không?', '2023/02/24', null),
	('CH_NTL0000000004', 'CH0000000004', 'TK0000000005', N'Tối nay tranh thủ soạn ppt thuyết trình nha', '2023/02/26', null),
	('CH_NTL0000000005', 'CH0000000005', 'TK0000000005', N'Bạn lên đọc Q&A của trường nha', '2023/02/28', null)

insert into CauHoi_NguoiTraLoi_NguoiTraLoi
values ('CH_NTL_NTL0000000001', 'CH_NTL0000000001', 'TK0000000001', N'Rất vui được gặp bạn!', '2023/02/21', null),
	('CH_NTL_NTL0000000002', 'CH_NTL0000000001', 'TK0000000004', N'Chào bạn', '2023/02/21', null),
	('CH_NTL_NTL0000000003', 'CH_NTL0000000002', 'TK0000000005', N'Chưa bạn ơi', '2023/02/23', null),
	('CH_NTL_NTL0000000004', 'CH_NTL0000000002', 'TK0000000003', N'Bạn chở mình đi ăn hay gì?', '2023/02/23', null),
	('CH_NTL_NTL0000000005', 'CH_NTL0000000003', 'TK0000000004', N'Không bạn :))', '2023/02/25', null),
	('CH_NTL_NTL0000000006', 'CH_NTL0000000003', 'TK0000000005', N'Tự làm đi, hỏi gì', '2023/02/25', null),
	('CH_NTL_NTL0000000007', 'CH_NTL0000000004', 'TK0000000001', N'Tối mình bận chơi game rồi, bạn tự làm đi', '2023/02/27', null),
	('CH_NTL_NTL0000000008', 'CH_NTL0000000004', 'TK0000000003', N'OK, tối nay làm liền.', '2023/02/27', null),
	('CH_NTL_NTL0000000009', 'CH_NTL0000000005', 'TK0000000003', N'Trường có Q&A à bạn?', '2023/03/01', null),
	('CH_NTL_NTL0000000010', 'CH_NTL0000000005', 'TK0000000002', N'Bạn đọc ở đâu vậy?', '2023/03/01', null);

insert into CauHoi_NguoiDanhGia
values ('CH_NDG0000000001', 'CH0000000001', 'TK0000000001', '0', '2023/02/20', null),
	('CH_NDG0000000002', 'CH0000000002', 'TK0000000003', '0', '2023/02/22', null),
	('CH_NDG0000000003', 'CH0000000003', 'TK0000000001', '1', '2023/02/24', null),
	('CH_NDG0000000004', 'CH0000000004', 'TK0000000003', '1', '2023/02/26', null),
	('CH_NDG0000000005', 'CH0000000005', 'TK0000000001', '0', '2023/02/28', null);

-- =======================================================================================

use TDMUAppDB
go

-- Add foreign key

alter table NhomNganh
add foreign key (IDKhoa) references Khoa(ID);

alter table Lop
add foreign key (IDNhomNganh) references NhomNganh(ID);

alter table TaiKhoan
add foreign key (IDLop) references Lop(ID),
	foreign key (IDQuyenTruyCap) references QuyenTruyCap(ID);

alter table BangDiem
add foreign key (IDSinhVien) references TaiKhoan(ID),
	foreign key (IDMonHoc) references MonHoc(ID);

alter table MonHoc
add foreign key (IDHocKy) references HocKy(ID),
	foreign key (IDNamHoc) references NamHoc(ID);

alter table NhomMonHoc
add foreign key (IDMonHoc) references MonHoc(ID),
	foreign key (IDGiangVien) references TaiKhoan(ID);

alter table NhomMonHoc_SinhVien
add foreign key (IDSinhVien) references TaiKhoan(ID),
	foreign key (IDNhomMonHoc) references NhomMonHoc(ID);

alter table NhomMonHoc_BuoiHoc
add foreign key (IDNhomMonHoc) references NhomMonHoc(ID),
	foreign key (IDBuoiHoc) references BuoiHoc(ID);

alter table DiemRenLuyen
add foreign key (IDSinhVien) references TaiKhoan(ID),
	foreign key (IDHocKy) references HocKy(ID),
	foreign key (IDNamHoc) references NamHoc(ID);

alter table ThoiKhoaBieu
add foreign key (IDTaiKhoan) references TaiKhoan(ID);

alter table ThoiKhoaBieu_BuoiHoc
add foreign key (IDThoiKhoaBieu) references ThoiKhoaBieu(ID),
	foreign key (IDBuoiHoc) references BuoiHoc(ID);

alter table ThongBao
add foreign key (IDLoaiThongBao) references LoaiThongBao(ID);

alter table ThongBao_NguoiChinhSua
add foreign key (IDNguoiChinhSua) references TaiKhoan(ID),
	foreign key (IDThongBao) references ThongBao(ID);

alter table ThongBao_NguoiNhan
add foreign key (IDThongBao) references ThongBao(ID),
	foreign key (IDNguoiNhan) references TaiKhoan(ID);

alter table BaiViet
add foreign key (IDTLBaiViet) references TLBaiViet(ID);

alter table BaiViet_NguoiThamGia
add foreign key (IDBaiViet) references BaiViet(ID),
	foreign key (IDNguoiThamGia) references TaiKhoan(ID);

alter table BaiViet_NguoiChinhSua
add foreign key (IDBaiViet) references BaiViet(ID),
	foreign key (IDNguoiChinhSua) references TaiKhoan(ID);

alter table NhomChat_NguoiThamGia
add foreign key (IDNhomChat) references NhomChat(ID),
	foreign key (IDNguoiThamGia) references TaiKhoan(ID);

alter table TinNhan
add foreign key (IDTaiKhoan) references TaiKhoan(ID);

alter table TinNhan_GuiDen
add foreign key (IDTinNhan) references TinNhan(ID),
	foreign key (IDNguoiNhan) references TaiKhoan(ID),
	foreign key (IDNhomNhan) references NhomChat(ID);

alter table CauHoi
add foreign key (IDNguoiGui) references TaiKhoan(ID);

alter table CauHoi_ChuDeCauHoi
add foreign key (IDCauHoi) references CauHoi(ID),
	foreign key (IDChuDeCauHoi) references ChuDeCauHoi(ID);

alter table CauHoi_NguoiTraLoi
add foreign key (IDCauHoi) references CauHoi(ID),
	foreign key (IDNguoiTraLoi) references TaiKhoan(ID);

alter table CauHoi_NguoiTraLoi_NguoiTraLoi
add foreign key (IDCauHoi_NguoiTraLoi) references CauHoi_NguoiTraLoi(ID),
	foreign key (IDNguoiTraLoi) references TaiKhoan(ID);

alter table CauHoi_NguoiDanhGia
add foreign key (IDCauHoi) references CauHoi(ID),
	foreign key (IDNguoiDanhGia) references TaiKhoan(ID);

-- Other alter table

alter table TaiKhoan
add foreign key (IDThoiKhoaBieu) references ThoiKhoaBieu(ID);

alter table Lop
add foreign key (IDGiangVien) references TaiKhoan(ID);

-- =====================================================================

use TDMUAppDB
go

-- Khoa
-- Create a sequence to generate numeric part of ID
create sequence Seq_Khoa_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_Khoa_Insert
on Khoa
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'K' + right('0000000000' + cast(next value for Seq_Khoa_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from Khoa where ID = @ID)
    begin
        set @ID = 'K' + right('0000000000' + cast(next value for Seq_Khoa_ID as varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into Khoa (ID, Ten, GhiChu)
    select @ID, Ten, GhiChu
    from inserted;
end
go

-- NhomNganh
-- Create a sequence to generate numeric part of ID
create sequence Seq_NhomNganh_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_NhomNganh_Insert
on NhomNganh
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'NN' + right('0000000000' + cast(next value for Seq_NhomNganh_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from NhomNganh where ID = @ID)
    begin
        set @ID = 'NN' + right('0000000000' + cast(next value for Seq_NhomNganh_ID as varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into NhomNganh (ID, IDKhoa, Ten, GhiChu)
    select @ID, IDKhoa, Ten, GhiChu
    from inserted;
end
go


-- Lop
-- Create a sequence to generate numeric part of ID
create sequence Seq_Lop_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_Lop_Insert
on Lop
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'L' + right('0000000000' + cast(next value for Seq_Lop_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from Lop where ID = @ID)
    begin
        set @ID = 'L' + right('0000000000' + cast(next value for Seq_Lop_ID as varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into Lop (ID, IDGiangVien, IDNhomNganh, GhiChu)
    select @ID, IDGiangVien, IDNhomNganh, GhiChu
    from inserted;
end
go

-- HocKy
-- Create a sequence to generate numeric part of ID
create sequence Seq_HocKy_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_HocKy_Insert
on HocKy
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'HK' + right('0000000000' + cast(next value for Seq_HocKy_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from HocKy where ID = @ID)
    begin
        SET @ID = 'HK' + RIGHT('0000000000' + CAST(NEXT VALUE FOR Seq_HocKy_ID AS varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into HocKy (ID, Ten, GhiChu)
    select @ID, Ten, GhiChu
    from inserted;
end
go

-- NamHoc
-- Create a sequence to generate numeric part of ID
create sequence Seq_NamHoc_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_NamHoc_Insert
on NamHoc
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'NH' + right('0000000000' + cast(next value for Seq_NamHoc_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from NamHoc where ID = @ID)
    begin
        SET @ID = 'NH' + RIGHT('0000000000' + CAST(NEXT VALUE FOR Seq_NamHoc_ID AS varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into NamHoc (ID, Ten, GhiChu)
    select @ID, Ten, GhiChu
    from inserted;
end
go

-- MonHoc
-- Create a sequence to generate numeric part of ID
create sequence Seq_MonHoc_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_MonHoc_Insert
on MonHoc
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'MH' + right('0000000000' + cast(next value for Seq_MonHoc_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from MonHoc where ID = @ID)
    begin
        SET @ID = 'MH' + RIGHT('0000000000' + CAST(NEXT VALUE FOR Seq_MonHoc_ID AS varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into MonHoc (ID, IDHocKy, IDNamHoc, Ten, SoTC, GhiChu)
    select @ID, IDHocKy, IDNamHoc, Ten, SoTC, GhiChu
    from inserted;
end
go

------------------------------------------------------------------------------------

-- QuyenTruyCap
create sequence Seq_QuyenTruyCap_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_QuyenTruyCap_Insert
on QuyenTruyCap
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'QTC' + right('0000000000' + cast(next value for Seq_QuyenTruyCap_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from QuyenTruyCap where ID = @ID)
    begin
        set @ID = 'QTC' + right('0000000000' + cast(next value for Seq_QuyenTruyCap_ID as varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into QuyenTruyCap (ID , Ten, CapDo , GhiChu)
    select @ID, Ten, CapDo, GhiChu
    from inserted;
end
go

-- TaiKhoan
create sequence Seq_TaiKhoan_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_TaiKhoan_Insert
on TaiKhoan
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'TK' + right('0000000000' + cast(next value for Seq_TaiKhoan_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from TaiKhoan where ID = @ID)
    begin
        set @ID = 'TK' + right('0000000000' + cast(next value for Seq_TaiKhoan_ID as varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into TaiKhoan (ID , IDThoiKhoaBieu , IDLop,HoTen ,NgaySinh ,SDT ,DiaChi ,GioiTinh ,CCCD ,ChucVu ,IDQuyenTruyCap ,TenTaiKhoan ,MatKhau ,ImagePath  , GhiChu)
    select @ID, IDThoiKhoaBieu , IDLop,HoTen ,NgaySinh ,SDT ,DiaChi ,GioiTinh ,CCCD ,ChucVu ,IDQuyenTruyCap ,TenTaiKhoan ,MatKhau ,ImagePath  , GhiChu
    from inserted;
end
go

--BuoiHoc
create sequence Seq_BuoiHoc_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_BuoiHoc_Insert
on BuoiHoc
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'BH' + right('0000000000' + cast(next value for Seq_BuoiHoc_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from BuoiHoc where ID = @ID)
    begin
        set @ID = 'BH' + right('0000000000' + cast(next value for Seq_BuoiHoc_ID as varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into BuoiHoc (ID, NgayDienRa, NgayKetThuc, SoTiet, Phong, GhiChu)
    select @ID, NgayDienRa, NgayKetThuc, SoTiet, Phong, GhiChu
    from inserted;
end
go

--BangDiem
create sequence Seq_BangDiem_ID
    start with 1
    increment by 1;
go

-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_BangDiem_Insert
on BangDiem
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'BD' + right('0000000000' + cast(next value for Seq_BangDiem_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from BangDiem where ID = @ID)
    begin
        set @ID = 'BD' + right('0000000000' + cast(next value for Seq_BangDiem_ID as varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into BangDiem (ID , IDSinhVien  , IDMonHoc  ,DiemGiuaKy ,DiemCuoiKy,DiemTongKet   , GhiChu)
    select @ID , IDSinhVien  , IDMonHoc  ,DiemGiuaKy ,DiemCuoiKy,DiemTongKet   , GhiChu
    from inserted;
end
go

--NhomMonHoc
create sequence Seq_NhomMonHoc_ID
    start with 1
    increment by 1;
go


create trigger tr_NhomMonHoc_Insert
on NhomMonHoc
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);


    select @ID = 'NMH' + right('0000000000' + cast(next value for Seq_NhomMonHoc_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from NhomMonHoc where ID = @ID)
    begin
        set @ID = 'NMH' + right('0000000000' + cast(next value for Seq_NhomMonHoc_ID as varchar(10)), 10);
    end;


    insert into NhomMonHoc (ID , IDGiangVien   , IDMonHoc  ,SoLuong , GhiChu)
    select @ID , IDGiangVien   , IDMonHoc  ,SoLuong , GhiChu
    from inserted;
end
go

--NhomMonHoc_SinhVien 
create sequence Seq_NhomMonHoc_SinhVien_ID
    start with 1
    increment by 1;
go

create trigger tr_NhomMonHoc_SinhVien_Insert
on NhomMonHoc_SinhVien 
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);


    select @ID = 'NMH_SV' + right('0000000000' + cast(next value for Seq_NhomMonHoc_SinhVien_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from NhomMonHoc_SinhVien where ID = @ID)
    begin
        set @ID = 'NMH_SV' + right('0000000000' + cast(next value for Seq_NhomMonHoc_SinhVien_ID as varchar(10)), 10);
    end;


    insert into NhomMonHoc_SinhVien(ID , IDSinhVien  ,IDNhomMonHoc ,NgayDangKy  ,GhiChu)
    select @ID , IDSinhVien  ,IDNhomMonHoc ,NgayDangKy  ,GhiChu
    from inserted;
end
go

--NhomMonHoc_BuoiHoc 
create sequence Seq_NhomMonHoc_BuoiHoc_ID
    start with 1
    increment by 1;
go

create trigger tr_NhomMonHoc_BuoiHoc_Insert
on NhomMonHoc_BuoiHoc
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);


    select @ID = 'NMH_BH' + right('0000000000' + cast(next value for Seq_NhomMonHoc_BuoiHoc_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from NhomMonHoc_BuoiHoc where ID = @ID)
    begin
        set @ID = 'NMH_BH' + right('0000000000' + cast(next value for Seq_NhomMonHoc_BuoiHoc_ID as varchar(10)), 10);
    end;


    insert into NhomMonHoc_BuoiHoc (ID , IDNhomMonHoc    , IDBuoiHoc , GhiChu)
    select @ID , IDNhomMonHoc    , IDBuoiHoc , GhiChu
    from inserted;
end
go

--DiemRenLuyen
create sequence Seq_DiemRenLuyen_ID
    start with 1
    increment by 1;
go

create trigger tr_DiemRenLuyen_Insert
on DiemRenLuyen
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);


    select @ID = 'DRL' + right('0000000000' + cast(next value for Seq_DiemRenLuyen_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from DiemRenLuyen where ID = @ID)
    begin
        set @ID = 'DRL' + right('0000000000' + cast(next value for Seq_DiemRenLuyen_ID as varchar(10)), 10);
    end;


    insert into DiemRenLuyen (ID, IDSinhVien, IDHocKy, IDNamHoc, TongDiem, GhiChu)
    select @ID, IDSinhVien, IDHocKy, IDNamHoc, TongDiem, GhiChu
    from inserted;
end
go

--ThoiKhoaBieu
create sequence Seq_ThoiKhoaBieu_ID
    start with 1
    increment by 1;
go


create trigger tr_ThoiKhoaBieu_Insert
on ThoiKhoaBieu
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);


    select @ID = 'TKB' + right('0000000000' + cast(next value for Seq_ThoiKhoaBieu_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from ThoiKhoaBieu where ID = @ID)
    begin
        set @ID = 'TKB' + right('0000000000' + cast(next value for Seq_ThoiKhoaBieu_ID as varchar(10)), 10);
    end;


    insert into ThoiKhoaBieu (ID , IDTaiKhoan, GhiChu)
    select @ID , IDTaiKhoan, GhiChu
    from inserted;
end
go

--ThoiKhoaBieu_BuoiHoc
create sequence Seq_ThoiKhoaBieu_BuoiHoc_ID
    start with 1
    increment by 1;
go

create trigger tr_ThoiKhoaBieu_BuoiHoc_Insert
on ThoiKhoaBieu_BuoiHoc
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);


    select @ID = 'TKB_BH' + right('0000000000' + cast(next value for Seq_ThoiKhoaBieu_BuoiHoc_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from ThoiKhoaBieu_BuoiHoc where ID = @ID)
    begin
        set @ID = 'TKB_BH' + right('0000000000' + cast(next value for Seq_ThoiKhoaBieu_BuoiHoc_ID as varchar(10)), 10);
    end;


    insert into ThoiKhoaBieu_BuoiHoc (ID , IDThoiKhoaBieu ,IDBuoiHoc ,NgayThu , GhiChu)
    select @ID , IDThoiKhoaBieu ,IDBuoiHoc ,NgayThu , GhiChu
    from inserted;
end
go

-- LoaiThongBao
create sequence Seq_LoaiThongBao_ID
    start with 1
    increment by 1;
go

create trigger tr_LoaiThongBao_Insert
on LoaiThongBao
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'LTB' + right('0000000000' + cast(next value for Seq_LoaiThongBao_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from ThongBao where ID = @ID)
    begin
        set @ID = 'LTB' + right('0000000000' + cast(next value for Seq_LoaiThongBao_ID as varchar(10)), 10);
    end;

    insert into LoaiThongBao (ID , Ten  ,CapDo, GhiChu)
    select @ID, Ten, CapDo, GhiChu
    from inserted;
end
go

--ThongBao
create sequence Seq_ThongBao_ID
    start with 1
    increment by 1;
go

create trigger tr_ThongBao_Insert
on ThongBao
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'TB' + right('0000000000' + cast(next value for Seq_ThongBao_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from ThongBao where ID = @ID)
    begin
        set @ID = 'TB' + right('0000000000' + cast(next value for Seq_ThongBao_ID as varchar(10)), 10);
    end;

    insert into ThongBao (ID, IDLoaiThongBao, TieuDe, NoiDung, GhiChu)
    select @ID, IDLoaiThongBao, TieuDe, NoiDung, GhiChu
    from inserted;
end
go

-- ThongBao_NguoiChinhSua
create sequence Seq_ThongBao_NguoiChinhSua_ID
    start with 1
    increment by 1;
go

create trigger tr_ThongBao_NguoiChinhSua_Insert
on ThongBao_NguoiChinhSua
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'TB_NCS' + right('0000000000' + cast(next value for Seq_ThongBao_NguoiChinhSua_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from ThongBao_NguoiChinhSua where ID = @ID)
    begin
        set @ID = 'TB_NCS' + right('0000000000' + cast(next value for Seq_ThongBao_NguoiChinhSua_ID as varchar(10)), 10);
    end;

    insert into ThongBao_NguoiChinhSua (ID , IDThongBao  ,IDNguoiChinhSua, NgayChinhSua, GhiChu)
    select @ID, IDThongBao, IDNguoiChinhSua, NgayChinhSua, GhiChu
    from inserted;
end
go

-- ThongBao_NguoiNhan
create sequence Seq_ThongBao_NguoiNhan_ID
    start with 1
    increment by 1;
go


create trigger tr_ThongBao_NguoiNhan_Insert
on ThongBao_NguoiNhan
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'TB_NN' + right('0000000000' + cast(next value for Seq_ThongBao_NguoiNhan_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from ThongBao_NguoiNhan where ID = @ID)
    begin
        set @ID = 'TB_NN' + right('0000000000' + cast(next value for Seq_ThongBao_NguoiNhan_ID as varchar(10)), 10);
    end;

    insert into ThongBao_NguoiNhan (ID , IDThongBao ,IDNguoiNhan, NgayNhan, GhiChu)
    select @ID, IDThongBao, IDNguoiNhan, NgayNhan, GhiChu
    from inserted;
end
go

--TLBaiViet
create sequence Seq_TLBaiViet_ID
    start with 1
    increment by 1;
go

create trigger tr_TLBaiViet_Insert
on TLBaiViet
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);


    select @ID = 'TLBV' + right('0000000000' + cast(next value for Seq_TLBaiViet_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from TLBaiViet where ID = @ID)
    begin
        set @ID = 'TLBV' + right('0000000000' + cast(next value for Seq_TLBaiViet_ID as varchar(10)), 10);
    end;


    insert into TLBaiViet (ID ,Ten , GhiChu)
    select @ID ,Ten , GhiChu
    from inserted;
end
go

-- Create a sequence to generate numeric part of ID
create sequence Seq_BaiViet_ID
    start with 1
    increment by 1;
go

-- BaiViet
-- Create a trigger to automatically set the ID when a new record is inserted
create trigger tr_BaiViet_Insert
on BaiViet
instead of insert
as
begin
    set nocount on;

    declare @ID varchar(50);

    -- Generate the new ID using the sequence
    select @ID = 'BV' + right('0000000000' + cast(next value for Seq_BaiViet_ID as varchar(10)), 10)
    from inserted;

	-- Check if the generated ID already exists, and if so, increment the numeric part
    while exists (select 1 from BaiViet where ID = @ID)
    begin
        SET @ID = 'BV' + RIGHT('0000000000' + CAST(NEXT VALUE FOR Seq_BaiViet_ID AS varchar(10)), 10);
    end;

    -- Insert the new record with the generated ID
    insert into BaiViet(ID, IDTLBaiViet, TieuDe, NoiDung, GhiChu)
    select @ID, IDTLBaiViet, TieuDe, NoiDung, GhiChu
    from inserted;
end
go

-- BaiViet_NguoiChinhSua
create sequence Seq_BaiViet_NguoiChinhSua_ID
    start with 1
    increment by 1;
go

create trigger tr_BaiViet_NguoiChinhSua_Insert
on BaiViet_NguoiChinhSua
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'BV_NCS' + right('0000000000' + cast(next value for Seq_BaiViet_NguoiChinhSua_ID as varchar(10)), 10)
    from inserted;


    while exists (select 1 from BaiViet_NguoiChinhSua where ID = @ID)
    begin
        set @ID = 'BV_NCS' + right('0000000000' + cast(next value for Seq_BaiViet_NguoiChinhSua_ID as varchar(10)), 10);
    end;

    insert into BaiViet_NguoiChinhSua(ID ,IDBaiViet ,IDNguoiChinhSua ,NgayChinhSua , GhiChu)
    select @ID ,IDBaiViet, IDNguoiChinhSua, NgayChinhSua , GhiChu
    from inserted;
end
go

--BaiViet_NguoiThamGia
create sequence Seq_BaiViet_NguoiThamGia_ID
    start with 1
    increment by 1;
go

create trigger tr_BaiViet_BaiViet_NguoiThamGia_Insert
on BaiViet_NguoiThamGia
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'BV_NTG' + right('0000000000' + cast(next value for Seq_BaiViet_NguoiThamGia_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from BaiViet_NguoiThamGia where ID = @ID)
    begin
        set @ID = 'BV_NTG' + right('0000000000' + cast(next value for Seq_BaiViet_NguoiThamGia_ID as varchar(10)), 10);
    end;

    insert into BaiViet_NguoiThamGia (ID ,IDBaiViet ,IDNguoiThamGia, NgayDangKy , GhiChu)
    select @ID, IDBaiViet, IDNguoiThamGia, NgayDangKy, GhiChu
    from inserted;
end
go

--NhomChat
create sequence Seq_NhomChat_ID
    start with 1
    increment by 1;
go

create trigger tr_NhomChat_Insert
on NhomChat
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'NC' + right('0000000000' + cast(next value for Seq_NhomChat_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from NhomChat where ID = @ID)
    begin
        set @ID = 'NC' + right('0000000000' + cast(next value for Seq_NhomChat_ID as varchar(10)), 10);
    end;

    insert into NhomChat (ID ,Ten ,NgayTao, GhiChu)
    select @ID ,Ten ,NgayTao, GhiChu
    from inserted;
end
go

-- NhomChat_NguoiThamGia
create sequence Seq_NhomChat_NguoiThamGia_ID
    start with 1
    increment by 1;
go

create trigger tr_NhomChat_NguoiThamGia_Insert
on NhomChat_NguoiThamGia
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'NC_NTG' + right('0000000000' + cast(next value for Seq_NhomChat_NguoiThamGia_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from NhomChat_NguoiThamGia where ID = @ID)
    begin
        set @ID = 'NC_NTG' + right('0000000000' + cast(next value for Seq_NhomChat_NguoiThamGia_ID as varchar(10)), 10);
    end;

    insert into NhomChat_NguoiThamGia (ID, IDNhomChat, IDNguoiThamGia, NgayThamGia  , GhiChu)
    select @ID ,IDNhomChat, IDNguoiThamGia, NgayThamGia , GhiChu
    from inserted;
end
go

--TinNhan
create sequence Seq_TinNhan_ID
    start with 1
    increment by 1;
go

create trigger tr_TinNhan_Insert
on TinNhan
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'TN' + right('0000000000' + cast(next value for Seq_TinNhan_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from TinNhan where ID = @ID)
    begin
        set @ID = 'TN' + right('0000000000' + cast(next value for Seq_TinNhan_ID as varchar(10)), 10);
    end;

    insert into TinNhan (ID ,IDTaiKhoan ,NoiDung ,NgayGui , GhiChu)
    select @ID, IDTaiKhoan, NoiDung, NgayGui, GhiChu
    from inserted;
end
go

--TinNhan_GuiDen

create sequence Seq_TinNhan_GuiDen_ID
    start with 1
    increment by 1;
go

create trigger tr_TinNhan_GuiDen_Insert
on TinNhan_GuiDen
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'TN_GD' + right('0000000000' + cast(next value for Seq_TinNhan_GuiDen_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from TinNhan_GuiDen where ID = @ID)
    begin
        set @ID = 'TN_GD' + right('0000000000' + cast(next value for Seq_TinNhan_GuiDen_ID as varchar(10)), 10);
    end;

    insert into TinNhan_GuiDen (ID ,IDTinNhan ,IDNguoiNhan ,IDNhomNhan ,DaXem , GhiChu)
    select @ID ,IDTinNhan ,IDNguoiNhan ,IDNhomNhan ,DaXem , GhiChu
    from inserted;
end
go

--ChuDeCauHoi
create sequence Seq_ChuDeCauHoi_ID
    start with 1
    increment by 1;
go

create trigger tr_ChuDeCauHoi_Insert
on ChuDeCauHoi
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'CDCH' + right('0000000000' + cast(next value for Seq_ChuDeCauHoi_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from ChuDeCauHoi where ID = @ID)
    begin
        set @ID = 'CDCH' + right('0000000000' + cast(next value for Seq_ChuDeCauHoi_ID as varchar(10)), 10);
    end;

    insert into ChuDeCauHoi (ID ,Ten , GhiChu)
    select @ID ,Ten , GhiChu
    from inserted;
end
go

--CauHoi
create sequence Seq_CauHoi_ID
    start with 1
    increment by 1;
go

create trigger tr_CauHoi_Insert
on CauHoi
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'CH' + right('0000000000' + cast(next value for Seq_CauHoi_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from CauHoi where ID = @ID)
    begin
        set @ID = 'CH' + right('0000000000' + cast(next value for Seq_CauHoi_ID as varchar(10)), 10);
    end;

    insert into CauHoi (ID, IDNguoiGui, TieuDe, NoiDung, NgayGui, DuocDuyet, GhiChu)
    select @ID, IDNguoiGui, TieuDe, NoiDung, NgayGui, DuocDuyet, GhiChu
    from inserted;
end
go

--CauHoi_ChuDeCauHoi
create sequence Seq_CauHoi_ChuDeCauHoi_ID
    start with 1
    increment by 1;
go

create trigger tr_CauHoi_ChuDeCauHoi_Insert
on CauHoi_ChuDeCauHoi
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'CH_CDCH' + right('0000000000' + cast(next value for Seq_CauHoi_ChuDeCauHoi_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from CauHoi_ChuDeCauHoi where ID = @ID)
    begin
        set @ID = 'CH_CDCH' + right('0000000000' + cast(next value for Seq_CauHoi_ChuDeCauHoi_ID as varchar(10)), 10);
    end;

    insert into CauHoi_ChuDeCauHoi (ID ,IDCauHoi ,IDChuDeCauHoi, GhiChu)
    select @ID ,IDCauHoi ,IDChuDeCauHoi, GhiChu
    from inserted;
end
go

--CauHoi_NguoiTraLoi
create sequence Seq_CauHoi_NguoiTraLoi_ID
    start with 1
    increment by 1;
go

create trigger tr_CauHoi_NguoiTraLoi_Insert
on CauHoi_NguoiTraLoi
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'CH_NTL' + right('0000000000' + cast(next value for Seq_CauHoi_NguoiTraLoi_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from CauHoi_NguoiTraLoi where ID = @ID)
    begin
        set @ID = 'CH_NTL' + right('0000000000' + cast(next value for Seq_CauHoi_NguoiTraLoi_ID as varchar(10)), 10);
    end;

    insert into CauHoi_NguoiTraLoi (ID ,IDCauHoi ,IDNguoiTraLoi ,NoiDung ,NgayTraLoi , GhiChu)
    select @ID ,IDCauHoi ,IDNguoiTraLoi ,NoiDung ,NgayTraLoi , GhiChu
    from inserted;
end
go

--CauHoi_NguoiTraLoi_NguoiTraLoi
create sequence Seq_CauHoi_NguoiTraLoi_NguoiTraLoi_ID
    start with 1
    increment by 1;
go

create trigger tr_CauHoi_NguoiTraLoi_NguoiTraLoi_Insert
on CauHoi_NguoiTraLoi_NguoiTraLoi
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'CH_NTL_NTL' + right('0000000000' + cast(next value for Seq_CauHoi_NguoiTraLoi_NguoiTraLoi_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from CauHoi_NguoiTraLoi_NguoiTraLoi where ID = @ID)
    begin
        set @ID = 'CH_NTL' + right('0000000000' + cast(next value for Seq_CauHoi_NguoiTraLoi_NguoiTraLoi_ID as varchar(10)), 10);
    end;

    insert into CauHoi_NguoiTraLoi_NguoiTraLoi (ID ,IDCauHoi_NguoiTraLoi ,IDNguoiTraLoi ,NoiDung ,NgayTraLoi , GhiChu)
    select @ID, IDCauHoi_NguoiTraLoi, IDNguoiTraLoi, NoiDung, NgayTraLoi, GhiChu
    from inserted;
end
go

--CauHoi_NguoiDanhGia
create sequence Seq_CauHoi_NguoiDanhGia_ID
    start with 1
    increment by 1;
go

create trigger tr_CauHoi_NguoiDanhGia_Insert
on CauHoi_NguoiDanhGia
instead of insert
as
begin
    set nocount on;
    declare @ID varchar(50);

    select @ID = 'CH_CDCH' + right('0000000000' + cast(next value for Seq_CauHoi_NguoiDanhGia_ID as varchar(10)), 10)
    from inserted;

    while exists (select 1 from CauHoi_NguoiDanhGia where ID = @ID)
    begin
        set @ID = 'CH_CDCH' + right('0000000000' + cast(next value for Seq_CauHoi_NguoiDanhGia_ID as varchar(10)), 10);
    end;

    insert into CauHoi_NguoiDanhGia (ID ,IDCauHoi ,IDNguoiDanhGia,HuuIch ,NgayDanhGia , GhiChu)
    select @ID ,IDCauHoi ,IDNguoiDanhGia,HuuIch ,NgayDanhGia , GhiChu
    from inserted;
end
go