const pool = require("../../../config/connectDatabase");

const getBanner = async (req, res) => {
  const [row, feild] = await pool.execute(`SELECT * FROM banners`);
  return res.status(200).json({
    message: "ok",
    data: {
        banner: row,
    },
  });
};

module.exports = { getBanner };
