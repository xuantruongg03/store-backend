    /**
     * TH người dùng cũ (có token) gửi request lên
     * 1. Kiểm tra token có hợp lệ hay không
     * 2. Nếu hợp lệ thì gán req.login = true, req.user = customer_id, req.stateRefreshToken = false, req.newToken = token
     * 3. Nếu không hợp lệ hoặc hết hạn thì gán req.login = false và req.stateRefreshToken = true, req.user = null
     * => đi đến middleware tiếp theo
     * TH người dùng mới (không có token) gửi request lên
     * 1. Gán req.login = false và req.stateRefreshToken = false
     * => đi đến middleware tiếp theo
     */

const jwt = require("jsonwebtoken");

const VerifyToken = async (req, res, next) => {
    const authorizationHeader = req.headers["authorization"];
    if (!authorizationHeader) {
        req.login = false;
        req.stateRefreshToken = false;
        req.user = null;
        req.newToken = null;
        req.refreshToken = null;
        return next();
    } else {
        try {
            const token = authorizationHeader.split(" ")[1];
            const key = process.env.JWT_SECRET;
            let data = null;
            const decoded = jwt.verify(token, key);
            data = decoded;
            req.login = data ? true : false; //token hợp lệ thì login = true
            req.stateRefreshToken = false;
            req.user = data ? data.customer_id : null; //lấy customer_id từ token nếu hợp lệ 
            req.newToken = token;
            req.refreshToken = null;
            return next();
        } catch (err) {
            if (err.name === "TokenExpiredError") {
                req.login = false;
                req.stateRefreshToken = true;
                req.user = null;
                req.newToken = null;
                req.refreshToken = null;
                return next();
            } else {
                console.log(err);
                return res.status(500).json({ message: "Internal server error" });
            }
        }
    }
  };

module.exports = VerifyToken;