const pool = require("../../../config/connectDatabase");

const register = async (req, res) => {
  let { username, password, first_name, last_name, gender, email } = req.body;
  const checkUsername = await pool.execute(
    `SELECT * FROM customers WHERE username = '${username}'`
  );
  if (checkUsername[0].length > 0) {
    return res.status(200).json({
      message: "Username already exists",
      state: false,
    });
  }
  try {
    await pool.execute(
      `INSERT INTO customers (first_name, last_name, gender, email, username, password) VALUES
          ('${first_name}', '${last_name}', '${gender}', '${email}', '${username}', '${password}')`
    );

    return res.status(200).json({
      message: "Success",
      state: true,
    });
  } catch (error) {
    return res.status(500).json({
      message: error,
      state: false,
    });
  }
};

module.exports = { register };
