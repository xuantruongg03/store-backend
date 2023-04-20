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
  return res.redirect("/cms");
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
  let a = new Date();
  let id = "";
      do {
        id = `${product_type[0].toUpperCase()}${a.getDate()}${a.getSeconds()}${Math.floor(Math.random() * 1000)}`
      } while (await checkIDProduct(id));

  await pool.execute(
    `INSERT INTO products (product_id, product_name, product_description, product_price, product_sale_price, product_type, product_quantity)
      VALUES ('${id}', '${name}', '${infomation}', ${price}, ${sale}, '${type}', ${quantity});`
  );

  const [rows, fields] = await pool.execute(
    `SELECT max(product_id) as product_id FROM products`
  );
  if (urls.length > 0) {
    urls.map((element) => {
      pool.execute(
        `INSERT INTO product_images (product_id, file_path)
                    VALUES ('${id}' ,'${element}')`
      );
    });
  }

  if (details.length > 0) {
    details.map((element) => {
      pool.execute(
        `INSERT INTO product_details (product_id, detail_name, detail_value)
              VALUES ('${id}', '${element.detail_name}', '${element.detail_value}')`
      );
    });
  }
  return res.redirect("/cms");
};

const checkIDProduct = async (id) => {
    const [rows, fields] = await pool.execute(
        `SELECT * FROM products WHERE product_id = '${id}'`
    );
    if (rows.length > 0) {
        return true;
    }
    return false;
}

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
      let a = new Date();
      let id = "";
      do {
        id = `${product_type[0].toUpperCase()}${a.getDate()}${a.getSeconds()}${Math.floor(Math.random() * 1000)}`
      } while (await checkIDProduct(id));

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
        `INSERT INTO products (product_id, product_name, product_description, product_price, product_sale_price, product_type, product_quantity)
              VALUES ('${id}', '${product_name}', '${product_description}', ${product_price}, ${product_sale_price}, '${product_type}', ${product_quantity});`
      );

      images.map((element) => {
        pool.execute(
          `INSERT INTO product_images (product_id, file_path)
                      VALUES ('${id}' ,'${element}')`
        );
      });
      details.map((element) => {
        pool.execute(
          `INSERT INTO product_details (product_id, detail_name, detail_value)
                    VALUES ('${id}', '${element.detail_name}', '${element.detail_value}')`
        );
      });
    });
  } catch (error) {
    console.log(error);
  }
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
      inner join product_details on products.product_id = product_details.product_id where products.product_id = '${req.params.id}'`
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
