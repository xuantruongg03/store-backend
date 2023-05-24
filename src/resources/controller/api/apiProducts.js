const pool = require("../../config/connectDatabase");
const processing = require("../../../logic/dataProcessing");
const processingLike = require("../../../logic/likeProcessing");
require("dotenv").config();
/**
 * Nếu người dùng đăng nhập => truy vấn theo mã khách hàng nếu sản phẩm nào được like thì lấy like = true
 * Nếu người dùng không đăng nhập => truy vấn tất cả và lấy like = false
 *
 */
const getAllProducts = async (req, res) => {
  let stringQuery = "";
  const stateLogin = req.login;
  if (stateLogin) {
    const customer_id = req.user;
    stringQuery = `
    SELECT p.*,  IF(pl.product_id IS NOT NULL, 1, 0) AS 'like', pi.*, pd.* FROM
    products p LEFT JOIN product_likes pl ON p.product_id = pl.product_id and pl.customer_id = '${customer_id}'
    LEFT JOIN product_images pi ON p.product_id = pi.product_id
    LEFT JOIN product_details pd ON p.product_id = pd.product_id
    
        `;
  } else {
    stringQuery = `SELECT p.*, 0 as 'like', pi.*, pd.* FROM 
                    products as p left join product_images as pi on p.product_id = pi.product_id
                    left join product_details as pd on p.product_id = pd.product_id
    `;
  }

  const [rows, fields] = await pool.execute(stringQuery);
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
    totalProductLike: result[result.length - 1].total_product_like,
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

const addLikeProduct = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin === false) {
    return res.status(401).json({
      message: "Unauthorized",
    });
  } else {
    const { product_id } = req.body;
    const customer_id = req.user;
    const refreshToken = req.refreshToken;
    const newToken = req.newToken;
    try {
      await pool.execute(
        `insert into product_likes (customer_id, product_id) values ('${customer_id}', '${product_id}')`
      );
      return res.status(200).json({
        message: "ok",
        newToken: newToken,
        refreshToken: refreshToken,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({ message: "Internal Server Error" });
    }
  }
};

const getProductLike = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin === false) {
    return res.status(401).json({
      message: "Unauthorized",
    });
  } else {
    const customer_id = req.user;
    const refreshToken = req.refreshToken;
    const newToken = req.newToken;
    try {
      const [rows, fields] = await pool.execute(`select * from (
                (product_likes inner join products on products.product_id = product_likes.product_id)
                 inner join product_images on product_images.product_id = products.product_id)
                 inner join product_details on product_details.product_id = products.product_id where customer_id = '${customer_id}'`);
      return res.status(200).json({
        message: "ok",
        data: processingLike(rows),
        newToken: newToken,
        refreshToken: refreshToken,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({ message: "Internal Server Error" });
    }
  }
};

const unLikeProduct = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin === false) {
    return res.status(401).json({
      message: "Unauthorized",
    });
  } else {
    const { product_id } = req.body;
    const customer_id = req.user;
    const refreshToken = req.refreshToken;
    const newToken = req.newToken;
    try {
      await pool.execute(
        `delete from product_likes where customer_id = '${customer_id}' and product_id = '${product_id}'`
      );
      return res.status(200).json({
        message: "ok",
        newToken: newToken,
        refreshToken: refreshToken,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({ message: "Internal Server Error" });
    }
  }
};

module.exports = {
  getAllProducts,
  getProductsType,
  getInforProduct,
  getProductsSale,
  addLikeProduct,
  getProductLike,
  unLikeProduct,
};
