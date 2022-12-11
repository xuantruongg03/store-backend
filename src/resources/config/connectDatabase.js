const sql = require("mssql/msnodesqlv8");

const config = {
  server: "localhost",
  database: "STORE",
  user: "sa",
  password: "",
  driver: "msnodesqlv8",
};

const pool = new sql.ConnectionPool(config).connect().then((pool) => {
  return pool;
});

module.exports = {
  pool,
  sql,
};
