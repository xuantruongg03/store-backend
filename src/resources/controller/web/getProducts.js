const pool = require("../../config/connectDatabase");
const getProducts = async (req, res) => {
  const [rows, fields] = await pool.execute("SELECT * FROM `sanpham`");
  return res.render("getProducts", { data: rows });
};

const deleteProduct = async (req, res) => {
  const { idDelete } = req.body;
  await pool.execute('DELETE FROM `products` where id = ?', [idDelete]);
  return res.redirect("/");
};

const getProduct = async (req, res) => {
  const [rows, fields] = await pool.execute(
    "SELECT * FROM `sanpham` WHERE `id_sanpham` = ?",
    [req.params.id]
  );
  return res.render("updateProduct", { data: rows[0] });
};

module.exports = { getProducts, deleteProduct, getProduct };
