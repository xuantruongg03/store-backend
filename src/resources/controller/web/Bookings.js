const pool = require("../../config/connectDatabase");

const getBookings = async (req, res) => {
  const [rows, feilds] = await pool.execute(
    `SELECT r.schedule_id, c.first_name, c.last_name, c.gender, r.address, r.number_phone, c.email, r.repair_date, r.problem 
        FROM repair_schedule as r inner join customers as c on r.customer_id = c.customer_id`
  );
  return res.render("getBookings", { data: rows });
};

const exportBill = async (req, res) => {
  const { schedule_id } = req.params;
  const [rows, feilds] = await pool.execute(`SELECT * FROM repair_schedule`);
  return res.render("exportBill", { data: rows });
};

const deleteRepair = async (req, res) => {
  const { schedule_id } = req.params;
  await pool.execute(`DELETE FROM repair_schedule WHERE schedule_id = ?`, [
    schedule_id,
  ]);
  return res.redirect("/cms/get-bookings");
};

module.exports = { getBookings, exportBill, deleteRepair };
