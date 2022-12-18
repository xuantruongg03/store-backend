const pool = require("../../config/connectDatabase");
const getProducts = async (req, res) => {
  const [rows, fields] = await pool.execute("SELECT * FROM `sanpham`");
  return res.render("getProducts", { data: rows });
};

module.exports = { getProducts };
