
const pool = require("../config/connectDatabase");

const deleteProduct = async (req, res) => {
    await pool.execute('DELETE FROM `sanpham` where id_sanpham = ?', [req.params.id]);
    return res.redirect("/");
};

module.exports = { deleteProduct };