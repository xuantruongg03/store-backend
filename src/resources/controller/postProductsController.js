const pool = require("../config/connectDatabase");

const postProductsPage = (req, res) => {
  return res.render("postProduct");
};

const createNewProduct = async (req, res) => {
  const { type, name, infomation, price, amount } = req.body;
  await pool.execute(
    "INSERT INTO `sanpham` (danhmucsanpham, tensanpham, mota, giaban, soluong, hinhanh) VALUES (?, ?, ?, ?, ?, ?)",
    [type, name, infomation, price, amount, "image"]
  );
  return res.redirect("/");
};

module.exports = { postProductsPage, createNewProduct };
