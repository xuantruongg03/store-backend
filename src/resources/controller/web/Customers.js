const pool = require("../../config/connectDatabase");

const getCustomers = async (req, res) => {
  const [rows, fields] = await pool.execute(
    `SELECT * FROM customers`
  );
  return res.render("getCustomer", { data: rows });
};

const deleteCustomer = async (req, res) => {
    const { id } = req.params;
    await pool.execute(
        `DELETE FROM customers WHERE customer_id= ?`, [id]
    );
    return res.redirect("/cms/get-customer");
};

module.exports = { getCustomers, deleteCustomer };
