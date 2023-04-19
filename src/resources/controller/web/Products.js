const processing = require("../../../logic/dataProcessing");
const pool = require("../../config/connectDatabase");
const xlsx = require("xlsx");

const getProducts = async (req, res) => {
  const [rows, fields] = await pool.execute(
    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
    inner join product_details on products.product_id = product_details.product_id`
  );
  const result = processing(rows);
  return res.render("getProducts", { data: result });
};

const deleteImageProduct = async (req, res) => {
  // const id = req.params.id;
  const image_id = req.params.id;
  await pool.execute(`DELETE FROM product_images WHERE image_id = ${image_id}`);
  return res.redirect("back");
};

const deleteProduct = async (req, res) => {
  const id = req.params.id;
  await pool.execute("DELETE FROM `product_images` where product_id = ?", [id]);
  await pool.execute("DELETE FROM `product_details` where product_id = ?", [
    id,
  ]);
  await pool.execute("DELETE FROM `products` where product_id = ?", [id]);
  return res.redirect("/cms/get-products");
};

const postProductsPage = (req, res) => {
  return res.render("postProduct");
};

const createNewProductExcel = (req, res) => {
  return res.render("postProductExcel");
};

const createNewProduct = async (req, res) => {
  const {
    type,
    name,
    infomation,
    price,
    quantity,
    sale,
    nameDetails,
    valueDetails,
  } = req.body;
  let details = [];
  nameDetails.map((element) => {
    details.push({
      detail_name: element,
      detail_value: valueDetails[nameDetails.indexOf(element)],
    });
  });

  //   lấy đường dẫn tuyệt đối của file cloudinary
  const urls = [];
  const files = req.files;
  for (const file of files) {
    const { path } = file;
    urls.push(path);
  }

  await pool.execute(
    `INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)
      VALUES ('${name}', '${infomation}', ${price}, ${sale}, '${type}', ${quantity});`
  );

  const [rows, fields] = await pool.execute(
    `SELECT max(product_id) as product_id FROM products`
  );
  const product_id = rows[0].product_id;
  if (urls.length > 0) {
    urls.map((element) => {
      pool.execute(
        `INSERT INTO product_images (product_id, file_path)
                    VALUES (${product_id} ,'${element}')`
      );
    });
  }

  if (details.length > 0) {
    details.map((element) => {
      pool.execute(
        `INSERT INTO product_details (product_id, detail_name, detail_value)
              VALUES (${product_id}, '${element.detail_name}', '${element.detail_value}')`
      );
    });
  }
  return res.redirect("/cms");
};

const postProductExcel = async (req, res) => {
  const file = req.file;
  try {
    const workbook = xlsx.readFile(file.path);
    const worksheet = workbook.Sheets[workbook.SheetNames[0]];
    const data = xlsx.utils.sheet_to_json(worksheet);
    data.forEach(async (element) => {
      const {
        product_name,
        product_description,
        product_price,
        product_sale_price,
        product_type,
        product_quantity,
      } = element;
      const tmp = element.product_details.split("; ");
      const details = [];
      const images = element.product_images.split(", ");
      tmp.forEach((element) => {
        const detail = element.split(": ");
        details.push({
          detail_name: detail[0],
          detail_value: detail[1],
        });
      });
      await pool.execute(
        `INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)
              VALUES ('${product_name}', '${product_description}', ${product_price}, ${product_sale_price}, '${product_type}', ${product_quantity});`
      );
      const [rows, fields] = await pool.execute(
        `SELECT max(product_id) as product_id FROM products`
      );
      const product_id = rows[0].product_id;
      images.map((element) => {
        pool.execute(
          `INSERT INTO product_images (product_id, file_path)
                      VALUES (${product_id} ,'${element}')`
        );
      });
      details.map((element) => {
        pool.execute(
          `INSERT INTO product_details (product_id, detail_name, detail_value)
                    VALUES (${product_id}, '${element.detail_name}', '${element.detail_value}')`
        );
      });
    });
  } catch (error) {
    console.log(error);
  }
  // const products = data.slice(1);
  // console.log(products);
  // for (let i = 0; i < products.length; i++) {
  //     const product = products[i];
  //     const name = product[0];
  //     const infomation = product[1];
  //     const price = product[2];
  //     const sale = product[3];
  //     const type = product[4];
  //     const quantity = product[5];
  //     const image = product[6];
  //     const detail = product[7];
  //     const value = product[8];
  //     await pool.execute(
  //         `INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)
  //           VALUES ('${name}', '${infomation}', ${price}, ${sale}, '${type}', ${quantity});`
  //       );
  //     const [rows, fields] = await pool.execute(
  //         `SELECT max(product_id) as product_id FROM products`
  //       );
  //     const product_id = rows[0].product_id;
  //     await pool.execute(
  //         `INSERT INTO product_images (product_id, file_path)
  //                     VALUES (${product_id} ,'${image}')`
  //       );
  //     await pool.execute(
  //         `INSERT INTO product_details (product_id, detail_name, detail_value)
  //               VALUES (${product_id}, '${detail}', '${value}')`
  //       );
  // }
  return res.redirect("/cms");
};

const updateProductPost = async (req, res) => {
  try {
    const {
      type,
      name,
      infomation,
      price,
      quantity,
      sale,
      key,
      value,
      id_detail,
      valueDetails,
    } = req.body;
    const id = req.params.id;
    const nameDetails = req.body.nameDetails || [];

    await pool.execute(
      `UPDATE products SET product_name = '${name}', product_description = '${infomation}', 
        product_price = ${price}, product_sale_price = ${sale}, product_type = '${type}', 
        product_quantity = ${quantity} WHERE product_id = ${id}`
    );

    if (nameDetails.length > 0) {
      nameDetails.map((element) => {
        let ob = {
          detail_name: element,
          detail_value: valueDetails[nameDetails.indexOf(element)],
        };
        pool.execute(
          `INSERT INTO product_details(product_id, detail_name, detail_value)
                VALUES (${id}, '${ob.detail_name}', '${ob.detail_value}
            ')`
        );
      });
    }

    const detailsOld = [];
    for (let i = 0; i < key.length; i++) {
      let detail_id = id_detail[i];
      let detail_name = key[i];
      let detail_value = value[i];
      detailsOld.push({
        detail_id,
        detail_name,
        detail_value,
      });
    }
    detailsOld.map((element) => {
      pool.execute(
        `UPDATE product_details SET detail_name = '${element.detail_name}', detail_value = '${element.detail_value}' WHERE detail_id = ${element.detail_id}`
      );
    });

    const urls = [];
    const files = req.files;
    for (const file of files) {
      const { path } = file;
      urls.push(path);
    }
    if (urls.length > 0) {
      urls.map((element) => {
        pool.execute(
          `INSERT INTO product_images (product_id, file_path)
                      VALUES (${id} ,'${element}')`
        );
      });
    }
    return res.redirect("/web");
  } catch (error) {
    console.log(error);
  }
};

const updateProductGet = async (req, res) => {
  const [rows, fields] = await pool.execute(
    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id
      inner join product_details on products.product_id = product_details.product_id where products.product_id = ${req.params.id}`
  );
  const result = processing(rows);
  return res.render("updateProduct", { data: result[0] });
};

module.exports = {
  getProducts,
  deleteImageProduct,
  deleteProduct,
  postProductsPage,
  createNewProduct,
  updateProductGet,
  updateProductPost,
  postProductExcel,
  createNewProductExcel,
};
