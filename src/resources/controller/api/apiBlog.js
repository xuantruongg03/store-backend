const pool = require("../../config/connectDatabase");

const checkIDBlog = async (id) => {
  try {
    const [rows, fields] = await pool.execute(
      `select count(*) from blogs where blog_id = '${id}'`
    );
    if (rows[0]["count(*)"] === 0) {
      return false;
    }
    return true;
  } catch (error) {
    console.log(error);
    return false;
  }
};

const postBlog = async (req, res) => {
  const stateLogin = req.login;
  if (stateLogin) {
    const refreshToken = req.refreshToken;
    const token = req.newToken;
    const customer_id = req.user;
    let { blog_title, blog_description, blog_content, blog_image } = req.body;
    let blog_id;
    try {
      let date = new Date();
      do {
        blog_id = `${date.getDate()}${date.getMonth()}${date
          .getFullYear()
          .toString()
          .slice(
            2,
            4
          )}${date.getHours()}${date.getMinutes()}${date.getSeconds()}${Math.floor(
          Math.random() * 10000
        )}`;
      } while (await checkIDBlog(blog_id));
      await pool.execute(
        `insert into blogs (blog_id, blog_title, customer_id, blog_description, blog_content, blog_image) values ('${blog_id}', '${blog_title}', '${customer_id}', '${blog_description}', '${blog_content}', '${blog_image}')`
      );
      return res.status(200).json({
        message: "ok",
        refreshToken: refreshToken,
        newToken: token,
      });
    } catch (error) {
      console.log(error);
      return res.status(500).json({ message: "Internal server error" });
    }
  } else {
    return res.status(401).json({ message: "Unauthorized" });
  }
};

const rateBlog = async (req, res) => {
  const { rate } = req.body;
  const refreshToken = req.refreshToken;
  const token = req.newToken;
  try {
    const [rows, fields] = await pool.execute(
      `select blog_rate from blogs where blog_id = '${blog_id}'`
    );
    let rateNew = (rows[0].blog_rate + rate) / 2;
    rateNew = rateNew.toFixed(1);
    await pool.execute(`update blogs set blog_rate = ${rateNew}`);
    return res.status(200).json({
      message: "ok",
      refreshToken: refreshToken,
      newToken: token,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

const commentBlog = async (req, res) => {
  const { blog_id, name, comment, date } = req.body;
  const refreshToken = req.refreshToken;
  const token = req.newToken;
  try {
    await pool.execute(
      `insert into comments_blog (blog_id, comment_blog_name_user, comment_blog_value, comment_blog_created_at) values ('${blog_id}', '${name}', '${comment}', '${date}')`
    );
    return res.status(200).json({
      message: "ok",
      refreshToken: refreshToken,
      newToken: token,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

const getComments = async (req, res) => {
    const { blog_id } = req.query;
    try {
        const [rows, fields] = await pool.execute(`select comment_blog_name_user as name_user, comment_blog_value as value_user, comment_blog_created_at as created_at from comments_blog where blog_id = '${blog_id}'`);
        return res.status(200).json({ data: rows });
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: "Internal server error" });
    }
}

const getAllBlog = async (req, res) => {
  try {
    const refreshToken = req.refreshToken;
    const token = req.newToken;
    const [rows, fields] = await pool.execute(
      "select blog_id, blog_title, first_name, last_name, blog_description, blog_rate, blog_image, blog_visited, blog_created_at from blogs inner join customers on blogs.customer_id = customers.customer_id where blog_status = 1"
    );
    return res.status(200).json({
      data: rows,
      refreshToken: refreshToken,
      newToken: token,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

const getBlogDetail = async (req, res) => {
  const { blog_id } = req.query;
  const refreshToken = req.refreshToken;
  console.log(refreshToken);
  const token = req.newToken;
  try {
    const [rows, fields] = await pool.execute(
      `select blog_id, blog_title, blog_description, blog_content, last_name, first_name, blog_rate, blog_image, blog_created_at from blogs inner join customers on customers.customer_id = blogs.customer_id where blog_id = '${blog_id}'`
    );
    await pool.execute(
      `update blogs set blog_visited = blog_visited + 1 where blog_id = '${blog_id}'`
    );
    return res.status(200).json({
      data: rows[0],
      refreshToken: refreshToken,
      newToken: token,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Internal server error" });
  }
};

module.exports = { postBlog, getAllBlog, getBlogDetail, rateBlog, commentBlog, getComments };
