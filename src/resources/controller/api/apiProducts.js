const pool = require("../../config/connectDatabase");
const processing = require("../../../logic/dataProcessing");
const jwt = require("jsonwebtoken");
require("dotenv").config();

const getAllProducts = async (req, res) => {
  const [rows, fields] = await pool.execute(
    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
        inner join product_details on products.product_id = product_details.product_id`
  );
  let login = req.login || false;
  let customer_id = null;
  const authorizationHeader = req.headers["authorization"];
  if (authorizationHeader) {
    try {
      const key = process.env.JWT_SECRET;
      const token = authorizationHeader.split(" ")[1];
      const decoded = jwt.verify(token, key);
      customer_id = decoded.customer_id;
      decoded ? (login = true) : (login = false);
    } catch (err) {
      customer_id = null;
      login = false;
    }
  }
  const result = processing(rows);
  return res.status(200).json({
    message: "Success",
    data: result,
    login: login,
    customer_id: customer_id,
  });
};

const getProductsType = async (req, res) => {
  const { type } = req.query;
  const [rows, fields] = await pool.execute(
    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
          inner join product_details on products.product_id = product_details.product_id where product_type = ?`,
    [type]
  );
  const result = processing(rows);
  return res.status(200).json({
    message: "Success",
    data: result,
  });
};

const getInforProduct = async (req, res) => {
  let { search } = req.query;
  let result = null;

  if (search === undefined) {
    return res.status(400).json({
      message: "Error: product_id is undefined",
    });
  }
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
    });
  } catch (err) {
    return res.status(400).json({
      message: "Error",
    });
  }
};

module.exports = { getAllProducts, getProductsType, getInforProduct };
