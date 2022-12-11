const pool = require("../config/connectDatabase");
const homePage = async (req, res) => {
  const [rows, fields] = await pool.execute("SELECT * FROM `sanpham`");
  console.log(rows[0]);
  return res.render("home", { data: rows[0] });
};

// const deleteProduct = async (req, res) => {
//   const { idDelete } = req.body;
//   await pool.execute('DELETE FROM `products` where id = ?', [idDelete]);
//   return res.redirect("/");
// };

// const getProduct = async (req, res) => {
//   const [rows, fields] = await pool.execute(
//     "SELECT * FROM `products` WHERE `id_product` = ?",
//     [req.params.id]
//   );
//   return res.render("updateProduct", { data: rows[0] });
// };

module.exports = { homePage };
