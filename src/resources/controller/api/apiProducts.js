const pool = require("../../config/connectDatabase");
const processing = require("../../../logic/dataProcessing");
require("dotenv").config();

const getAllProducts = async (req, res) => {
  const [rows, fields] = await pool.execute(
    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
        inner join product_details on products.product_id = product_details.product_id`
  );
  let login = req.login;
  let customer_id = req.user;
  let token = req.newToken;
  let refreshToken = req.refreshToken;
  const result = processing(rows);
  return res.status(200).json({
    message: "ok",
    data: result,
    login: login,
    customer_id: customer_id,
    newToken: token,
    refreshToken: refreshToken,
  });
};

const getProductsType = async (req, res) => {
  const { type } = req.query;
  let login = req.login;
  let customer_id = req.user;
  let token = req.newToken;
  let refreshToken = req.refreshToken;
  const [rows, fields] = await pool.execute(
    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
          inner join product_details on products.product_id = product_details.product_id where product_type = ?`,
    [type]
  );
  const result = processing(rows);
  return res.status(200).json({
    message: "Success",
    data: result,
    login: login,
    customer_id: customer_id,
    newToken: token,
    refreshToken: refreshToken,
  });
};

const getProductsSale = async (req, res) => {
  let login = req.login;
  let customer_id = req.user;
  let token = req.newToken;
  let refreshToken = req.refreshToken;
  const [rows, fields] = await pool.execute(
    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
            inner join product_details on products.product_id = product_details.product_id where product_sale_price > 0`
  );
  const result = processing(rows);
  return res.status(200).json({
    message: "Success",
    data: result,
    login: login,
    customer_id: customer_id,
    newToken: token,
    refreshToken: refreshToken,
  });
};

const getInforProduct = async (req, res) => {
  let { search } = req.query;
  let result = null;
  let login = req.login;
  let customer_id = req.user;
  let token = req.newToken;
  let refreshToken = req.refreshToken;
  try {
    const [rows, fields] = await pool.execute(
      `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
                  inner join product_details on products.product_id = product_details.product_id where products.product_id = ?`,
      [search]
    );
    result = processing(rows);
    return res.status(200).json({
      message: "ok",
      data: result,
      login: login,
      customer_id: customer_id,
      newToken: token,
      refreshToken: refreshToken,
    });
  } catch (err) {
    return res.status(500).json({
      message: "Internal Server Error",
    });
  }
};

module.exports = {
  getAllProducts,
  getProductsType,
  getInforProduct,
  getProductsSale,
};
