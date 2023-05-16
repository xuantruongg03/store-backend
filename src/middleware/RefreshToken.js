    /**
     * Nhận req.refreshToken từ middleware trước
     * nếu req.refreshToken = false => next()
     * nếu req.refreshToken = true =>
     * 1. Kiểm tra refresh token có hợp lệ hay không
     * 2. Nếu hợp lệ thì gán req.login = true
     * - Lấy customer_id từ refresh token
     * - Tạo mới token và refresh token (req.token = newToken, req.refreshToken = newRefreshToken)
     * - Cập nhật lại refresh token trong database
     * 3. Nếu không hợp lệ thì gán req.login = false và req.refreshToken = false
     * 4. Nếu token hết hạn thì gán req.login = false và req.refreshToken = true
     * => đi đến endpoint
     * endpoint nhận req.login, req.user, req.token, req.refreshToken trả về cho client
     */

const pool = require("../resources/config/connectDatabase");
const { isRefreshTokenExpried } = require("../helpers/isRefreshTokenExpried");
const { CreateJWT, CreateRefreshJWT } = require("./JWTActions");

const RefreshToken = async (req, res, next) => {
    const state = req.stateRefreshToken;
    if (state) {
        const refreshToken = req.headers["refresh_token"];
        if(isRefreshTokenExpried(refreshToken) || !refreshToken) {
            req.login = false;
            req.refreshToken = null;
            req.newToken = null;
            req.user = null;
            return next();
        }
        try {
            const [rows, feilds] = await pool.query(`select customer_id from customers where refresh_token = '${refreshToken}'`);
            if (rows.length == 0) {
                req.login = false;
                req.refreshToken = null;
                req.newToken = null;
                req.user = null;
                return next();
            } else {
                const customer_id = rows[0].customer_id;
                const token = CreateJWT({ customer_id: customer_id });
                const newRefreshToken = CreateRefreshJWT({ customer_id: customer_id });
                await pool.query(`update customers set refresh_token = '${newRefreshToken}' where customer_id = '${customer_id}'`);
                req.login = true;
                req.user = customer_id;
                req.newToken = token;
                req.refreshToken = newRefreshToken;
                return next();
            }
        } catch (error) {
            console.log(error);
            return res.status(500).json({ message: "Internal server error" });
        }
    } else {
        return next();
    }
}

module.exports = RefreshToken;