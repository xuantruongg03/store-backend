const mysql = require("mysql2/promise");

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "lexuantruong2k3@",
  database: "store",
});

pool.getConnection((err, connection) => {
  console.log("Connected to database");
});

module.exports = pool;
