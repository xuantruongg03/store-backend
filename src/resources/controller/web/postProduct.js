const pool = require("../../config/connectDatabase");
var cloudinary = require("cloudinary").v2;

const postProductsPage = (req, res) => {
  return res.render("postProduct");
};

const createNewProduct = async (req, res) => { 
  //lấy dữ liệu từ form
  const { type, name, infomation, price, quatity, detail, unit, image } =
    req.body;
  console.log(req.body);

  cloudinary.uploader
  .upload("https://res.cloudinary.com/dzqkqzjxk/image/upload/v1626330009/anh1.jpg")
  .then(result=>console.log(result));

  //lấy đường dẫn tuyệt đối của file cloudinary
  // const image = req.file.path;

  //tạo id sản phẩm dạng chữ cái đầu mã sản phẩm + số ngẫu nhiên
  // const id = req.body.type.split(" ");
  // let id_sanpham = "";
  // for (let i = 0; i < id.length; i++) {
  //   id_sanpham += id[i].substring(0, 1);
  // }
  // id_sanpham += Math.floor(Math.random() * 1000);

  // // console.log(image.path);

  // await pool.execute(
  //   `INSERT INTO sanpham (id_sanpham, tensanpham, danhmucsanpham, mota, chitietsanpham, soluong, giaban, donvi, hinhanh)
  //   VALUES (?, ?, ?, ?, ?, ?)`,
  //   [id_sanpham, name, type, infomation, detail, quatity, price, unit, image]
  // );
  return res.redirect("/");
};

module.exports = { postProductsPage, createNewProduct };
