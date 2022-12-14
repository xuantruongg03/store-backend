
const pool = require("../../config/connectDatabase");

const updateProduct = async (req, res) => {
    const { type, name, infomation, price, amount } = req.body;
    await pool.execute(
        "UPDATE `sanpham` SET danhmucsanpham = ?, tensanpham = ?, mota = ?, giaban = ?, soluong = ?, hinhanh = ? WHERE id_sanpham = ?",
        [type, name, infomation, price, amount, "image", req.params.id]
    );
    return res.redirect("/");
};

module.exports = { updateProduct };