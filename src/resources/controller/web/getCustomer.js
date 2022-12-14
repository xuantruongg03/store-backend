
const pool = require("../../config/connectDatabase");

const getCustomer = async (req, res) => {
    const [rows, fields] =  await pool.execute(
        `SELECT kh.id_khachhang, kh.ho, kh.ten, kh.gioitinh, kh.diachi, kh.sodienthoai,
        sp.tensanpham, ctdh.soluong, DATE_FORMAT(hd.ngaydathang, "%d %M %Y") as ngaydathang, ctdh.soluong * sp.giaban as thanhtien
        FROM ((khachhang as kh inner join hoadon as hd on kh.id_khachhang = hd.id_khachhang)
        inner join chitietdonhang as ctdh on hd.id_hoadon = ctdh.id_hoadon)
        inner join sanpham as sp on ctdh.id_sanpham = sp.id_sanpham
        `
    );
    return res.render("getCustomer", { data: rows });
};

module.exports = { getCustomer };