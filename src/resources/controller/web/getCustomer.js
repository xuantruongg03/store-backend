const pool = require("../../config/connectDatabase");

const getCustomer = async (req, res) => {
  const [rows, fields] = await pool.execute(
    `SELECT * FROM khachhang`
  );
  return res.render("getCustomer", { data: rows });
};

module.exports = { getCustomer };
