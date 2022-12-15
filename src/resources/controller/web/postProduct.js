const pool = require("../../config/connectDatabase");

const postProductsPage = (req, res) => {
  return res.render("postProduct");
};

const createNewProduct = async (req, res) => {
  //lấy dữ liệu từ form
  const { type, name, infomation, price, quantity, detail, unit } = req.body;

  //lấy đường dẫn tuyệt đối của file cloudinary
  const image = req.file.path;

  //tạo id sản phẩm dạng chữ cái đầu mã sản phẩm + số ngẫu nhiên
  const id = req.body.type.split(" ");
  let id_sanpham = "";
  for (let i = 0; i < id.length; i++) {
    id_sanpham += id[i].substring(0, 1);
  }
  let day = new Date();
  id_sanpham += day.getDate();
  const [row, feilds] = await pool.execute(
    `SELECT count(id_sanpham) FROM sanpham`
  );
  id_sanpham += row[0]["count(id_sanpham)"];

  //thêm sản phẩm vào database
  await pool.execute(
    `INSERT INTO sanpham (
        id_sanpham,
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
       ' ${id_sanpham}',
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
