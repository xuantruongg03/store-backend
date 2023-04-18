const pool = require("../../config/connectDatabase");

let addToCart = async (req, res) => {
  let { customer_id, product_id, quantity } = req.body;
  if (!customer_id || !product_id || !quantity) {
    return res.status(400).json({
      message: "error",
    });
  }
  const [rows, fields] = await pool.execute(
    `SELECT * FROM cart WHERE customer_id = ${customer_id} and product_id = ${product_id}`
  );
  if (rows.length > 0) {
    await pool.execute(
      `UPDATE cart SET quantity = quantity + ${quantity} WHERE customer_id = ${customer_id} and product_id = ${product_id}`
    );
    return res.status(200).json({
      message: "ok",
    });
  }
  await pool.execute(
    `INSERT INTO cart (customer_id, product_id, quantity) VALUES (${customer_id}, ${product_id}, ${quantity})`
  );
  return res.status(200).json({
    message: "ok",
  });
};

const buy = async (req, res) => {
  let {
    customer_id,
    total_amount,
    product_id,
    first_name,
    last_name,
    address,
    number_phone,
    notes,
    payment,
  } = req.body;
  const date = new Date()
  try {
    await pool.execute(
      `INSERT INTO orders (customer_id, order_date, total_amount) 
              VALUES (${customer_id}, ${date.toLocaleDateString()}, ${total_amount})`
    );
    const [rows, fields] = await pool.execute(`SELECT * FROM orders`);
    const order_id = rows[rows.length - 1].order_id;
    await pool.execute(
      `INSERT INTO order_items (order_id, product_id, first_name, last_name, address, number_phone, notes, payment)
        VALUES (${order_id}, ${product_id}, '${first_name}', '${last_name}', '${address}', '${number_phone}', '${notes}', '${payment}')`
    );
    await pool.execute(
      `UPDATE products SET product_quantity = product_quantity - ${total_amount} WHERE product_id = ${product_id}`
    );

    return res.status(200).json({
      message: "ok",
    });
  } catch (error) {
    return res.status(400).json({
      message: "error",
    });
  }
};

const deleteProductCart = async (req, res) => {
  let { customer_id, product_id } = req.body;
  try {
    await pool.execute(
      `DELETE FROM cart WHERE product_id = ${product_id} and customer_id = ${customer_id}`
    );
    return res.status(200).json({
      message: "ok",
    });
  } catch (error) {
    return res.status(400).json({
      message: "error",
    });
  }
};

const getCart = async (req, res) => {
  try {
    let { customer_id } = req.user;
    let [cart, fieldsCart] = await pool.execute(
      `SELECT products.product_name, products.product_price, cart.quantity, cart.cart_id, cart.product_id
      FROM cart inner join products on cart.product_id = products.product_id where customer_id = ${customer_id}`
    );

    return res.status(200).json({
      message: "ok",
      data: cart,
    });
  } catch (error) {
    return res.status(500).json({
      message: "error",
    });
  }
};

module.exports = { addToCart, buy, getCart, deleteProductCart };
