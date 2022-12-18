
const pool = require("../../config/connectDatabase");

const updateProductPost = async (req, res) => {
    const { type, name, infomation, price, amount } = req.body;
    await pool.execute(
        "UPDATE `sanpham` SET danhmucsanpham = ?, tensanpham = ?, mota = ?, giaban = ?, soluong = ?, hinhanh = ? WHERE id_sanpham = ?",
        [type, name, infomation, price, amount, "image", req.params.id]
    );
    return res.redirect("/");
};

const updateProductGet = async (req, res) => {
    const [rows, fields] = await pool.execute(
      "SELECT * FROM `sanpham` WHERE `id_sanpham` = ?",
      [req.params.id]
    );
    return res.render("updateProduct", { data: rows[0] });
  };

module.exports = { updateProductPost, updateProductGet };