--DROP DATABASE QLCF; 
CREATE DATABASE QLCF
USE QLCF


CREATE TABLE phanQuyen (
  Quyen INT PRIMARY KEY NOT NULL,
  QLNhapHang INT NOT NULL,
  QLSanPham INT NOT NULL,
  QLNhanVien INT NOT NULL,
  QLKhachHang INT NOT NULL,
  ThongKe INT NOT NULL
)

CREATE TABLE nhanvien (
    MaNV VARCHAR(20) PRIMARY KEY NOT NULL,
    TenNV nVARCHAR(255) NOT NULL,
    GioiTinh nVARCHAR(10) NOT NULL,
    DiaChi nVARCHAR(255) NOT NULL,
    SDT VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Quyen INT NOT NULL,
	TrangThai nVARCHAR(50) NOT NULL,
    FOREIGN KEY (Quyen) REFERENCES phanQuyen(Quyen)
);

CREATE TABLE taikhoan (
    MaTK VARCHAR(20) PRIMARY KEY NOT NULL,
    MatKhau VARCHAR(50) NOT NULL,
	TinhTrang nVARCHAR(20) NOT NULL,
	FOREIGN KEY (MaTK) REFERENCES nhanvien(MaNV)
);

CREATE TABLE khuyenmai (
    MaKM VARCHAR(20) PRIMARY KEY NOT NULL,
    TenKM nVARCHAR(255) NOT NULL,
    GiamGia INT NOT NULL,
	DieuKien INT NOT NULL,
	NgayBD date NOT NULL,
	NgayKT date NOT NULL
);

CREATE TABLE khachhang (
    MaKH VARCHAR(20) PRIMARY KEY NOT NULL,
    TenKH nVARCHAR(255) NOT NULL,
    GioiTinh nVARCHAR(10) NOT NULL,
    DiaChi nVARCHAR(255) NOT NULL,
    SDT VARCHAR(20) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    DiemTichLuy INT NOT NULL
);

CREATE TABLE nhacungcap (
    MaNCC VARCHAR(20) PRIMARY KEY NOT NULL,
    TenNCC nVARCHAR(255) NOT NULL,
    DiaChi nVARCHAR(255) NOT NULL,
    SDT VARCHAR(20) NOT NULL,
	LoaiNglCC nVARCHAR(255) NOT NULL
);

CREATE TABLE sanpham (
    MaSP VARCHAR(20) PRIMARY KEY NOT NULL,
    TenSP nVARCHAR(255) NOT NULL,
	HinhAnh VARCHAR(255) NOT NULL,
    Gia INT NOT NULL, 
	LoaiSP nVARCHAR(255) NOT NULL, 
	TrangThai nVARCHAR(50) NOT NULL
);

CREATE TABLE nguyenlieu (
    MaNgl VARCHAR(20) PRIMARY KEY NOT NULL,
    TenNgl nVARCHAR(255) NOT NULL,
	HinhAnh VARCHAR(255) NOT NULL,
    SoLuong DECIMAL(8, 4) NOT NULL
);

CREATE TABLE sanpham_nguyenlieu (
    MaSP VARCHAR(20) NOT NULL,
    MaNgl VARCHAR(20) NOT NULL,
	TieuHao DECIMAL(8, 4) NOT NULL,
    PRIMARY KEY (MaSP, MaNgl),
    FOREIGN KEY (MaSP) REFERENCES sanpham(MaSP),
    FOREIGN KEY (MaNgl) REFERENCES nguyenlieu(MaNgl)
);

CREATE TABLE phieunhap (
    MaPN VARCHAR(20) PRIMARY KEY NOT NULL,
    MaNV VARCHAR(20) NOT NULL,
	MaNCC VARCHAR(20) NOT NULL,
    NgayNhap DATE NOT NULL,
    TongTien INT NOT NULL,
    FOREIGN KEY (MaNV) REFERENCES nhanvien(MaNV),
	FOREIGN KEY (MaNCC) REFERENCES nhacungcap(MaNCC),
);

CREATE TABLE chitietphieunhap (
    MaPN VARCHAR(20) NOT NULL,
    MaNgl VARCHAR(20) NOT NULL,
	TenNgl nVARCHAR(255) NOT NULL,
    SoLuong DECIMAL(8, 4) NOT NULL,
    DonGia INT NOT NULL,
    FOREIGN KEY (MaPN) REFERENCES phieunhap(MaPN),
    FOREIGN KEY (MaNgl) REFERENCES nguyenlieu(MaNgl),
	PRIMARY KEY (MaPN, MaNgl)
);

CREATE TABLE hoadon (
    MaHD VARCHAR(20) PRIMARY KEY NOT NULL,
    MaNV VARCHAR(20) NOT NULL,
    MaKH VARCHAR(20) NOT NULL,
    NgayTao DATE NOT NULL,
    TongTien INT NOT NULL,
    MaKM VARCHAR(20) NOT NULL,
    FOREIGN KEY (MaKH) REFERENCES khachhang(MaKH),
    FOREIGN KEY (MaNV) REFERENCES nhanvien(MaNV),
    FOREIGN KEY (MaKM) REFERENCES khuyenmai(MaKM)
);

CREATE TABLE chitiethoadon (
    MaHD VARCHAR(20) NOT NULL,
    MaSP VARCHAR(20) NOT NULL,
	TenSP nVARCHAR(255) NOT NULL,
    SoLuong INT NOT NULL,
    DonGia INT NOT NULL,
    FOREIGN KEY (MaHD) REFERENCES hoadon(MaHD),
    FOREIGN KEY (MaSP) REFERENCES sanpham(MaSP),
    PRIMARY KEY (MaHD, MaSP)
);

INSERT INTO khuyenmai(MaKM, TenKM, GiamGia, DieuKien, NgayBD, NgayKT) VALUES
('kkm', 'Không khuyến mãi', 0, 0, '2023-11-16', '2073-11-30'),
('kmkt', 'Khuyến mãi khai trương', 10, 0, '2023-10-01', '2023-10-31'),
('km150', 'khuyến mãi 20% hóa đơn từ 150.000đ', 20, 150000, '2023-11-01', '2023-11-15'),
('km304', 'khuyến mãi 30% hóa đơn trong 30/4-1/5', 20, 0, '2024-04-30', '2024-01-05')

INSERT INTO khachhang (MaKH, TenKH, GioiTinh, DiaChi, SDT, Email, DiemTichLuy) VALUES
('KH001', 'Phan Thanh Nam', N'Nam', '202 Đường Trần Hưng Đạo, TP HCM', '0812444969', 'phanthanhnam@gmail.com', 10000),
('KH002', 'Nguyễn Văn An', N'Nam', '123 Đường Nguyễn Văn Cừ, Quận 3, TP HCM', '0901234567', 'nguyenvanan@gmail.com', 30000),
('KH003', 'Nguyễn Thanh Bảo', N'Nam', '456 Đường Nguyễn Văn Linh, Quận 2, TP HCM', '0909876543', 'nguyenthanhbao@gmail.com', 20000),
('KH004', 'Lê Văn Chuẩn', N'Nam', '789 Đường Trần Hưng Đạo, Quận 3, TP HCM', '0905678912', 'levanchuan@gmail.com', 10000),
('KH005', 'Phạm Thị Doanh', N'Nữ', '321 Đường Võ Văn Kiệt, Quận 4, TP HCM', '0902468135', 'phamthidoanh@gmail.com', 60000),
('KH006', 'Hoàng Văn Sơn', N'Nam', '654 Đường Nguyễn Thị Minh Khai, Quận 5, TP HCM', '0901357924', 'hoangvanson@gmail.com', 40000),
('KH007', 'Nguyễn Thị Ý Nhi', N'Nữ', '987 Đường Điện Biên Phủ, Quận 6, TP HCM', '0905792468', 'nguyenthiynhi@gmail.com', 50000),
('KH008', 'Trần Văn Giang', N'Nam', '258 Đường Trần Quang Khải, Quận 7, TP HCM', '0902468135', 'tranvanGiang@gmail.com', 30000),
('KH009', 'Lê Thị Hải Yến', N'Nữ', '369 Đường Lý Tự Trọng, Quận 8, TP HCM', '0908912345', 'lethihaiyen@gmail.com', 0),
('KH010', 'Trần Văn Nam', N'Nam', '741 Đường Nguyễn Văn Cừ, Quận 9, TP HCM', '0906789123', 'tranvannam@gmail.com', 20000),
('KH011', 'Hoàng Thị Khánh Như', N'Nữ', '852 Đường Phạm Văn Đồng, Quận 10, TP HCM', '0903456789', 'hoangthikhanhnhu@gmail.com', 10000);

INSERT INTO nhacungcap (MaNCC, TenNCC, DiaChi, SDT, LoaiNglCC) VALUES
('NCC001', N'Cửa hàng VGFood', N'123 Đường Lê Lợi, Quận 1, TP HCM', '0901234567', 'Trái cây, đường'),
('NCC002', N'Đại lý bia nước ngọt Vạn Hưng', N'456 Đường Nguyễn Văn Linh, Quận 2, TP HCM', '0909876543', 'Nước giải khát'),
('NCC003', N'Cà Phê Trung Nguyên Sài Gòn', N'789 Đường Trần Hưng Đạo, Quận 3, TP HCM', '0905678912', 'Cà phê'),
('NCC004', N'Đại lý phân phối sữa Vinamilk', N'321 Đường Võ Văn Kiệt, Quận 4, TP HCM', '0902468135', 'Sữa'),
('NCC005', N'Công ty TNHH Đại Vạn Phát', N'259B Đường Hai Bà Trưng, Phường 6, Quận 3, TP HCM', '0901357924', 'Nguyên liệu trà'),
('NCC006', N'Ly nhựa Bình Minh', N'32A Đường Thống Nhất, Phường 5, Quận 6, TP HCM', '0901357933', 'Ly, ống hút')

INSERT INTO phanQuyen (Quyen, QLNhapHang, QLSanPham, QLNhanVien, QLKhachHang, ThongKe) VALUES
(0, 1, 1, 1, 1, 1),
(1, 1, 1, 1, 1, 1),
(2, 0, 0, 1, 0, 0);

INSERT INTO nhanvien (MaNV, TenNV, GioiTinh, DiaChi, SDT, Email, Quyen, TrangThai) VALUES
('NV000', N'Nguyễn Văn Sơn', N'Nam', N'32 Đường Nguyễn Huệ, Quận 2, TP HCM', '0901234567', 'nguyenvanson@gmail.com', 0, 'Còn làm'),
('NV001', N'Nguyễn Văn An', N'Nam', N'123 Đường Lê Lợi, Quận 1, TP HCM', '0901234567', 'nguyenvanan@gmail.com', 1, 'Còn làm'),
('NV002', N'Trần Thị Bích', N'Nữ', N'456 Đường Nguyễn Huệ, Quận 2, TP HCM', '0909876543', 'tranthibich@gmail.com', 1, 'Còn làm'),
('NV003', N'Lê Văn Cường', N'Nam', N'789 Đường Trần Hưng Đạo, Quận 3, TP HCM', '0905678912', 'levancuong@gmail.com', 2, 'Còn làm'),
('NV004', N'Phạm Thị Đào', N'Nữ', N'321 Đường Võ Văn Kiệt, Quận 4, TP HCM', '0902468135', 'phamthidao@gmail.com', 2, 'Còn làm'),
('NV005', N'Hoàng Văn Hải', N'Nam', N'654 Đường Nguyễn Văn Cừ, Quận 5, TP HCM', '0901357924', 'hoangvanhai@gmail.com', 2, 'Còn làm'),
('NV006', N'Nguyễn Thị Hoàng', N'Nữ', N'987 Đường Trường Sơn, Quận 6, TP HCM', '0905792468', 'nguyenthihoang@gmail.com', 2, 'Còn làm'),
('NV007', N'Trần Văn Gia', N'Nam', N'258 Đường Trần Quang Khải, Quận 7, TP HCM', '0902468135', 'tranvanGia@gmail.com', 2, 'Còn làm'),
('NV008', N'Lê Thị Hoa', N'Nữ', N'369 Đường Lý Tự Trọng, Quận 8, TP HCM', '0908912345', 'lethihoa@gmail.com', 2, 'Còn làm'),
('NV009', N'Trần Văn An', N'Nam', N'741 Đường Nguyễn Văn Cừ, Quận 9, TP HCM', '0906789123', 'tranvanan@gmail.com', 2, 'Còn làm'),
('NV010', N'Hoàng Thị Kim', N'Nữ', N'852 Đường Phạm Văn Đồng, Quận 10, TP HCM', '0903456789', 'hoangthikim@gmail.com', 2, 'Nghỉ làm');

INSERT INTO taikhoan (MaTK, MatKhau, TinhTrang) VALUES 
('NV000', 'admin', N'Đã kích hoạt'),
('NV001', '0901234567', N'Đã kích hoạt'),
('NV002', '0909876543', N'Đã kích hoạt'),
('NV003', '0905678912', N'Đã kích hoạt'),
('NV004', '0902468135', N'Đã kích hoạt'),
('NV005', '0901357924', N'Đã kích hoạt'),
('NV006', '0905792468', N'Đã kích hoạt'),
('NV007', '0902468135', N'Đã kích hoạt'),
('NV008', '0908912345', N'Đã kích hoạt'),
('NV009', '0906789123', N'Đã kích hoạt'),
('NV010', '0903456789', N'Chưa kích hoạt')

INSERT INTO sanpham (MaSP, TenSP, HinhAnh, Gia, LoaiSP, TrangThai) VALUES
('SP001', N'Cà phê đen', 'capheden.png', 15000, N'Cà phê', 'Còn hàng'),
('SP002', N'Cà phê sữa', 'caphesua.png', 20000, N'Cà phê', 'Còn hàng'),
('SP003', N'Cappuccino', 'cappuccino.png', 25000, N'Cà phê', 'Còn hàng'),
('SP004', N'Latte', 'latte.png', 25000, N'Cà phê', 'Còn hàng'),
('SP005', N'Trà đào', 'tradao.png', 18000, N'Trà', 'Còn hàng'),
('SP006', N'Trà sữa trân châu', 'trasua.png', 22000, N'Trà', 'Còn hàng'),
('SP007', N'Nước ép táo', 'nuoceptao.png', 30000, N'Nước ép', 'Còn hàng'),
('SP008', N'Nước ép dâu', 'nuocepdau.png', 15000, N'Nước ép', 'Còn hàng'),
('SP009', N'Nước ép cam', 'nuocepcam.png', 20000, N'Nước ép', 'Còn hàng'),
('SP010', N'Nước ép dứa', 'nuocepdua.png', 10000, N'Nước ép', 'Còn hàng'),
('SP011', N'7 Up', '7up.png', 15000, N'Nước giải khát', 'Còn hàng'),
('SP012', N'Nước khoáng Lavie', 'lavie.png', 15000, N'Nước giải khát', 'Còn hàng'),
('SP013', N'Coca Cola', 'coca.png', 15000, N'Nước giải khát', 'Còn hàng'),
('SP014', N'Pepsi', 'pepsi.png', 15000, N'Nước giải khát', 'Hết hàng');

INSERT INTO nguyenlieu (MaNgl, TenNgl, HinhAnh, SoLuong) VALUES
('NL001', 'Cà phê', 'caphe.png', 100),
('NL002', 'Sữa', 'sua.png', 50),
('NL003', 'Trà', 'tra.png', 150),
('NL004', 'Đường', 'duong.png', 50),
('NL005', 'Trân châu', 'tranchau.png', 80),
('NL006', 'Đào', 'dao.png', 60),
('NL007', 'Táo', 'tao.png', 30),
('NL008', 'Dâu', 'dau.png', 30),
('NL009', 'Cam', 'cam.png', 40),
('NL010', 'Dứa', 'dua.png', 70),
('NL011', '7 Up', '7up.png', 70),
('NL012', 'Nước khoáng Lavie', 'lavie.png', 70),
('NL013', 'Coca Cola', 'coca.png', 70),
('NL014', 'Pepsi', 'pepsi.png', 0),
('NL015', 'Ly', 'ly.png', 70),
('NL016', 'Ống hút', 'onghut.png', 70);

INSERT INTO sanpham_nguyenlieu (MaSP, MaNgl, TieuHao) VALUES
('SP001', 'NL001', 0.3),	-- Cà phê đen Nl: cà phê
('SP001', 'NL015', 1),		-- Cà phê đen Nl: Ly
('SP001', 'NL016', 1),		-- Cà phê đen Nl: ống hút

('SP002', 'NL001', 0.6),	-- Cà phê sữa Nl: cà phê
('SP002', 'NL002', 0.6),	-- Cà phê sữa Nl: Sữa
('SP002', 'NL015', 1),		-- Cà phê sữa Nl: Ly
('SP002', 'NL016', 1),		-- Cà phê sữa Nl: ống hút

('SP003', 'NL001', 0.6),	-- Cappuccino Nl: cà phê
('SP003', 'NL002', 0.6),	-- Cappuccino Nl: Sữa
('SP003', 'NL015', 1),		-- Cappuccino Nl: Ly
('SP003', 'NL016', 1),		-- Cappuccino Nl: ống hút

('SP004', 'NL001', 0.6),	-- Latte Nl: cà phê
('SP004', 'NL002', 0.6),	-- Latte Nl: Sữa
('SP004', 'NL015', 1),		-- Latte Nl: Ly
('SP004', 'NL016', 1),		-- Latte Nl: ống hút

('SP005', 'NL003', 0.02),	-- Trà đào Nl: trà
('SP005', 'NL006', 0.1),	-- Trà đào Nl: Đào
('SP005', 'NL015', 1),		-- Trà đào Nl: Ly
('SP005', 'NL016', 1),		-- Trà đào Nl: ống hút

('SP006', 'NL003', 0.01),	-- Trà sữa trân châu Nl: trà
('SP006', 'NL005', 0.03),	-- Trà sữa trân châu Nl: trân châu
('SP006', 'NL002', 0.15),	-- Trà sữa trân châu Nl: sữa
('SP006', 'NL015', 1),		-- Trà sữa trân châu Nl: Ly
('SP006', 'NL016', 1),		-- Trà sữa trân châu Nl: ống hút

('SP007', 'NL004', 0.01),	-- Nước ép táo Nl: đường
('SP007', 'NL007', 0.2),	-- Nước ép táo Nl: táo
('SP007', 'NL015', 1),		-- Nước ép táo Nl: Ly
('SP007', 'NL016', 1),		-- Nước ép táo Nl: ống hút

('SP008', 'NL004', 0.01),	-- Nước ép dâu Nl: đường
('SP008', 'NL008', 0.3),	-- Nước ép dâu Nl: dâu
('SP008', 'NL015', 1),		-- Nước ép dâu Nl: Ly
('SP008', 'NL016', 1),		-- Nước ép dâu Nl: ống hút

('SP009', 'NL004', 0.01),	-- Nước ép cam Nl: đường
('SP009', 'NL009', 0.5),	-- Nước ép cam Nl: cam
('SP009', 'NL015', 1),		-- Nước ép cam Nl: Ly
('SP009', 'NL016', 1),		-- Nước ép cam Nl: ống hút

('SP010', 'NL004', 0.01),	-- Nước ép dứa Nl: đường
('SP010', 'NL010', 0.6),	-- Nước ép dứa Nl: dứa
('SP010', 'NL015', 1),		-- Nước ép dứa Nl: Ly
('SP010', 'NL016', 1),		-- Nước ép dứa Nl: ống hút

('SP011', 'NL011', 1),		-- 7 Up Nl: 7 Up
('SP012', 'NL012', 1),		-- Nước khoáng Lavie Nl: Nước khoáng Lavie
('SP013', 'NL013', 1),		-- Coca Cola Nl: Coca Cola
('SP014', 'NL014', 1);		-- Pepsi Nl: Pepsi

INSERT INTO phieunhap (MaPN, MaNV, MaNCC, NgayNhap, TongTien) VALUES
('PN001', 'NV001', 'NCC001', '2022-01-01', 1240000),
('PN002', 'NV002', 'NCC002', '2022-02-01', 2000000),
('PN003', 'NV003', 'NCC003', '2022-03-01', 325000),
('PN004', 'NV003', 'NCC004', '2022-04-01', 65000),
('PN005', 'NV006', 'NCC005', '2022-05-01', 1550000),
('PN006', 'NV006', 'NCC006', '2022-05-01', 415000);

INSERT INTO chitietphieunhap (MaPN, MaNgl, TenNgl, SoLuong, DonGia) VALUES
('PN001', 'NL004', N'Đường', 20, 35000),			--Trái cây, đường
('PN001', 'NL006', N'Đào', 5, 35000),
('PN001', 'NL007', N'Táo', 5, 12000),
('PN001', 'NL008', N'Dâu', 5, 45000),
('PN001', 'NL009', N'Cam', 5, 6000),
('PN001', 'NL010', N'Dứa', 5, 10000),
('PN002', 'NL011', N'7 Up', 50, 10000),				--Nước giải khát
('PN002', 'NL012', N'Nước khoáng Lavie', 50, 10000),
('PN002', 'NL013', N'Coca Cola', 50, 10000),
('PN002', 'NL014', N'Pepsi', 50, 10000),
('PN003', 'NL001', N'Cà phê', 5, 65000),			--Cà phê
('PN004', 'NL002', N'Sữa', 10, 6500),				--Sữa
('PN005', 'NL003', N'Trà', 10, 60000),				--Nguyên liệu trà
('PN005', 'NL005', N'Trân châu', 10, 95000),  
('PN006', 'NL015', N'Ly', 500, 70),					--Ly, ống hút
('PN006', 'NL016', N'Ống hút', 1000, 380);

INSERT INTO hoadon (MaHD, MaNV, MaKH, NgayTao, TongTien, MaKM) VALUES
('HD001', 'NV001', 'KH001', '2023-10-01', 120000, 'kmkt'),
('HD002', 'NV002', 'KH002', '2023-10-02', 25000, 'kmkt'),
('HD003', 'NV003', 'KH003', '2023-10-03', 110000, 'kkm'),
('HD004', 'NV004', 'KH004', '2024-04-30', 20000, 'km304'),
('HD005', 'NV005', 'KH005', '2024-05-01', 52000, 'km304');

INSERT INTO chitiethoadon (MaHD, MaSP, TenSP, SoLuong, DonGia) VALUES
('HD001', 'SP001', N'Cà phê đen', 2, 15000),
('HD001', 'SP002', N'Cà phê sữa', 3, 20000),
('HD002', 'SP003', N'Cappuccino', 1, 25000),
('HD003', 'SP001', N'Cà phê đen', 4, 15000),
('HD003', 'SP004', N'Latte', 2, 25000),
('HD004', 'SP010', N'Nước ép dứa', 2, 10000),
('HD005', 'SP005', N'Trà đào', 3, 10000),
('HD005', 'SP006', N'Trà sữa trân châu', 1, 22000);