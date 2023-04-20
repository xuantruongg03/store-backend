const pool = require("../../config/connectDatabase");

const getCustomers = async (req, res) => {
  const [rows, fields] = await pool.execute(
    `SELECT * FROM customers`
  );
  return res.render("getCustomer", { data: rows });
};

module.exports = { getCustomers };
