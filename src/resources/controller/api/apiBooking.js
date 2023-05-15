const pool = require("../../config/connectDatabase");

const booking = async (req, res) => {
  const {
    address,
    number_phone,
    repair_date,
    problem,
  } = req.body;
  const { customer_id } = req.user;
  try {
    await pool.execute(
      `INSERT INTO repair_schedule (customer_id, address, number_phone, repair_date, problem)
            VALUES ('${customer_id}', '${address}', '${number_phone}', '${repair_date}', '${problem}')`
    );
  } catch (error) {
    return res.status(500).json({
      message: "error",
    });
  }
  return res.status(200).json({
    message: "ok",
  });
};

module.exports = { booking };
