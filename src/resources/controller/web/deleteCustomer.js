
const pool = require("../../config/connectDatabase");

const deleteCustomer = async (req, res) => {
    const { id } = req.params;
    await pool.execute(
        `DELETE FROM khachhang WHERE id_khachhang = ?`, [id]
    );
    return res.redirect("/get-customer");
};

module.exports = { deleteCustomer };