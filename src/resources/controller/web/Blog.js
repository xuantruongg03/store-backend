const pool = require("../../config/connectDatabase");

const getCensoring = async (req, res) => {
    const [rows, fields] = await pool.execute(`select blog_id, blog_title, first_name, last_name, blog_description from blogs inner join customers on customers.customer_id = blogs.customer_id where blog_status = 0`)
    return res.render("blogCensoring", {data: rows});
}

const getCensorred = async (req, res) => {
    const [rows, fields] = await pool.execute(`select blog_id, blog_title, first_name, last_name, blog_description from blogs inner join customers on customers.customer_id = blogs.customer_id where blog_status = 1`)
    return res.render("blogCensorred", {data: rows});
}

const deleteBlog = async (req, res) => {
    const id = req.params.id;
    try {
        await pool.execute (`delete from blogs where blog_id = ${id}`);
        return res.redirect("/cms/get-censorred");
    } catch (error) {
        console.log(error);
    }
}

const sensorBlog = async (req, res) => {
    const id = req.params.id;
    try {
        await pool.execute (`update blogs set blog_status = 1 where blog_id = ${id}`);
        return res.redirect("/cms/get-censoring");
    } catch (error) {
        console.log(error);
    }
}

module.exports = { getCensoring, getCensorred, deleteBlog, sensorBlog }