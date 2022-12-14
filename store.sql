CREATE DATABASE STORE;
USE STORE;

DROP TABLE IF EXISTS sanpham ;
FLUSH TABLES sanpham ;

CREATE TABLE sanpham
(
    id_sanpham varchar(10) not null,
	ten NVARCHAR(255),
    danhmuc NVARCHAR(255),
    mota NVARCHAR(255),
    giaban FLOAT,
    soluong INT,
	donvi nvarchar(45),
    hinhanh VARCHAR(255),
    CONSTRAINT PK_sp
        PRIMARY KEY (id_sanpham)
);

CREATE TABLE khachhang
(
    id_khachhang INT NOT NULL,
    ho NVARCHAR(255),
    ten NVARCHAR(255),
    diachi NVARCHAR(255),
    sodienthoai CHAR(11),
    gioitinh NVARCHAR(5),
    CONSTRAINT PK_khachhang
        PRIMARY KEY (id_khachhang)
);

CREATE TABLE chitietdonhang
(
    id_chitietdonhang INT NOT NULL,
    id_hoadon INT NOT NULL,
    id_sanpham varchar(10) NOT NULL,
    soluong INT,
    giagoc FLOAT,
    giamgia FLOAT,
    thanhtien FLOAT,
	hinhthucthanhtoan NVARCHAR(255),
    ghichu NVARCHAR(255),
);

CREATE TABLE hoadon
(
    id_hoadon INT NOT NULL,
    id_chitietdonhang INT NOT NULL,
    id_khachhang INT NOT NULL,
	ngaydathang DATETIME,
    CONSTRAINT PK_hoadon
        PRIMARY KEY (id_hoadon),
);

ALTER TABLE dbo.chitietdonhang
ADD CONSTRAINT FK_ctdt
    FOREIGN KEY (id_sanpham)
    REFERENCES dbo.sanpham (id_sanpham);

ALTER TABLE dbo.hoadon
ADD CONSTRAINT FK_hoadon
    FOREIGN KEY (id_khachhang)
    REFERENCES dbo.khachhang (id_khachhang);

ALTER TABLE dbo.chitietdonhang
ADD CONSTRAINT FK_ctdh
    FOREIGN KEY (id_hoadon)
    REFERENCES dbo.hoadon (id_hoadon);


INSERT INTO sanpham VALUES ('XT01','Lenovo ieadpad slim 3','Máy tính xách tay','Máy tính xách tay ',20000,100,'Cái','hinhanh1.jpg');
INSERT INTO sanpham VALUES ('XT02','Lenovo ieadpad slim 3','Máy tính xách tay','Máy tính xách tay ',20000,100,'Cái','hinhanh1.jpg');
INSERT INTO sanpham VALUES ('XT03','Lenovo ieadpad slim 3','Máy tính xách tay','Máy tính xách tay ',20000,100,'Cái','hinhanh1.jpg');


INSERT INTO khachhang VALUES (1,'Nguyễn Văn A','Hà Nội','0123456789','Nam');
INSERT INTO khachhang VALUES (2,'Nguyễn Văn B','Hà Nội','0123456789','Nam');
INSERT INTO khachhang VALUES (3,'Nguyễn Văn C','Hà Nội','0123456789','Nam');

INSERT INTO hoadon VALUES (1,1,1,'2019-12-12');
INSERT INTO hoadon VALUES (2,2,2,'2019-12-12');
INSERT INTO hoadon VALUES (3,3,3,'2019-12-12');

INSERT INTO chitietdonhang VALUES (1,1,'XT01',1,20000,0,20000,'Thanh toán khi nhận hàng','Giao hàng tận nơi');
INSERT INTO chitietdonhang VALUES (2,2,'XT02',1,20000,0,20000,'Thanh toán khi nhận hàng','Giao hàng tận nơi');
INSERT INTO chitietdonhang VALUES (3,3,'XT03',1,20000,0,20000,'Thanh toán khi nhận hàng','Giao hàng tận nơi');



Hiển thị thông tin người mua sản phẩm 
=> ((kết nối hóa đơn với khách hàng qua trường id khách hàng) kết nối với chi tiết đặt hàng qua trường id hóa đơn) 
kết nooid với bảng sản phẩm qua trường id sản phẩm => hiển thị ra tên khách hàng, giới tính, địa chỉ, số điện thoại, số hóa đơn,
tên sản phẩm mua, số lượng sản phẩm mua, hình thức thanh toán, thành tiền, ghi chú.

