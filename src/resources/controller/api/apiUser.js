const pool = require("../../config/connectDatabase");
const nodemailer = require("nodemailer");

const getUser = async (req, res) => {
  try {
    const { customer_id, refreshToken } = req.user;
    // console.log(customer_id, refreshToken);
    // console.log(req.user);
    const [rows, feilds] = await pool.query(
      `SELECT first_name, last_name, gender, email, username, avatar FROM customers WHERE customer_id = '${customer_id}'`
    );
    return res.status(200).json({
      message: "Success",
      data: rows,
        refreshToken,
    });
  } catch (error) {
    return res.status(500).json({
      message: "Internal Server Error",
    });
  }
};

const updateUser = async (req, res) => {
  try {
    let { first_name, last_name, avatar } = req.body;
    const { data, refreshToken } = req.user;
    await pool.execute(
      `UPDATE customers SET first_name = '${first_name}', last_name = '${last_name}', avatar = '${avatar}' WHERE customer_id = '${data.customer_id}'`
    );
    return res.status(200).json({
      message: "ok",
      refreshToken
    });
  } catch (error) {
    return res.status(500).json({
      message: "Internal Server Error"
    });
  }
};

const getCapcha = async (req, res) => {
  const { username, email } = req.body;
  if (!username || !email) {
    return res.status(400).json({
      message: "Not found username or email",
    });
  }
  const [rows, feilds] = await pool.query(
    `SELECT count(*) FROM customers WHERE username = '${username}' AND email = '${email}'`
  );
//   console.log(rows);
  if (rows[0]["count(*)"] == 0) {
    return res.sendStatus(401).json({
      message: "Not found username",
    });
  }
  try {
    const email = rows[0].email;
    let transporter = nodemailer.createTransport({
      service: "gmail",
      port: 465,
      secure: true, // true for 465, false for other ports
      logger: true,
      debug: true,
      secureConnection: false,
      auth: {
        user: "computercentralqn@gmail.com",
        pass: "wcsbpirhrvoqddhe",
        //wcsb pirh rvoq ddhe
      },
      tls: {
        rejectUnAuthorized: true,
      },
    });
    let code = Math.floor(100000 + Math.random() * 900000);
    await pool.execute(
      `UPDATE customers SET code = '${code}' WHERE username = '${username}' AND email = '${email}'`
    );
    let mailOptions = {
      from: "computercentralqn@gmail.com",
      to: `${email}`,
      subject: "Verification Code",
      text: `Your verification code is: <p style = "font-weight: bold; font-size: 20px; letter-spacing: 3px">${code}</p>`,
      html: `Your verification code is: <p style = "font-weight: bold; font-size: 20px; letter-spacing: 3px">${code}</p>`,
    };
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        res.send(500);
      } else {
        setTimeout(() => {
          pool.execute(
            `UPDATE customers SET code = null WHERE username = '${username}' AND email = '${email}'`
          );
        }, 2000 * 60);
        return res.status(200).json({
            message: "ok",
        })
      }
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      message: "Internal Server Error",
    });
  }
};

const changePassword = async (req, res) => {
//   const { data, refreshToken } = req.user;
  const { code, password, email, username } = req.body;
    const newPassword = password;
    if (!code || !password || !email || !username) {
        return res.status(400).json({
            message: "Not found code or password or email or username",
        });
    }
  try {
    const [rows, feilds] = await pool.query(
      `SELECT * FROM customers WHERE username = '${username}' AND email = '${email}'`
    );
    if (rows[0].code === code) {
      await pool.execute(
        `UPDATE customers SET password = '${newPassword}' WHERE username = '${username}' AND email = '${email}'`
      );
      return res.status(200).json({
        message: "ok",
      })
    } else {
      return res.status(400).json({
        message: "Code is not correct",
      });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      message: "Internal Server Error",
    });
  }
};

const changeEmail = async (req, res) => {
  const { data, refreshToken } = req.user;
  const { capcha, newEmail, oldEmail } = req.body;
  if (!customer_id) {
    return res.status(400).json({
      message: "Not found customer_id",
    });
  }
  try {
    const [rows, feilds] = await pool.query(
      `SELECT email FROM customers WHERE customer_id = '${customer_id}'`
    );
    if (rows[0].email === oldEmail) {
      await pool.execute(
        `UPDATE customers SET email = '${newEmail}' WHERE customer_id = ${customer_id}`
      );
      return res.status(200).json({
        message: "ok",
      });
    } else {
      return res.status(400).json({
        message: "Old email is not correct",
      });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      message: "Internal Server Error",
    });
  }
};

const forgotPassword = async (req, res) => {};

module.exports = {
  getUser,
  updateUser,
  getCapcha,
  changePassword,
  changeEmail,
  forgotPassword,
};
