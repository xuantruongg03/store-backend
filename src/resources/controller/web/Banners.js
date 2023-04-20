const pool = require("../../config/connectDatabase");

const getBanner = async (req, res) => {
  let [rows] = await pool.execute(`SELECT * FROM banners`);
  return res.render("getBanners", { data: rows });
};

const postBanner = async (req, res) => {
  try {
    const { name, type } = req.body;
    const image = req.file.path;
    await pool.execute(
      `INSERT INTO banners (banner_name, banner_image, banner_type) VALUES ('${name}', '${image}', '${type}')`
    );
    return res.redirect("/cms/get-banners");
  } catch (error) {
    console.log(error);
    return res.redirect("/cms/post-banner");
  }
};

const deleteBanner = async (req, res) => {
  const { banner_id } = req.query;
  await pool.execute(`DELETE FROM banners WHERE banner_id = ${banner_id}`);
  return res.redirect("/cms/get-banners");
};

const postBannerPage = (req, res) => {
  return res.render("postBanner");
};

module.exports = { getBanner, postBanner, postBannerPage, deleteBanner };
