const pool = require("../../config/connectDatabase");

const booking = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin) {
    const { address, number_phone, repair_date, problem } = req.body;
    const customer_id = req.user;
    const refreshToken = req.refreshToken;
    const token = req.newToken;
    if (!address || !number_phone || !repair_date || !problem) {
      return res.status(400).json({
        message: "error",
      });
    }
    try {
      await pool.execute(
        `INSERT INTO repair_schedule (customer_id, address, number_phone, repair_date, problem)
                    VALUES ('${customer_id}', '${address}', '${number_phone}', '${repair_date}', '${problem}')`
      );
      return res.status(200).json({
        message: "ok",
        refreshToken: refreshToken,
        newToken: token,
      });
    } catch (error) {
      return res.status(500).json({
        message: "error",
      });
    }
  } else {
    return res.status(401).json({ message: "Unauthorized" });
  }
};

module.exports = { booking };
