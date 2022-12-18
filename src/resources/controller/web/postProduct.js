const pool = require("../../config/connectDatabase");

const postProductsPage = (req, res) => {
  return res.render("postProduct");
};

const createNewProduct = async (req, res) => {
  //lấy dữ liệu từ form
  const { type, name, infomation, price, quantity, detail, unit } = req.body;

  //lấy đường dẫn tuyệt đối của file cloudinary
  const image = req.file.path;

  //thêm sản phẩm vào database
  await pool.execute(
    `INSERT INTO sanpham (
        tensanpham,
        danhmucsanpham,
        mota,
        chitietsanpham,
        soluong,
        giaban,
        donvi,
        hinhanh
      )
    VALUES (
        '${name}',
        '${type}',
        '${infomation}',
        '${detail}',
        '${quantity}',
        '${price}',
        '${unit}',
        '${image}'
      );`,
  );
  return res.redirect("/");
};

module.exports = { postProductsPage, createNewProduct };
