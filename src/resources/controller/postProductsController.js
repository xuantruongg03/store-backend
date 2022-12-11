const pool = require("../config/connectDatabase");

const postProductsPage = (req, res) => {
  return res.render("postProduct");
};

const createNewProduct = async (req, res) => {
  const { title, cost, price, description, details } = req.body;
  await pool.execute(
    "INSERT INTO products (title, cost, price, description, detail) VALUES (?, ?, ?, ?, ?)",
    [title, cost, price, description, details]
  );
  return res.redirect("/");
};

module.exports = { postProductsPage, createNewProduct };
