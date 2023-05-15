const jwt = require("jsonwebtoken");

const isRefreshTokenExpried = (refreshToken) => {
    const key = process.env.JWT_SECRET;
    try {
      const decoded = jwt.verify(refreshToken, key);
      if (!decoded || !decoded.exp) {
        return true;
      }
      let time = decoded.exp * 1000;
      let now = Date.now();
      return now > time;
    } catch (err) {
      return true;
    }
  };
module.exports = { isRefreshTokenExpried }