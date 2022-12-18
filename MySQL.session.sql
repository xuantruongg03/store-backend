ALTER TABLE khachhang
ADD CONSTRAINT FK_giohang
    FOREIGN KEY (id_giohang)
    REFERENCES giohang (id_giohang);

    --     // `SELECT kh.id_khachhang, kh.ho, kh.ten, kh.gioitinh, kh.email,
    -- // sp.tensanpham, ctdh.soluong, DATE_FORMAT(hd.ngaydathang, "%d %M %Y") as ngaydathang, ctdh.soluong * sp.giaban as thanhtien
    -- // FROM ((khachhang as kh inner join hoadon as hd on kh.id_khachhang = hd.id_khachhang)
    -- // inner join chitietdonhang as ctdh on hd.id_hoadon = ctdh.id_hoadon)
    -- // inner join sanpham as sp on ctdh.id_sanpham = sp.id_sanpham
    -- // `