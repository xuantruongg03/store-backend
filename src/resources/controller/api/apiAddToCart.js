
const pool = require("../../config/connectDatabase");

let addToCart = async (req, res) => {
    //lấy id_giohang từ tài khoản đăng nhập
    // await pool.execute(
    //     "INSERT INTO `giohang` (id_giohang, id_sanpham, soluong) VALUES (?, ?, ?)",[]
    // );
    console.log(req.body);
    return res.status(200).json({
        message: "ok",
        data: req.body,
    });
};

module.exports = { addToCart };