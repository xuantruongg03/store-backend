const jwt = require("jsonwebtoken");
require("dotenv").config();

const CreateJWT = (payload) => {
  const key = process.env.JWT_SECRET;
  const token = jwt.sign(payload, key, {
    expiresIn: "1h",
  });
  return token;
};

const CreateRefreshJWT = (payload) => {
    const key = process.env.JWT_SECRET;
    const newToken = jwt.sign(payload, key, {
      expiresIn: "24h",
    });
    return newToken;
  };

module.exports = { CreateJWT, CreateRefreshJWT };
