CREATE DATABASE STORE;
USE STORE;

DROP TABLE IF EXISTS sanpham ;
FLUSH TABLES sanpham ;
CREATE TABLE sanpham
(
    id_sanpham INT NOT NULL,
    danhmucsanphamm NVARCHAR(255),
    tensanpham NVARCHAR(255),
    mota NVARCHAR(255),
    giaban FLOAT,
    soluong INT,
    hinhanh VARCHAR(255),
    CONSTRAINT PK_sp
        PRIMARY KEY (id_sanpham)
);

CREATE TABLE khachhang
(
    id_khachhang INT NOT NULL,
    ho NVARCHAR(45),
    ten NVARCHAR(45),
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
    id_sanpham INT NOT NULL,
    soluong INT,
    giagoc FLOAT,
    giamgia FLOAT,
    thanhtien FLOAT
);


CREATE TABLE hoadon
(
    id_hoadon INT NOT NULL,
    id_chitietdonhang INT NOT NULL,
    id_sanpham INT NOT NULL,
    id_khachhang INT NOT NULL,
    ngaydathang DATE,
    hinhthucthanhtoan NVARCHAR(255),
    ghichu NVARCHAR(255),
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

Insert into sanpham values(1,'Máy tính xách tay','Lenovo ideapad 15ITL6','Điện thoại Iphone 6',10000000,10,'iphone6.jpg');

Hiển thị thông tin người mua sản phẩm 
=> ((kết nối hóa đơn với khách hàng qua trường id khách hàng) kết nối với chi tiết đặt hàng qua trường id hóa đơn) 
kết nooid với bảng sản phẩm qua trường id sản phẩm => hiển thị ra tên khách hàng, giới tính, địa chỉ, số điện thoại, số hóa đơn,
tên sản phẩm mua, số lượng sản phẩm mua, hình thức thanh toán, thành tiền, ghi chú.

