// kiểm tra đăng nhập tài khoản người dùng
const { CreateJWT } = require("../../../middleware/JWTActions");
const pool = require("../../config/connectDatabase");
const jwt = require("jsonwebtoken");
require("dotenv").config();
const bcrypt = require("bcrypt");
const { RefreshJWT } = require("../../../middleware/JWTActions");
const { isRefreshTokenExpried } = require("../../../helpers/isRefreshTokenExpried");

const login = async (req, res) => {
  try {
    let { username, password } = req.body;
    let token = null;
    let refreshToken = null;
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
        refreshToken = RefreshJWT({ customer_id: rows[0].customer_id });
         pool.execute(`UPDATE customers SET refresh_token = '${refreshToken}' WHERE customer_id = '${rows[0].customer_id}'`);
        return res.status(200).json({
          state: true,
          token: token,
          refreshToken: refreshToken,
          data: {
            customer_id: rows[0].customer_id,
            // first_name: rows[0].first_name,
            // last_name: rows[0].last_name,
            // avatar: rows[0].avatar,
          },
        });
      });
  
  } catch (error) {
    res.status(500).json("Internal server error");
  }
};

const checkUser = async (req, res) => {
  let { username } = req.body;
  const [rows, fields] = await pool.execute(
    `SELECT count(*) FROM customers WHERE username = '${username}'`
  );

  if (rows[0]["count(*)"] > 0) {
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
  const refreshToken = req.headers["refresh_token"];
  if (!authorizationHeader || !refreshToken) {
    return res.status(401).json({
      message: "Not logged in",
      login: false,
    });
  }
  const token = authorizationHeader.split(" ")[1];
  //refresh
  const key = process.env.JWT_SECRET;
  try {
    const decoded = jwt.verify(token, key);
    let customer_id = decoded.customer_id;
    const [rows, fields] = await pool.execute(
      `SELECT count(*) FROM customers WHERE customer_id = '${customer_id}'`
    );
    if (rows[0]["count(*)"] === 0) {
        return res.status(401).json({
            login: false, 
            message: "Not logged in" 
        });
    }
    return res.status(200).json({
      login: true,
      data: {
        customer_id: customer_id
      },
    });
  } catch (err) {
    if (err.name === "TokenExpiredError") {
        const [rows, feilds] = await pool.query(
            `SELECT customer_id FROM customers WHERE refresh_token = '${refreshToken}'`
          );
          if (rows.length == 0) {
            return res.status(401).json({ message: "Unauthorized" });
          }
          if (isRefreshTokenExpried(refreshToken)) {
            console.log("refresh token expired");
            return res.status(401).json({ message: "Unauthorized" });
          }
          const token = RefreshJWT({ customer_id: rows[0].customer_id });
          newToken = token;
          return res.status(200).json({
            login: true,
            refreshToken: token,
          })
    } else {
        return res.status(500).json({ message: "Internal Server Error" });
    }
  }
};

module.exports = { login, checkUser, checkToken };
