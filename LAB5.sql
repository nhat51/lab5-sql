CREATE DATABASE LAB5
DROP DATABASE LAB5
USE LAB5
GO
CREATE TABLE PhongBan(
MaPB VARCHAR(7) PRIMARY KEY NOT NULL,
TenPB NVARCHAR(50) NOT NULL
)
INSERT INTO PhongBan VALUES ('T2004M',N'Phòng Điều  Hành')
INSERT INTO PhongBan VALUES ('T2005M',N'Phòng Tài Vụ')
INSERT INTO PhongBan VALUES ('T2006M',N'Tổ Bảo Vệ')
INSERT INTO PhongBan VALUES ('T2007M',N'Tổ Lao Công')
INSERT INTO PhongBan VALUES ('T2008M',N'Phòng Hành Chính')
SELECT * FROM PhongBan

CREATE TABLE NhanVien(
MaNV VARCHAR(7) PRIMARY KEY NOT NULL,
TenNV NVARCHAR(50) NOT NULL,
NgaySinh DATETIME CHECK (NgaySinh < GETDATE()),
SoCMND CHAR(9),
GioiTinh CHAR(1),
CONSTRAINT chk_gioitinh CHECK (GioiTinh IN ('M','F')),
DiaChi NVARCHAR(20) ,
NgayVaoLam DATETIME CHECK (NgayVaoLam > YEAR(1999) ),
MaPB VARCHAR(7) NOT NULL,
CONSTRAINT fk_MaPB FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB)
)
GO
INSERT INTO NhanVien VALUES
('001',N'Nguyễn Quang Nhật','2001-01-05','127484219','M',N'Hà Nội','2020-07-08','T2008M'),
('002',N'Thất Vũ Hải','1998-04-03','163712219','M',N'Hà Nội','2020-06-07','T2004M'),
('003',N'Lục Đại Môn Phái','1997-02-14','958342174','M',N'Hà Nội','2019-04-25','T2004M'),
('004',N'Lại Thị Liên','1997-05-24','958473628','F',N'Hải Phòng','2017-02-19','T2005M'),
('005',N'Hoàng Thu Hà','1996-06-23','958473652','F',N'Hải Phòng','2018-08-12','T2004M')
SELECT * FROM NhanVien
CREATE TABLE LuongDA(
MaDA VARCHAR(8)  NOT NULL,
MaNV VARCHAR(7) NOT NULL,
NgayNhan DATETIME  NOT NULL,
SoTien MONEY CHECK (SoTien > 0),
PRIMARY KEY (MaDA,MaNV),
CONSTRAINT FK FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO
INSERT INTO LuongDA VALUES
('123','001','2020-08-05',2100), 
('554','002','2020-08-12',1000),
('142','003','2020-08-11',5000),
('723','004','2020-08-09',500)

--Hiển Thị Ra 
SELECT *FROM LuongDA
SELECT * FROM NhanVien WHERE GioiTinh = 'F'
--Hiển thị mức lương của những nhân viên phòng hành chính.
SELECT TenNV, SoTien FROM NhanVien INNER JOIN LuongDA ON NhanVien.MaNV = LuongDA.MaNV WHERE NhanVien.MaPB= 'T2008M'
SELECT MaNV,TenNV FROM NhanVien INNER JOIN PhongBan ON PhongBan.MaPB = NhanVien.MaPB
--Hiển thị số lượng nhân viên của từng phòng.
SELECT DISTINCT MaPB,MaNV,TenNV FROM NhanVien
SELECT COUNT(MaNV) AS TongNV FROM NhanVien
--Viết một query để hiển thị những nhân viên mà tham gia ít nhất vào một dự án.
SELECT TenNV, MaDA FROM NhanVien INNER JOIN LuongDA ON NhanVien.MaNV = LuongDA.MaNV
--Hiển thị phòng có số lượng Nv nhiều nhất
SELECT TOP 1 PhongBan.MaPB, PhongBan.TenPB, COUNT(PhongBan.MaPB) AS SoLuong FROM PhongBan 
INNER JOIN NhanVien ON PhongBan.MaPB = NhanVien.MaPB
GROUP BY PhongBan.MaPB, NhanVien.MaPB, PhongBan.TenPB ORDER BY SoLuong DESC
--Tính tổng số lượng nhân viên trong phòng hành chính 
SELECT COUNT(MaNV) AS PhongHanhChinh FROM NhanVien WHERE NhanVien.MaPB = 'T2008M'
--Hiển thị tống lương của các nhân viên có số CMND tận cùng bằng 9.
SELECT SUM(SoTien) FROM LuongDA INNER JOIN NhanVien ON NhanVien.MaNV  = LuongDA.MaNV WHERE SoCMND LIKE '%9'

SELECT RIGHT(SoCMND, 1) AS So9, SUM(SoTien) AS Tong, SoCMND, SoTien FROM NhanVien  
INNER JOIN LuongDA ON NhanVien.MaNV  = LuongDA.MaNV
WHERE RIGHT(SoCMND, 1) = '9'
GROUP BY SoCMND, SoTien
--Tìm nhân viên có số lương cao nhất.
SELECT MAX(LuongDA.SoTien),(NhanVien.TenNV) FROM  NhanVien INNER JOIN LuongDA ON LuongDA.MaNV = NhanVien.MaNV
GROUP BY NhanVien.TenNV,LuongDA.SoTien

SELECT TOP 1 (SoTien) AS TienNhieu FROM LuongDA

SELECT Max(SoTien) AS 'NhieuTien' FROM LuongDA

SELECT Top 1 SoTien, (TenNV)  AS 'Nhieu Tien Nhat' FROM LuongDA INNER JOIN NhanVien ON NhanVien.MaNV = LuongDA.MaNV
SELECT TOP 1 SoTien,TenNV FROM (SELECT TOP 1 SoTien FROM LuongDA ORDER BY SoTien DESC) LuongDA ORDER BY SoTien ASC 
--
DROP TABLE PhongBan
DROP TABLE NhanVien
DROP TABLE LuongDA

SELECT *FROM PhongBan
SELECT * FROM NhanVien
SELECT * FROM LuongDA
