const pool = require("../../config/connectDatabase");
//Tạo mới khách hàng khi đăng ký tài khoản

const register = async (req, res) => {
  let { tendangnhap, matkhau, ho, ten, email, gioitinh } = req.body;

  const [rows, fields] = await pool.execute("SELECT id_khachhang FROM khachhang");

  //Khi thêm sản phẩm vào giở thì thêm dữ liệu vào bảng giỏ hàng với id tương ứng
  let id_giohang = rows[rows.length - 1].id_khachhang + 1 || 1;

    let sql = `INSERT INTO khachhang (id_giohang, tendangnhap, matkhau, ho, ten, email, gioitinh) VALUES
          (${id_giohang}, '${tendangnhap}', '${matkhau}', '${ho}', '${ten}', '${email}', '${gioitinh}')		  
`;
    await pool.execute(sql);
  
  return res.status(200).json({
    message: "Success",
    id_giohang

  });
};

module.exports = { register };
