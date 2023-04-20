const pool = require("../../../config/connectDatabase");

const checkIDCustomer = async (id) => {
    const [rows, fields] = await pool.execute(
        `SELECT * FROM customers WHERE customer_id = '${id}'`
    );
    if (rows.length > 0) {
        return true;
    }
    return false;
}


const register = async (req, res) => {
  let { username, password, first_name, last_name, gender, email } = req.body;
  const checkUsername = await pool.execute(
    `SELECT * FROM customers WHERE username = '${username}'`
  );
  if (checkUsername[0].length > 0 || !checkUsername) {
    return res.status(200).json({
      message: "Username already exists",
      state: false,
    });
  }
  try {
    let id = "";
    let a = new Date();
    do {
        id = `${a.getDate()}${a.getSeconds()}${Math.floor(Math.random() * 1000)}`
      } while (await checkIDCustomer(id));

    await pool.execute(
      `INSERT INTO customers (customer_id, first_name, last_name, gender, email, username, password) VALUES
          ('${id}', '${first_name}', '${last_name}', '${gender}', '${email}', '${username}', '${password}')`
    );

    return res.status(200).json({
      message: "Success",
      state: true,
    });
  } catch (error) {
      console.log(error);
    return res.status(500).json({
      message: "Error",
      state: false,
    });
  }
};

module.exports = { register };
