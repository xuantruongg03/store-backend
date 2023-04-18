const jwt = require("jsonwebtoken");
require("dotenv").config();

const CreateJWT = (payload) => {
  const key = process.env.JWT_SECRET;
  const token = jwt.sign(payload, key, {
    expiresIn: "1h",
  });
  return token;
};

const VerifyJWT = (req, res, next) => {
  const authorizationHeader = req.headers["authorization"];
  if (!authorizationHeader) {
    return res.status(401).json({ message: "Unauthorized" });
  }
  const token = authorizationHeader.split(" ")[1];
  const key = process.env.JWT_SECRET;
  let data = null;
  try {
    const decoded = jwt.verify(token, key);
    data = decoded;
  } catch (err) {
    return res.status(401).json({ message: "Unauthorized" });
  }
  req.user = data;
  next();
};

const CheckLogin = (req, res, next) => {
  const authorizationHeader = req.headers["authorization"];
  if (!authorizationHeader) {
    // req.login = false;
    // next();
    return res.status(401).json({
        message: "Login Fail",
        login: false
    });
  }
  try {
      const token = authorizationHeader.split(" ")[1];
      const key = process.env.JWT_SECRET;
      let data = null;
    const decoded = jwt.verify(token, key);
    data = decoded;
  } catch (err) {
    return res.status(401).json({ message: "Not logged in" });
  }
  req.login = data ? true : false;
  req.user = data
  next();
};

module.exports = { CreateJWT, VerifyJWT, CheckLogin };
