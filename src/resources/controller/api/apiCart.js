const processing = require("../../../logic/cartProcessing");
const pool = require("../../config/connectDatabase");

let addToCart = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin) {
    let { product_id, quantity } = req.body;
    const customer_id = req.user;
    const refreshToken = req.refreshToken;
    const token = req.newToken;
    if (!product_id || !quantity) {
      return res.status(400).json({
        message: "error",
      });
    }
    try {
      const [rows, fields] = await pool.execute(
        `SELECT * FROM cart WHERE customer_id = '${customer_id}' and product_id = '${product_id}'`
      );
      if (rows.length > 0) {
        await pool.execute(
          `UPDATE cart SET quantity = quantity + ${quantity} WHERE customer_id = '${customer_id}' and product_id = '${product_id}'`
        );
      } else {
        await pool.execute(
          `INSERT INTO cart (customer_id, product_id, quantity) VALUES ('${customer_id}', '${product_id}', ${quantity})`
        );
      }
      return res.status(200).json({
        message: "ok",
        refreshToken: refreshToken,
        newToken: token,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({
        message: "Internal Server Error",
      });
    }
  } else {
    return res.status(401).json({ message: "Unauthorized" });
  }
};

const buy = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin) {
    let {
      total_amount,
      product_id,
      first_name,
      last_name,
      address,
      number_phone,
      notes,
      payment,
    } = req.body;
    const token = req.newToken;
    const refreshToken = req.refreshToken;
    const customer_id = req.user;
    try {
      const date = new Date();
      await pool.execute(
        `INSERT INTO orders (customer_id, order_date, order_quantity, product_id) 
                      VALUES ('${customer_id}', '${date.toLocaleDateString()}', ${total_amount}, '${product_id}')`
      );
      const [rows, fields] = await pool.execute(`SELECT * FROM orders`);
      const order_id = rows.length !== 0 ? rows[rows.length - 1].order_id : 1;
      await pool.execute(
        `INSERT INTO order_items (order_id, first_name, last_name, address, number_phone, notes, payment)
                VALUES (${order_id}, '${first_name}', '${last_name}', '${address}', '${number_phone}', '${notes}', '${payment}')`
      );
      await pool.execute(
        `UPDATE products SET product_quantity = product_quantity - ${total_amount} WHERE product_id = '${product_id}'`
      );
      return res.status(200).json({
        message: "ok",
        refreshToken: refreshToken,
        newToken: token,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({
        message: "Internal Server Error",
      });
    }
  } else {
    return res.status(401).json({ message: "Unauthorized" });
  }
};

const deleteProductCart = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin) {
    let { product_id } = req.body;
    const customer_id = req.user;
    const refreshToken = req.refreshToken;
    const token = req.newToken;
    try {
      await pool.execute(
        `DELETE FROM cart WHERE product_id = '${product_id}' and customer_id = '${customer_id}'`
      );
      return res.status(200).json({
        message: "ok",
        refreshToken: refreshToken,
        newToken: token,
      });
    } catch (error) {
      return res.status(500).json({
        message: "Internal Server Error",
      });
    }
  }
};

const getCart = async (req, res) => {
    const stateLogin = req.login;
    if (stateLogin) {
        try {
            const customer_id = req.user;
            const refreshToken = req.refreshToken;
            const token = req.newToken;
            let [cart, fieldsCart] = await pool.execute(
              `SELECT products.product_name, product_images.file_path, products.product_price, cart.quantity, cart.cart_id, cart.product_id
              FROM (cart inner join products on cart.product_id = products.product_id) inner join product_images on 
              products.product_id = product_images.product_id where customer_id  = '${customer_id}'`
            );
            return res.status(200).json({
              message: "ok",
              data: processing(cart),
              refreshToken: refreshToken,
              newToken: token,
            });
          } catch (error) {
            return res.status(500).json({ message: "Internal Server Error" });
          }
    } else {
        return res.status(401).json({ message: "Unauthorized" });
    }
};

module.exports = { addToCart, buy, getCart, deleteProductCart };
