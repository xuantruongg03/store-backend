const pool = require("../resources/config/connectDatabase");
const jwt = require("jsonwebtoken");
const { isRefreshTokenExpried } = require("../helpers/isRefreshTokenExpried");
require("dotenv").config();

const CreateJWT = (payload) => {
  const key = process.env.JWT_SECRET;
  const token = jwt.sign(payload, key, {
    expiresIn: "1h",
  });
  return token;
};

const VerifyJWT = async (req, res, next) => {
  const authorizationHeader = req.headers["authorization"];
  const refresh = req.headers["refresh_token"];
  if (!refresh || !authorizationHeader) {
    return res.status(401).json({ message: "Unauthorized" });
  }
  const token = authorizationHeader.split(" ")[1];
  const key = process.env.JWT_SECRET;
  let data = null;
  let refreshToken = null;
  try {
    const decoded = jwt.verify(token, key);
    data = decoded;
  } catch (err) {
    if (err.name === "TokenExpiredError") {
      const [rows, feilds] = await pool.query(
        `SELECT customer_id FROM customers WHERE refresh_token = '${refresh}'`
      );
      if (rows.length == 0) {
        return res.status(401).json({ message: "Unauthorized" });
      }
      if (isRefreshTokenExpried(refresh)) {
        return res.status(401).json({ message: "Unauthorized" });
      }
      const token = RefreshJWT({ customer_id: rows[0].customer_id });
      refreshToken = token;
      data = rows[0].customer_id;
    } else {
      return res.status(500).json({ message: "Internal server error" });
    }
  }
  let customer_id = data ? data.customer_id : null; ; 
  req.user = { customer_id, refreshToken };
  next();
};

const RefreshJWT = (payload) => {
  const key = process.env.JWT_SECRET;
  const newToken = jwt.sign(payload, key, {
    expiresIn: "24h",
  });
  return newToken;
};

const CheckLogin = (req, res, next) => {
  const authorizationHeader = req.headers["authorization"];
  if (authorizationHeader) {
    try {
      const token = authorizationHeader.split(" ")[1];
      const key = process.env.JWT_SECRET;
      let data = null;
      const decoded = jwt.verify(token, key);
      data = decoded;
      req.login = data ? true : false;
      req.user = data ? data.customer_id : null;
      next();
    } catch (err) {
    //   return res.status(401).json({ message: "Not logged in" });
        req.login = false;
        req.user = null;
        next();
    }
  }
};

module.exports = { CreateJWT, VerifyJWT, RefreshJWT, CheckLogin };
