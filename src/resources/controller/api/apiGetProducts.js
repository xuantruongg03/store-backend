const pool = require("../../config/connectDatabase");

let getProduct = async (res, req) => {
  const [rows, fields] = await pool.execute(`SELECT * FROM sanpham`);
  return req.status(200).json({
    message: "Success",
    data: rows,
  });
};

module.exports = { getProduct };
