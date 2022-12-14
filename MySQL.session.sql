ALTER TABLE khachhang
ADD CONSTRAINT FK_giohang
    FOREIGN KEY (id_giohang)
    REFERENCES giohang (id_giohang);