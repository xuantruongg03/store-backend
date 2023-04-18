// kiểm tra đăng nhập tài khoản người dùng
const { CreateJWT } = require("../../../../middleware/JWTActions");
const pool = require("../../../config/connectDatabase");
const jwt = require("jsonwebtoken");
require("dotenv").config();
const bcrypt = require("bcrypt");

const login = async (req, res) => {
  try {
    let { username, password } = req.body;
    let token = null;
    const [rows, fields] = await pool.execute(
      `SELECT * FROM customers WHERE username = '${username}'`
    );
    bcrypt.compare(password, rows[0].password, (err, result) => {
        if (err) {
          return res.status(500).json({ message: "Internal server error" });
        }
        if (!result) {
          return res.status(401).json({ message: "Invalid password" });
        }
        token = CreateJWT({ customer_id: rows[0].customer_id });
        return res.status(200).json({
          state: true,
          token: token,
          data: {
            customer_id: rows[0].customer_id,
            first_name: rows[0].first_name,
            last_name: rows[0].last_name,
            avatar: rows[0].avatar,
          },
        });
      });
  
  } catch (error) {
    res.status(500).json("Thông tin đăng nhập sai!");
  }
};

const checkUser = async (req, res) => {
  let { username } = req.body;

  if (username === undefined) {
    return res.status(400).json({
      message: "username is undefined",
    });
  }

  const [rows, fields] = await pool.execute(
    `SELECT * FROM customers WHERE username = '${username}'`
  );

  if (rows.length > 0) {
    return res.status(200).json({
      message: "Have a user",
      state: true,
    });
  } else {
    return res.status(200).json({
      message: "Don't have user",
      state: false,
    });
  }
};

const checkToken = async (req, res) => {
  const authorizationHeader = req.headers["authorization"];
  if (!authorizationHeader) {
    return res.status(401).json({
      message: "Not logged in",
      login: false,
    });
  }
  const token = authorizationHeader.split(" ")[1];
  const key = process.env.JWT_SECRET;
  try {
    const decoded = jwt.verify(token, key);
    let customer_id = decoded.customer_id;
    const [rows, fields] = await pool.execute(
      `SELECT * FROM customers WHERE customer_id = '${customer_id}'`
    );
    return res.status(200).json({
      login: true,
      data: {
        customer_id: rows[0].customer_id,
      },
    });
  } catch (err) {
    return res.status(401).json({ message: "Not logged in" });
  }
};

module.exports = { login, checkUser, checkToken };
