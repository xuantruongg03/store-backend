const pool = require("../resources/config/connectDatabase");
const ip = require("ip");

const checkIpInWhitelist = async (req, res, next) => {
    const [rows, fields] = await pool.query("SELECT * FROM `whitelist`");
    let found = false;
  rows.forEach((row) => {
    if (row.ip_whitelist === ip.address()) {
      found = true;
      next();
    }
  });
  if (!found) {
    res.send(`
    <div style = "text-align: center">
    <h1>403 Forbidden</h1>
    <p>IP address ${ip.address()} is not in whitelist</p>
    </div>
      `);
  }
};

module.exports = { checkIpInWhitelist };
