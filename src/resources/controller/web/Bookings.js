const pool = require("../../config/connectDatabase");

const getBookings = async (req, res) => {
  const [rows, feilds] = await pool.execute(`SELECT * FROM repair_schedule`);
  return res.render("getBookings", { data: rows });
};

const exportBill = async (req, res) => {
  const { schedule_id } = req.params;
  const [rows, feilds] = await pool.execute(`SELECT * FROM repair_schedule`);
  return res.render("exportBill", { data: rows });
};

const deleteRepair = async (req, res) => {
    const { schedule_id } = req.params;
    await pool.execute(`DELETE FROM repair_schedule WHERE schedule_id = ?`, [schedule_id]);
    return res.redirect("/web/getBookings");
  };

module.exports = { getBookings, exportBill, deleteRepair };
