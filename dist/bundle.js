/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("var __dirname = \"/\";\nconst express = __webpack_require__(/*! express */ \"express\");\r\nconst path = __webpack_require__(/*! path */ \"path\");\r\nconst morgan = __webpack_require__(/*! morgan */ \"morgan\");\r\n(__webpack_require__(/*! dotenv */ \"dotenv\").config)();\r\nconst handlebars = __webpack_require__(/*! express-handlebars */ \"express-handlebars\");\r\nconst initWebRoute = __webpack_require__(/*! ./resources/route/web */ \"./src/resources/route/web.js\");\r\nconst initAPIWebRoute = __webpack_require__(/*! ./resources/route/api */ \"./src/resources/route/api.js\");\r\nconst cookieParser = __webpack_require__(/*! cookie-parser */ \"cookie-parser\");\r\n\r\nconst app = express();\r\nconst port = process.env.PORT || 8080;\r\n\r\napp.use(express.static(path.join(__dirname, \"../public\")));\r\n\r\n//use morgan for console log\r\napp.use(morgan(\"combined\"));\r\n\r\napp.use(express.urlencoded({ extended: true }));\r\napp.use(express.json());\r\n\r\napp.use(cookieParser());\r\n//Template Engine\r\napp.engine(\r\n  \"hbs\",\r\n  handlebars.engine({\r\n    extname: \".hbs\",\r\n    helpers: {\r\n      // Function to do basic mathematical operation in handlebar\r\n      math: function (lvalue, operator, rvalue) {\r\n        lvalue = parseFloat(lvalue);\r\n        rvalue = parseFloat(rvalue);\r\n        return {\r\n          \"+\": lvalue + rvalue,\r\n          \"-\": lvalue - rvalue,\r\n          \"*\": lvalue * rvalue,\r\n          \"/\": lvalue / rvalue,\r\n          \"%\": lvalue % rvalue,\r\n        }[operator];\r\n      },\r\n    },\r\n  })\r\n);\r\napp.set(\"view engine\", \"hbs\");\r\napp.set(\"views\", path.join(__dirname, \"./resources/views\"));\r\n\r\ninitWebRoute(app);\r\ninitAPIWebRoute(app);\r\n\r\napp.listen(port, () => {\r\n  console.log(\"Server is running on port \" + port);\r\n});\r\n\n\n//# sourceURL=webpack://store-backend/./src/index.js?");

/***/ }),

/***/ "./src/logic/dataProcessing.js":
/*!*************************************!*\
  !*** ./src/logic/dataProcessing.js ***!
  \*************************************/
/***/ ((module) => {

eval("const processing = (rows) => {\r\n  const id = [];\r\n  rows.map((element) => {\r\n    id.push(element.product_id);\r\n  });\r\n  const uniqueId = [...new Set(id)];\r\n  const result = [];\r\n  uniqueId.map((element) => {\r\n    const product = rows.filter((item) => item.product_id === element);\r\n    const ob = {\r\n      product_id: product[0].product_id,\r\n      product_name: product[0].product_name,\r\n      product_description: product[0].product_description,\r\n      product_price: product[0].product_price,\r\n      product_sale_price: product[0].product_sale_price,\r\n      product_type: product[0].product_type,\r\n      product_quantity: product[0].product_quantity,\r\n    };\r\n    const product_details = [];\r\n    const product_images = [];\r\n\r\n    product.map((item) => {\r\n      if (\r\n        product_images.every(\r\n          (itemImage) => itemImage.image_id !== item.image_id\r\n        )\r\n      ) {\r\n        product_images.push({\r\n          image_id: item.image_id,\r\n          file_path: item.file_path,\r\n        });\r\n      }\r\n      if (\r\n        product_details.every(\r\n          (itemImage) => itemImage.detail_id !== item.detail_id\r\n        )\r\n      ) {\r\n        product_details.push({\r\n          detail_id: item.detail_id,\r\n          detail_name: item.detail_name,\r\n          detail_value: item.detail_value,\r\n        });\r\n      }\r\n    });\r\n    ob.product_images = product_images;\r\n    ob.product_details = product_details;\r\n    result.push(ob);\r\n  });\r\n  return result;\r\n};\r\n\r\nmodule.exports = processing;\r\n\n\n//# sourceURL=webpack://store-backend/./src/logic/dataProcessing.js?");

/***/ }),

/***/ "./src/middleware/AuthorWeb.js":
/*!*************************************!*\
  !*** ./src/middleware/AuthorWeb.js ***!
  \*************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../resources/config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\nconst ip = __webpack_require__(/*! ip */ \"ip\");\r\n\r\nconst checkIpInWhitelist = async (req, res, next) => {\r\n    const [rows, fields] = await pool.query(\"SELECT * FROM `whitelist`\");\r\n    let found = false;\r\n  rows.forEach((row) => {\r\n    if (row.ip_whitelist === ip.address()) {\r\n      found = true;\r\n      next();\r\n    }\r\n  });\r\n  if (!found) {\r\n    res.send(`\r\n    <div style = \"text-align: center\">\r\n    <h1>403 Forbidden</h1>\r\n    <p>IP address ${ip.address()} is not in whitelist</p>\r\n    </div>\r\n      `);\r\n  }\r\n};\r\n\r\nmodule.exports = { checkIpInWhitelist };\r\n\n\n//# sourceURL=webpack://store-backend/./src/middleware/AuthorWeb.js?");

/***/ }),

/***/ "./src/middleware/HeadersAPI.js":
/*!**************************************!*\
  !*** ./src/middleware/HeadersAPI.js ***!
  \**************************************/
/***/ ((module) => {

eval("const Headers = (req, res, next) => {\r\n  res.setHeader(\"Access-Control-Allow-Origin\", \"*\");\r\n  res.setHeader(\"Access-Control-Allow-Credentials\", \"true\");\r\n  res.setHeader(\"Access-Control-Allow-Methods\", \"GET,HEAD,OPTIONS,POST,PUT\");\r\n  res.setHeader(\r\n    \"Access-Control-Allow-Headers\",\r\n    \"Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers \"\r\n  );\r\n  res.header(\"Access-Control-Allow-Headers\", \"Origin, X-Requested-With, Content-Type, Accept, Authorization\");\r\n  next();\r\n};\r\n\r\nmodule.exports = Headers;\r\n\n\n//# sourceURL=webpack://store-backend/./src/middleware/HeadersAPI.js?");

/***/ }),

/***/ "./src/middleware/JWTActions.js":
/*!**************************************!*\
  !*** ./src/middleware/JWTActions.js ***!
  \**************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const jwt = __webpack_require__(/*! jsonwebtoken */ \"jsonwebtoken\");\r\n(__webpack_require__(/*! dotenv */ \"dotenv\").config)();\r\n\r\nconst CreateJWT = (payload) => {\r\n  const key = process.env.JWT_SECRET;\r\n  const token = jwt.sign(payload, key, {\r\n    expiresIn: \"1h\",\r\n  });\r\n  return token;\r\n};\r\n\r\nconst VerifyJWT = (req, res, next) => {\r\n  const authorizationHeader = req.headers[\"authorization\"];\r\n  if (!authorizationHeader) {\r\n    return res.status(401).json({ message: \"Unauthorized\" });\r\n  }\r\n  const token = authorizationHeader.split(\" \")[1];\r\n  const key = process.env.JWT_SECRET;\r\n  let data = null;\r\n  try {\r\n    const decoded = jwt.verify(token, key);\r\n    data = decoded;\r\n  } catch (err) {\r\n    return res.status(401).json({ message: \"Unauthorized\" });\r\n  }\r\n  req.user = data;\r\n  next();\r\n};\r\n\r\nconst CheckLogin = (req, res, next) => {\r\n  const authorizationHeader = req.headers[\"authorization\"];\r\n  if (!authorizationHeader) {\r\n    // req.login = false;\r\n    // next();\r\n    return res.status(401).json({\r\n        message: \"Login Fail\",\r\n        login: false\r\n    });\r\n  }\r\n  try {\r\n      const token = authorizationHeader.split(\" \")[1];\r\n      const key = process.env.JWT_SECRET;\r\n      let data = null;\r\n    const decoded = jwt.verify(token, key);\r\n    data = decoded;\r\n  } catch (err) {\r\n    return res.status(401).json({ message: \"Not logged in\" });\r\n  }\r\n  req.login = data ? true : false;\r\n  req.user = data\r\n  next();\r\n};\r\n\r\nmodule.exports = { CreateJWT, VerifyJWT, CheckLogin };\r\n\n\n//# sourceURL=webpack://store-backend/./src/middleware/JWTActions.js?");

/***/ }),

/***/ "./src/resources/config/cloudinary.config.js":
/*!***************************************************!*\
  !*** ./src/resources/config/cloudinary.config.js ***!
  \***************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("\r\n// config cloudinary\r\nconst cloudinary = (__webpack_require__(/*! cloudinary */ \"cloudinary\").v2);\r\nconst { CloudinaryStorage } = __webpack_require__(/*! multer-storage-cloudinary */ \"multer-storage-cloudinary\");\r\nconst multer = __webpack_require__(/*! multer */ \"multer\");\r\n(__webpack_require__(/*! dotenv */ \"dotenv\").config)();\r\n\r\ncloudinary.config({\r\n  cloud_name: process.env.CLOUDINARY_NAME,\r\n  api_key: process.env.CLOUDINARY_KEY,\r\n  api_secret: process.env.CLOUDINARY_SECRET,\r\n});\r\n\r\nconst storage = new CloudinaryStorage({\r\n  cloudinary,\r\n  allowedFormats: [\"jpg\", \"png\"],\r\n  params: {\r\n    folder: \"image_products\",\r\n  },\r\n});\r\n\r\nconst uploadCloud = multer({ storage });\r\n\r\nmodule.exports = uploadCloud;\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/config/cloudinary.config.js?");

/***/ }),

/***/ "./src/resources/config/connectDatabase.js":
/*!*************************************************!*\
  !*** ./src/resources/config/connectDatabase.js ***!
  \*************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const mysql = __webpack_require__(/*! mysql2/promise */ \"mysql2/promise\");\r\n(__webpack_require__(/*! dotenv */ \"dotenv\").config)();\r\n\r\nconst pool = mysql.createPool({\r\n  host: process.env.HOST_DB,\r\n  user: process.env.USER_DB,\r\n  password: process.env.PASSWORD_DB,\r\n  database: process.env.DATABASE_DB,\r\n});\r\n\r\npool.getConnection((err, connection) => {\r\n  console.log(\"Connected to database\");\r\n});\r\n\r\nmodule.exports = pool;\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/config/connectDatabase.js?");

/***/ }),

/***/ "./src/resources/controller/api/another/apiGetBanner.js":
/*!**************************************************************!*\
  !*** ./src/resources/controller/api/another/apiGetBanner.js ***!
  \**************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\n\r\nconst getBanner = async (req, res) => {\r\n  const [row, feild] = await pool.execute(`SELECT * FROM banners`);\r\n  return res.status(200).json({\r\n    message: \"ok\",\r\n    data: {\r\n        banner: row,\r\n    },\r\n  });\r\n};\r\n\r\nmodule.exports = { getBanner };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/api/another/apiGetBanner.js?");

/***/ }),

/***/ "./src/resources/controller/api/another/apiLogin.js":
/*!**********************************************************!*\
  !*** ./src/resources/controller/api/another/apiLogin.js ***!
  \**********************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("// kiểm tra đăng nhập tài khoản người dùng\r\nconst { CreateJWT } = __webpack_require__(/*! ../../../../middleware/JWTActions */ \"./src/middleware/JWTActions.js\");\r\nconst pool = __webpack_require__(/*! ../../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\nconst jwt = __webpack_require__(/*! jsonwebtoken */ \"jsonwebtoken\");\r\n(__webpack_require__(/*! dotenv */ \"dotenv\").config)();\r\nconst bcrypt = __webpack_require__(/*! bcrypt */ \"bcrypt\");\r\n\r\nconst login = async (req, res) => {\r\n  try {\r\n    let { username, password } = req.body;\r\n    let token = null;\r\n    const [rows, fields] = await pool.execute(\r\n      `SELECT * FROM customers WHERE username = '${username}'`\r\n    );\r\n    bcrypt.compare(password, rows[0].password, (err, result) => {\r\n        if (err) {\r\n          return res.status(500).json({ message: \"Internal server error\" });\r\n        }\r\n        if (!result) {\r\n          return res.status(401).json({ message: \"Invalid password\" });\r\n        }\r\n        token = CreateJWT({ customer_id: rows[0].customer_id });\r\n        return res.status(200).json({\r\n          state: true,\r\n          token: token,\r\n          data: {\r\n            customer_id: rows[0].customer_id,\r\n            first_name: rows[0].first_name,\r\n            last_name: rows[0].last_name,\r\n            avatar: rows[0].avatar,\r\n          },\r\n        });\r\n      });\r\n  \r\n  } catch (error) {\r\n    res.status(500).json(\"Thông tin đăng nhập sai!\");\r\n  }\r\n};\r\n\r\nconst checkUser = async (req, res) => {\r\n  let { username } = req.body;\r\n\r\n  if (username === undefined) {\r\n    return res.status(400).json({\r\n      message: \"username is undefined\",\r\n    });\r\n  }\r\n\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT * FROM customers WHERE username = '${username}'`\r\n  );\r\n\r\n  if (rows.length > 0) {\r\n    return res.status(200).json({\r\n      message: \"Have a user\",\r\n      state: true,\r\n    });\r\n  } else {\r\n    return res.status(200).json({\r\n      message: \"Don't have user\",\r\n      state: false,\r\n    });\r\n  }\r\n};\r\n\r\nconst checkToken = async (req, res) => {\r\n  const authorizationHeader = req.headers[\"authorization\"];\r\n  if (!authorizationHeader) {\r\n    return res.status(401).json({\r\n      message: \"Not logged in\",\r\n      login: false,\r\n    });\r\n  }\r\n  const token = authorizationHeader.split(\" \")[1];\r\n  const key = process.env.JWT_SECRET;\r\n  try {\r\n    const decoded = jwt.verify(token, key);\r\n    let customer_id = decoded.customer_id;\r\n    const [rows, fields] = await pool.execute(\r\n      `SELECT * FROM customers WHERE customer_id = '${customer_id}'`\r\n    );\r\n    return res.status(200).json({\r\n      login: true,\r\n      data: {\r\n        customer_id: rows[0].customer_id,\r\n      },\r\n    });\r\n  } catch (err) {\r\n    return res.status(401).json({ message: \"Not logged in\" });\r\n  }\r\n};\r\n\r\nmodule.exports = { login, checkUser, checkToken };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/api/another/apiLogin.js?");

/***/ }),

/***/ "./src/resources/controller/api/another/apiRegister.js":
/*!*************************************************************!*\
  !*** ./src/resources/controller/api/another/apiRegister.js ***!
  \*************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\n\r\nconst register = async (req, res) => {\r\n  let { username, password, first_name, last_name, gender, email } = req.body;\r\n  const checkUsername = await pool.execute(\r\n    `SELECT * FROM customers WHERE username = '${username}'`\r\n  );\r\n  if (checkUsername[0].length > 0) {\r\n    return res.status(200).json({\r\n      message: \"Username already exists\",\r\n      state: false,\r\n    });\r\n  }\r\n  try {\r\n    await pool.execute(\r\n      `INSERT INTO customers (first_name, last_name, gender, email, username, password) VALUES\r\n          ('${first_name}', '${last_name}', '${gender}', '${email}', '${username}', '${password}')`\r\n    );\r\n\r\n    return res.status(200).json({\r\n      message: \"Success\",\r\n      state: true,\r\n    });\r\n  } catch (error) {\r\n    return res.status(500).json({\r\n      message: error,\r\n      state: false,\r\n    });\r\n  }\r\n};\r\n\r\nmodule.exports = { register };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/api/another/apiRegister.js?");

/***/ }),

/***/ "./src/resources/controller/api/apiBooking.js":
/*!****************************************************!*\
  !*** ./src/resources/controller/api/apiBooking.js ***!
  \****************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\n\r\nconst booking = async (req, res) => {\r\n  const {\r\n    first_name,\r\n    last_name,\r\n    gender,\r\n    address,\r\n    number_phone,\r\n    repair_date,\r\n    problem,\r\n    email,\r\n  } = req.body;\r\n  const { customer_id } = req.user;\r\n  try {\r\n    await pool.execute(\r\n      `INSERT INTO repair_schedule (customer_id, first_name, last_name, gender, address, number_phone, email, repair_date, problem)\r\n            VALUES (${customer_id}, '${first_name}', '${last_name}', '${address}', '${gender}', '${number_phone}', '${email}', '${repair_date}', '${problem}')`\r\n    );\r\n  } catch (error) {\r\n    return res.status(500).json({\r\n      message: \"error\",\r\n    });\r\n  }\r\n  return res.status(200).json({\r\n    message: \"ok\",\r\n  });\r\n};\r\n\r\nmodule.exports = { booking };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/api/apiBooking.js?");

/***/ }),

/***/ "./src/resources/controller/api/apiCart.js":
/*!*************************************************!*\
  !*** ./src/resources/controller/api/apiCart.js ***!
  \*************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\n\r\nlet addToCart = async (req, res) => {\r\n  let { customer_id, product_id, quantity } = req.body;\r\n  if (!customer_id || !product_id || !quantity) {\r\n    return res.status(400).json({\r\n      message: \"error\",\r\n    });\r\n  }\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT * FROM cart WHERE customer_id = ${customer_id} and product_id = ${product_id}`\r\n  );\r\n  if (rows.length > 0) {\r\n    await pool.execute(\r\n      `UPDATE cart SET quantity = quantity + ${quantity} WHERE customer_id = ${customer_id} and product_id = ${product_id}`\r\n    );\r\n    return res.status(200).json({\r\n      message: \"ok\",\r\n    });\r\n  }\r\n  await pool.execute(\r\n    `INSERT INTO cart (customer_id, product_id, quantity) VALUES (${customer_id}, ${product_id}, ${quantity})`\r\n  );\r\n  return res.status(200).json({\r\n    message: \"ok\",\r\n  });\r\n};\r\n\r\nconst buy = async (req, res) => {\r\n  let {\r\n    customer_id,\r\n    total_amount,\r\n    product_id,\r\n    first_name,\r\n    last_name,\r\n    address,\r\n    number_phone,\r\n    notes,\r\n    payment,\r\n  } = req.body;\r\n  const date = new Date()\r\n  try {\r\n    await pool.execute(\r\n      `INSERT INTO orders (customer_id, order_date, total_amount) \r\n              VALUES (${customer_id}, ${date.toLocaleDateString()}, ${total_amount})`\r\n    );\r\n    const [rows, fields] = await pool.execute(`SELECT * FROM orders`);\r\n    const order_id = rows[rows.length - 1].order_id;\r\n    await pool.execute(\r\n      `INSERT INTO order_items (order_id, product_id, first_name, last_name, address, number_phone, notes, payment)\r\n        VALUES (${order_id}, ${product_id}, '${first_name}', '${last_name}', '${address}', '${number_phone}', '${notes}', '${payment}')`\r\n    );\r\n    await pool.execute(\r\n      `UPDATE products SET product_quantity = product_quantity - ${total_amount} WHERE product_id = ${product_id}`\r\n    );\r\n\r\n    return res.status(200).json({\r\n      message: \"ok\",\r\n    });\r\n  } catch (error) {\r\n    return res.status(400).json({\r\n      message: \"error\",\r\n    });\r\n  }\r\n};\r\n\r\nconst deleteProductCart = async (req, res) => {\r\n  let { customer_id, product_id } = req.body;\r\n  try {\r\n    await pool.execute(\r\n      `DELETE FROM cart WHERE product_id = ${product_id} and customer_id = ${customer_id}`\r\n    );\r\n    return res.status(200).json({\r\n      message: \"ok\",\r\n    });\r\n  } catch (error) {\r\n    return res.status(400).json({\r\n      message: \"error\",\r\n    });\r\n  }\r\n};\r\n\r\nconst getCart = async (req, res) => {\r\n  try {\r\n    let { customer_id } = req.user;\r\n    let [cart, fieldsCart] = await pool.execute(\r\n      `SELECT products.product_name, products.product_price, cart.quantity, cart.cart_id, cart.product_id\r\n      FROM cart inner join products on cart.product_id = products.product_id where customer_id = ${customer_id}`\r\n    );\r\n\r\n    return res.status(200).json({\r\n      message: \"ok\",\r\n      data: cart,\r\n    });\r\n  } catch (error) {\r\n    return res.status(500).json({\r\n      message: \"error\",\r\n    });\r\n  }\r\n};\r\n\r\nmodule.exports = { addToCart, buy, getCart, deleteProductCart };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/api/apiCart.js?");

/***/ }),

/***/ "./src/resources/controller/api/apiProducts.js":
/*!*****************************************************!*\
  !*** ./src/resources/controller/api/apiProducts.js ***!
  \*****************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\nconst processing = __webpack_require__(/*! ../../../logic/dataProcessing */ \"./src/logic/dataProcessing.js\");\r\nconst jwt = __webpack_require__(/*! jsonwebtoken */ \"jsonwebtoken\");\r\n(__webpack_require__(/*! dotenv */ \"dotenv\").config)();\r\n\r\nconst getAllProducts = async (req, res) => {\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\r\n        inner join product_details on products.product_id = product_details.product_id`\r\n  );\r\n  let login = req.login || false;\r\n  let customer_id = null;\r\n  const authorizationHeader = req.headers[\"authorization\"];\r\n  if (authorizationHeader) {\r\n    try {\r\n      const key = process.env.JWT_SECRET;\r\n      const token = authorizationHeader.split(\" \")[1];\r\n      const decoded = jwt.verify(token, key);\r\n      customer_id = decoded.customer_id;\r\n      decoded ? (login = true) : (login = false);\r\n    } catch (err) {\r\n      customer_id = null;\r\n      login = false;\r\n    }\r\n  }\r\n  const result = processing(rows);\r\n  return res.status(200).json({\r\n    message: \"Success\",\r\n    data: result,\r\n    login: login,\r\n    customer_id: customer_id,\r\n  });\r\n};\r\n\r\nconst getProductsType = async (req, res) => {\r\n  const { type } = req.query;\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\r\n          inner join product_details on products.product_id = product_details.product_id where product_type = ?`,\r\n    [type]\r\n  );\r\n  const result = processing(rows);\r\n  return res.status(200).json({\r\n    message: \"Success\",\r\n    data: result,\r\n  });\r\n};\r\n\r\nconst getInforProduct = async (req, res) => {\r\n  let { search } = req.query;\r\n  let result = null;\r\n\r\n  if (search === undefined) {\r\n    return res.status(400).json({\r\n      message: \"Error: product_id is undefined\",\r\n    });\r\n  }\r\n  try {\r\n    const [rows, fields] = await pool.execute(\r\n      `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\r\n                  inner join product_details on products.product_id = product_details.product_id where products.product_id = ?`,\r\n      [search]\r\n    );\r\n    result = processing(rows);\r\n    return res.status(200).json({\r\n      message: \"ok\",\r\n      data: result,\r\n    });\r\n  } catch (err) {\r\n    return res.status(400).json({\r\n      message: \"Error\",\r\n    });\r\n  }\r\n};\r\n\r\nmodule.exports = { getAllProducts, getProductsType, getInforProduct };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/api/apiProducts.js?");

/***/ }),

/***/ "./src/resources/controller/api/apiUser.js":
/*!*************************************************!*\
  !*** ./src/resources/controller/api/apiUser.js ***!
  \*************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\nconst nodemailer = __webpack_require__(/*! nodemailer */ \"nodemailer\");\r\n\r\nconst getUser = async (req, res) => {\r\n  try {\r\n    const { customer_id } = req.user;\r\n    // console.log(req.user);\r\n    const [rows, feilds] = await pool.query(\r\n      `SELECT * FROM customers WHERE customer_id = ${customer_id}`\r\n    );\r\n    return res.status(200).json({\r\n      message: \"Success\",\r\n      data: rows,\r\n    });\r\n  } catch (error) {\r\n    return res.status(500).json({\r\n      message: \"Internal Server Error\",\r\n    });\r\n  }\r\n};\r\n\r\nconst updateUser = async (req, res) => {\r\n  try {\r\n    let { first_name, last_name, avatar } = req.body;\r\n    const { customer_id } = req.user;\r\n    await pool.execute(\r\n      `UPDATE customers SET first_name = '${first_name}', last_name = '${last_name}', avatar = '${avatar}' WHERE customer_id = ${customer_id}`\r\n    );\r\n    return res.status(200).json({\r\n      message: \"ok\",\r\n    });\r\n  } catch (error) {\r\n    return res.status(500).json({\r\n      message: \"Internal Server Error\",\r\n    });\r\n  }\r\n};\r\n\r\nconst getCapcha = async (req, res) => {\r\n  const { username, email } = req.body;\r\n  console.log(username, email);\r\n  if (!username || !email) {\r\n    return res.status(400).json({\r\n      message: \"Not found username or email\",\r\n    });\r\n  }\r\n  const [rows, feilds] = await pool.query(\r\n    `SELECT * FROM customers WHERE username = '${username}' AND email = '${email}'`\r\n  );\r\n  console.log(rows);\r\n  if (rows.length <= 0) {\r\n    return res.sendStatus(401).json({\r\n      message: \"Not found username\",\r\n    });\r\n  }\r\n  try {\r\n    const email = rows[0].email;\r\n    let transporter = nodemailer.createTransport({\r\n      service: \"gmail\",\r\n      port: 465,\r\n      secure: true, // true for 465, false for other ports\r\n      logger: true,\r\n      debug: true,\r\n      secureConnection: false,\r\n      auth: {\r\n        user: \"computercentralqn@gmail.com\",\r\n        pass: \"wcsbpirhrvoqddhe\",\r\n        //wcsb pirh rvoq ddhe\r\n      },\r\n      tls: {\r\n        rejectUnAuthorized: true,\r\n      },\r\n    });\r\n    let code = Math.floor(100000 + Math.random() * 900000);\r\n    await pool.execute(\r\n      `UPDATE customers SET code = '${code}' WHERE username = '${username}' AND email = '${email}'`\r\n    );\r\n    let mailOptions = {\r\n      from: \"computercentralqn@gmail.com\",\r\n      to: `${email}`,\r\n      subject: \"Verification Code\",\r\n      text: `Your verification code is: <p style = \"font-weight: bold; font-size: 20px; letter-spacing: 3px\">${code}</p>`,\r\n      html: `Your verification code is: <p style = \"font-weight: bold; font-size: 20px; letter-spacing: 3px\">${code}</p>`,\r\n    };\r\n    transporter.sendMail(mailOptions, function (error, info) {\r\n      if (error) {\r\n        res.send(500);\r\n      } else {\r\n        setTimeout(() => {\r\n          pool.execute(\r\n            `UPDATE customers SET code = null WHERE username = '${username}' AND email = '${email}'`\r\n          );\r\n        }, 2000 * 60);\r\n        return res.status(200).json({\r\n            message: \"ok\",\r\n        })\r\n      }\r\n    });\r\n  } catch (error) {\r\n    console.log(error);\r\n    return res.status(500).json({\r\n      message: \"Internal Server Error\",\r\n    });\r\n  }\r\n};\r\n\r\nconst changePassword = async (req, res) => {\r\n//   const { customer_id } = req.user;\r\n  const { code, password, email, username } = req.body;\r\n    const newPassword = password;\r\n    if (!code || !password || !email || !username) {\r\n        return res.status(400).json({\r\n            message: \"Not found code or password or email or username\",\r\n        });\r\n    }\r\n  try {\r\n    const [rows, feilds] = await pool.query(\r\n      `SELECT * FROM customers WHERE username = '${username}' AND email = '${email}'`\r\n    );\r\n    if (rows[0].code === code) {\r\n      await pool.execute(\r\n        `UPDATE customers SET password = '${newPassword}' WHERE username = '${username}' AND email = '${email}'`\r\n      );\r\n      return res.status(200).json({\r\n        message: \"ok\",\r\n      })\r\n    } else {\r\n      return res.status(400).json({\r\n        message: \"Code is not correct\",\r\n      });\r\n    }\r\n  } catch (error) {\r\n    console.log(error);\r\n    return res.status(500).json({\r\n      message: \"Internal Server Error\",\r\n    });\r\n  }\r\n};\r\n\r\nconst changeEmail = async (req, res) => {\r\n  const { customer_id } = req.user;\r\n  const { capcha, newEmail, oldEmail } = req.body;\r\n  if (!customer_id) {\r\n    return res.status(400).json({\r\n      message: \"Not found customer_id\",\r\n    });\r\n  }\r\n  try {\r\n    const [rows, feilds] = await pool.query(\r\n      `SELECT email FROM customers WHERE customer_id = '${customer_id}'`\r\n    );\r\n    if (rows[0].email === oldEmail) {\r\n      await pool.execute(\r\n        `UPDATE customers SET email = '${newEmail}' WHERE customer_id = ${customer_id}`\r\n      );\r\n      return res.status(200).json({\r\n        message: \"ok\",\r\n      });\r\n    } else {\r\n      return res.status(400).json({\r\n        message: \"Old email is not correct\",\r\n      });\r\n    }\r\n  } catch (error) {\r\n    console.log(error);\r\n    return res.status(500).json({\r\n      message: \"Internal Server Error\",\r\n    });\r\n  }\r\n};\r\n\r\nconst forgotPassword = async (req, res) => {};\r\n\r\nmodule.exports = {\r\n  getUser,\r\n  updateUser,\r\n  getCapcha,\r\n  changePassword,\r\n  changeEmail,\r\n  forgotPassword,\r\n};\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/api/apiUser.js?");

/***/ }),

/***/ "./src/resources/controller/web/Banners.js":
/*!*************************************************!*\
  !*** ./src/resources/controller/web/Banners.js ***!
  \*************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\n\r\nconst getBanner = async (req, res) => {\r\n  let [rows] = await pool.execute(`SELECT * FROM banners`);\r\n  return res.render(\"getBanners\", { data: rows });\r\n};\r\n\r\nconst postBanner = async (req, res) => {\r\n  const { name } = req.body;\r\n  const image = req.file.path;\r\n  await pool.execute(\r\n    `INSERT INTO banners (banner_name, banner_image) VALUES ('${name}', '${image}')`\r\n  );\r\n  return res.redirect(\"/web/get-banners\");\r\n};\r\n\r\nconst deleteBanner = async (req, res) => {\r\n    const { banner_id } = req.query;\r\n    await pool.execute(`DELETE FROM banners WHERE banner_id = ${banner_id}`);\r\n    return res.redirect(\"/web/get-banners\");\r\n}\r\n\r\nconst postBannerPage = (req, res) => {\r\n  return res.render(\"postBanner\");\r\n};\r\n\r\nmodule.exports = { getBanner, postBanner, postBannerPage, deleteBanner };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/web/Banners.js?");

/***/ }),

/***/ "./src/resources/controller/web/Bookings.js":
/*!**************************************************!*\
  !*** ./src/resources/controller/web/Bookings.js ***!
  \**************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\n\r\nconst getBookings = async (req, res) => {\r\n  const [rows, feilds] = await pool.execute(`SELECT * FROM repair_schedule`);\r\n  return res.render(\"getBookings\", { data: rows });\r\n};\r\n\r\nconst exportBill = async (req, res) => {\r\n  const { schedule_id } = req.params;\r\n  const [rows, feilds] = await pool.execute(`SELECT * FROM repair_schedule`);\r\n  return res.render(\"exportBill\", { data: rows });\r\n};\r\n\r\nconst deleteRepair = async (req, res) => {\r\n    const { schedule_id } = req.params;\r\n    await pool.execute(`DELETE FROM repair_schedule WHERE schedule_id = ?`, [schedule_id]);\r\n    return res.redirect(\"/web/getBookings\");\r\n  };\r\n\r\nmodule.exports = { getBookings, exportBill, deleteRepair };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/web/Bookings.js?");

/***/ }),

/***/ "./src/resources/controller/web/Customers.js":
/*!***************************************************!*\
  !*** ./src/resources/controller/web/Customers.js ***!
  \***************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\n\r\nconst getCustomers = async (req, res) => {\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT * FROM customers`\r\n  );\r\n  return res.render(\"getCustomer\", { data: rows });\r\n};\r\n\r\nconst deleteCustomer = async (req, res) => {\r\n    const { id } = req.params;\r\n    await pool.execute(\r\n        `DELETE FROM customers WHERE customer_id= ?`, [id]\r\n    );\r\n    return res.redirect(\"/web/get-customer\");\r\n};\r\n\r\nmodule.exports = { getCustomers, deleteCustomer };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/web/Customers.js?");

/***/ }),

/***/ "./src/resources/controller/web/Orders.js":
/*!************************************************!*\
  !*** ./src/resources/controller/web/Orders.js ***!
  \************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\nconst fs = __webpack_require__(/*! fs */ \"fs\");\r\nconst Document = __webpack_require__(/*! pdfkit */ \"pdfkit\");\r\nconst PdfTable = __webpack_require__(/*! voilab-pdf-table */ \"voilab-pdf-table\");\r\n\r\nconst getOrder = async (req, res) => {\r\n  const [rows, feilds] = await pool.query(\r\n    `SELECT orders.order_id, order_items.product_id, products.product_name, orders.total_amount, order_items.first_name, order_items.last_name, \r\n    order_items.address, order_items.number_phone, order_items.payment, order_items.notes, orders.order_date, products.product_price, \r\n    products.product_sale_price\r\n    FROM (orders inner join order_items on orders.order_id = order_items.order_id)\r\n    inner join products on order_items.product_id = products.product_id`\r\n  );\r\n  res.render(\"order\", { data: rows });\r\n};\r\n\r\nconst exportBill = async (req, res) => {\r\n  const order_id = req.params.order_id;\r\n  try {\r\n    const [rows, feilds] = await pool.query(\r\n      `SELECT orders.order_id, order_items.product_id, products.product_name, orders.total_amount, order_items.first_name, order_items.last_name, \r\n          order_items.address, order_items.number_phone, order_items.payment, order_items.notes, orders.order_date, products.product_price, \r\n          products.product_sale_price\r\n          FROM (orders inner join order_items on orders.order_id = order_items.order_id)\r\n          inner join products on order_items.product_id = products.product_id where orders.order_id = ${order_id}`\r\n    );\r\n    const order = rows;\r\n    let total_price = 0;\r\n    const array = [];\r\n    for (let i = 0; i < order.length; i++) {\r\n      const element = order[i];\r\n      let total =\r\n        element.product_price * element.total_amount -\r\n        (element.product_sale_price / 100) *\r\n          element.product_price *\r\n          element.total_amount;\r\n      let formattedAmount = (total * 1000).toLocaleString() + \" VNĐ\";\r\n      total_price += total;\r\n      array.push({\r\n        id: i + 1,\r\n        product_name: element.product_name,\r\n        quantity: Number(element.total_amount).toFixed(),\r\n        sale: element.product_sale_price,\r\n        price: formattedAmount,\r\n      });\r\n    }\r\n\r\n    const date = new Date();\r\n    const day = date.getDate();\r\n    const month = date.getMonth() + 1;\r\n    const year = date.getFullYear();\r\n\r\n    const doc = new Document();\r\n    doc.pipe(fs.createWriteStream(`order-${order.order_id}.pdf`));\r\n    doc.pipe(res);\r\n    doc.font(\"src/public/font/arial.ttf\");\r\n    doc\r\n      .image(\"src/public/img/logo/logo.png\")\r\n      .moveUp()\r\n      .moveUp()\r\n      .moveUp()\r\n      .moveUp();\r\n    doc\r\n      .fontSize(20)\r\n      .text(\"HÓA ĐƠN BÁN HÀNG\", { align: \"center\", fontWeight: \"600\" });\r\n    doc.fontSize(14).text(\"(E-INVOICE)\", { align: \"center\" });\r\n\r\n    doc\r\n      .fontSize(10)\r\n      .text(\"Ngày \" + day + \", tháng \" + month + \", năm \" + year, {\r\n        align: \"center\",\r\n      });\r\n    doc.moveDown();\r\n\r\n    //Thông tin người bán hàng\r\n    doc.rect(20, 155, 570, 0.2).stroke();\r\n    doc.moveDown();\r\n    doc.moveDown();\r\n    doc.fontSize(14).text(\"THÔNG TIN NGƯỜI BÁN HÀNG\");\r\n    doc.moveDown();\r\n    doc.fontSize(10).text(\"SIÊU THỊ ĐIỆN TỬ COMPUTER CENTRAL\");\r\n    doc.moveDown();\r\n    doc\r\n      .fontSize(10)\r\n      .text(\r\n        \"Địa chỉ: 170 An Dương Vương, Phường Nguyễn Văn Cừ, Thành Phố Quy Nhơn, Tỉnh Bình Định\"\r\n      );\r\n    doc.moveDown();\r\n    doc.fontSize(10).text(\"Điện thoại: 0981793201\");\r\n    doc.moveDown();\r\n    doc.fontSize(10).text(\"Email: computercentralqn@gmail.com\");\r\n    doc.moveDown();\r\n    doc.moveDown();\r\n    doc.rect(20, 295, 570, 0.2).stroke();\r\n\r\n    // Thông tin người mua hàng\r\n    doc.moveDown();\r\n    doc.fontSize(14).text(\"THÔNG TIN NGƯỜI MUA HÀNG\");\r\n    doc.moveDown();\r\n    doc\r\n      .fontSize(10)\r\n      .text(\"Tên người mua: \" + order[0].first_name + \" \" + order[0].last_name);\r\n    doc.moveDown();\r\n    doc.fontSize(10).text(\"Số điện thoại: \" + order[0].number_phone);\r\n    doc.moveDown();\r\n    doc.fontSize(10).text(\"Địa chỉ: \" + order[0].address);\r\n    doc.moveDown();\r\n    doc.text(\"Hình thức thanh toán: \" + order[0].payment, { align: \"left\" });\r\n    doc.moveDown();\r\n    doc.text(\"Ghi chú: \" + order[0].notes, { align: \"left\" });\r\n    doc.moveDown();\r\n    doc.rect(20, 460, 570, 0.2).stroke();\r\n    doc.moveDown();\r\n    doc.moveDown();\r\n\r\n    // Thông tin sản phẩm\r\n    doc.fontSize(14).text(\"THÔNG TIN ĐƠN HÀNG\");\r\n    doc.moveDown();\r\n    const table = new PdfTable(doc.fontSize(10), {\r\n      bottomMargin: 30,\r\n    });\r\n    table\r\n      .addPlugin(\r\n        new (__webpack_require__(/*! voilab-pdf-table/plugins/fitcolumn */ \"voilab-pdf-table/plugins/fitcolumn\"))({\r\n          column: \"id\",\r\n        })\r\n      )\r\n      .setColumnsDefaults({\r\n        headerBorder: [\"B\", \"T\", \"L\", \"R\"],\r\n        headerPadding: [10, 10, 10, 10],\r\n        headerBorderOpacity: 0.5,\r\n        padding: [10, 10, 10, 10],\r\n        border: [\"L\", \"R\", \"B\"],\r\n        borderOpacity: 0.5,\r\n      })\r\n      .addColumns([\r\n        {\r\n          id: \"id\",\r\n          header: \"STT\",\r\n          width: 25,\r\n        },\r\n        {\r\n          id: \"product_name\",\r\n          header: \"Tên sản phẩm\",\r\n          width: 180,\r\n        },\r\n        {\r\n          id: \"quantity\",\r\n          header: \"Số lượng\",\r\n          width: 65,\r\n        },\r\n        {\r\n          id: \"sale\",\r\n          header: \"Giảm giá(%)\",\r\n          width: 80,\r\n        },\r\n        {\r\n          id: \"price\",\r\n          header: \"Thành tiền\",\r\n          width: 100,\r\n        },\r\n      ])\r\n      .onPageAdded(function (tb) {\r\n        tb.addHeader();\r\n      });\r\n\r\n    table.addBody(array);\r\n    doc.moveDown();\r\n    doc\r\n      .fontSize(10)\r\n      .text(\"Tổng tiền: \" + (total_price * 1000).toLocaleString() + \" VNĐ\", {\r\n        align: \"right\",\r\n      });\r\n    doc.moveDown();\r\n    doc.end();\r\n\r\n    await pool.execute(`delete from order_items where order_id = ${order_id}`);\r\n    await pool.execute(`delete from orders where order_id = ${order_id}`);\r\n    res.redirect(\"/web/get-orders\");\r\n  } catch (error) {\r\n    console.log(error);\r\n  }\r\n};\r\n\r\nconst deleteOrder = async (req, res) => {\r\n    try {\r\n        const order_id = req.params.order_id;\r\n        await pool.execute(`delete from order_items where order_id = ${order_id}`);\r\n        await pool.execute(`delete from orders where order_id = ${order_id}`);\r\n        res.redirect(\"back\");\r\n    } catch (error) {\r\n        console.log(error);\r\n    }\r\n}\r\n\r\nmodule.exports = { getOrder, exportBill, deleteOrder };\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/web/Orders.js?");

/***/ }),

/***/ "./src/resources/controller/web/Products.js":
/*!**************************************************!*\
  !*** ./src/resources/controller/web/Products.js ***!
  \**************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const processing = __webpack_require__(/*! ../../../logic/dataProcessing */ \"./src/logic/dataProcessing.js\");\r\nconst pool = __webpack_require__(/*! ../../config/connectDatabase */ \"./src/resources/config/connectDatabase.js\");\r\nconst xlsx = __webpack_require__(/*! xlsx */ \"xlsx\");\r\n\r\nconst getProducts = async (req, res) => {\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\r\n    inner join product_details on products.product_id = product_details.product_id`\r\n  );\r\n  const result = processing(rows);\r\n  return res.render(\"getProducts\", { data: result });\r\n};\r\n\r\nconst deleteImageProduct = async (req, res) => {\r\n  // const id = req.params.id;\r\n  const image_id = req.params.id;\r\n  await pool.execute(`DELETE FROM product_images WHERE image_id = ${image_id}`);\r\n  return res.redirect(\"back\");\r\n};\r\n\r\nconst deleteProduct = async (req, res) => {\r\n  const id = req.params.id;\r\n  await pool.execute(\"DELETE FROM `product_images` where product_id = ?\", [id]);\r\n  await pool.execute(\"DELETE FROM `product_details` where product_id = ?\", [\r\n    id,\r\n  ]);\r\n  await pool.execute(\"DELETE FROM `products` where product_id = ?\", [id]);\r\n  return res.redirect(\"/web/get-products\");\r\n};\r\n\r\nconst postProductsPage = (req, res) => {\r\n  return res.render(\"postProduct\");\r\n};\r\n\r\nconst createNewProductExcel = (req, res) => {\r\n  return res.render(\"postProductExcel\");\r\n};\r\n\r\nconst createNewProduct = async (req, res) => {\r\n  const {\r\n    type,\r\n    name,\r\n    infomation,\r\n    price,\r\n    quantity,\r\n    sale,\r\n    nameDetails,\r\n    valueDetails,\r\n  } = req.body;\r\n  let details = [];\r\n  nameDetails.map((element) => {\r\n    details.push({\r\n      detail_name: element,\r\n      detail_value: valueDetails[nameDetails.indexOf(element)],\r\n    });\r\n  });\r\n\r\n  //   lấy đường dẫn tuyệt đối của file cloudinary\r\n  const urls = [];\r\n  const files = req.files;\r\n  for (const file of files) {\r\n    const { path } = file;\r\n    urls.push(path);\r\n  }\r\n\r\n  await pool.execute(\r\n    `INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)\r\n      VALUES ('${name}', '${infomation}', ${price}, ${sale}, '${type}', ${quantity});`\r\n  );\r\n\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT max(product_id) as product_id FROM products`\r\n  );\r\n  const product_id = rows[0].product_id;\r\n  if (urls.length > 0) {\r\n    urls.map((element) => {\r\n      pool.execute(\r\n        `INSERT INTO product_images (product_id, file_path)\r\n                    VALUES (${product_id} ,'${element}')`\r\n      );\r\n    });\r\n  }\r\n\r\n  if (details.length > 0) {\r\n    details.map((element) => {\r\n      pool.execute(\r\n        `INSERT INTO product_details (product_id, detail_name, detail_value)\r\n              VALUES (${product_id}, '${element.detail_name}', '${element.detail_value}')`\r\n      );\r\n    });\r\n  }\r\n  return res.redirect(\"/cms\");\r\n};\r\n\r\nconst postProductExcel = async (req, res) => {\r\n  const file = req.file;\r\n  try {\r\n    const workbook = xlsx.readFile(file.path);\r\n    const worksheet = workbook.Sheets[workbook.SheetNames[0]];\r\n    const data = xlsx.utils.sheet_to_json(worksheet);\r\n    data.forEach(async (element) => {\r\n      const {\r\n        product_name,\r\n        product_description,\r\n        product_price,\r\n        product_sale_price,\r\n        product_type,\r\n        product_quantity,\r\n      } = element;\r\n      const tmp = element.product_details.split(\"; \");\r\n      const details = [];\r\n      const images = element.product_images.split(\", \");\r\n      tmp.forEach((element) => {\r\n        const detail = element.split(\": \");\r\n        details.push({\r\n          detail_name: detail[0],\r\n          detail_value: detail[1],\r\n        });\r\n      });\r\n      await pool.execute(\r\n        `INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)\r\n              VALUES ('${product_name}', '${product_description}', ${product_price}, ${product_sale_price}, '${product_type}', ${product_quantity});`\r\n      );\r\n      const [rows, fields] = await pool.execute(\r\n        `SELECT max(product_id) as product_id FROM products`\r\n      );\r\n      const product_id = rows[0].product_id;\r\n      images.map((element) => {\r\n        pool.execute(\r\n          `INSERT INTO product_images (product_id, file_path)\r\n                      VALUES (${product_id} ,'${element}')`\r\n        );\r\n      });\r\n      details.map((element) => {\r\n        pool.execute(\r\n          `INSERT INTO product_details (product_id, detail_name, detail_value)\r\n                    VALUES (${product_id}, '${element.detail_name}', '${element.detail_value}')`\r\n        );\r\n      });\r\n    });\r\n  } catch (error) {\r\n    console.log(error);\r\n  }\r\n  // const products = data.slice(1);\r\n  // console.log(products);\r\n  // for (let i = 0; i < products.length; i++) {\r\n  //     const product = products[i];\r\n  //     const name = product[0];\r\n  //     const infomation = product[1];\r\n  //     const price = product[2];\r\n  //     const sale = product[3];\r\n  //     const type = product[4];\r\n  //     const quantity = product[5];\r\n  //     const image = product[6];\r\n  //     const detail = product[7];\r\n  //     const value = product[8];\r\n  //     await pool.execute(\r\n  //         `INSERT INTO products (product_name, product_description, product_price, product_sale_price, product_type, product_quantity)\r\n  //           VALUES ('${name}', '${infomation}', ${price}, ${sale}, '${type}', ${quantity});`\r\n  //       );\r\n  //     const [rows, fields] = await pool.execute(\r\n  //         `SELECT max(product_id) as product_id FROM products`\r\n  //       );\r\n  //     const product_id = rows[0].product_id;\r\n  //     await pool.execute(\r\n  //         `INSERT INTO product_images (product_id, file_path)\r\n  //                     VALUES (${product_id} ,'${image}')`\r\n  //       );\r\n  //     await pool.execute(\r\n  //         `INSERT INTO product_details (product_id, detail_name, detail_value)\r\n  //               VALUES (${product_id}, '${detail}', '${value}')`\r\n  //       );\r\n  // }\r\n  return res.redirect(\"/cms\");\r\n};\r\n\r\nconst updateProductPost = async (req, res) => {\r\n  try {\r\n    const {\r\n      type,\r\n      name,\r\n      infomation,\r\n      price,\r\n      quantity,\r\n      sale,\r\n      key,\r\n      value,\r\n      id_detail,\r\n      valueDetails,\r\n    } = req.body;\r\n    const id = req.params.id;\r\n    const nameDetails = req.body.nameDetails || [];\r\n\r\n    await pool.execute(\r\n      `UPDATE products SET product_name = '${name}', product_description = '${infomation}', \r\n        product_price = ${price}, product_sale_price = ${sale}, product_type = '${type}', \r\n        product_quantity = ${quantity} WHERE product_id = ${id}`\r\n    );\r\n\r\n    if (nameDetails.length > 0) {\r\n      nameDetails.map((element) => {\r\n        let ob = {\r\n          detail_name: element,\r\n          detail_value: valueDetails[nameDetails.indexOf(element)],\r\n        };\r\n        pool.execute(\r\n          `INSERT INTO product_details(product_id, detail_name, detail_value)\r\n                VALUES (${id}, '${ob.detail_name}', '${ob.detail_value}\r\n            ')`\r\n        );\r\n      });\r\n    }\r\n\r\n    const detailsOld = [];\r\n    for (let i = 0; i < key.length; i++) {\r\n      let detail_id = id_detail[i];\r\n      let detail_name = key[i];\r\n      let detail_value = value[i];\r\n      detailsOld.push({\r\n        detail_id,\r\n        detail_name,\r\n        detail_value,\r\n      });\r\n    }\r\n    detailsOld.map((element) => {\r\n      pool.execute(\r\n        `UPDATE product_details SET detail_name = '${element.detail_name}', detail_value = '${element.detail_value}' WHERE detail_id = ${element.detail_id}`\r\n      );\r\n    });\r\n\r\n    const urls = [];\r\n    const files = req.files;\r\n    for (const file of files) {\r\n      const { path } = file;\r\n      urls.push(path);\r\n    }\r\n    if (urls.length > 0) {\r\n      urls.map((element) => {\r\n        pool.execute(\r\n          `INSERT INTO product_images (product_id, file_path)\r\n                      VALUES (${id} ,'${element}')`\r\n        );\r\n      });\r\n    }\r\n    return res.redirect(\"/web\");\r\n  } catch (error) {\r\n    console.log(error);\r\n  }\r\n};\r\n\r\nconst updateProductGet = async (req, res) => {\r\n  const [rows, fields] = await pool.execute(\r\n    `SELECT * FROM products inner join product_images on products.product_id = product_images.product_id\r\n      inner join product_details on products.product_id = product_details.product_id where products.product_id = ${req.params.id}`\r\n  );\r\n  const result = processing(rows);\r\n  return res.render(\"updateProduct\", { data: result[0] });\r\n};\r\n\r\nmodule.exports = {\r\n  getProducts,\r\n  deleteImageProduct,\r\n  deleteProduct,\r\n  postProductsPage,\r\n  createNewProduct,\r\n  updateProductGet,\r\n  updateProductPost,\r\n  postProductExcel,\r\n  createNewProductExcel,\r\n};\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/controller/web/Products.js?");

/***/ }),

/***/ "./src/resources/route/api.js":
/*!************************************!*\
  !*** ./src/resources/route/api.js ***!
  \************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const express = __webpack_require__(/*! express */ \"express\");\r\nconst { VerifyJWT } = __webpack_require__(/*! ../../middleware/JWTActions */ \"./src/middleware/JWTActions.js\");\r\nconst Headers = __webpack_require__(/*! ../../middleware/HeadersAPI */ \"./src/middleware/HeadersAPI.js\");\r\nconst Products = __webpack_require__(/*! ../controller/api/apiProducts */ \"./src/resources/controller/api/apiProducts.js\");\r\nconst User = __webpack_require__(/*! ../controller/api/apiUser */ \"./src/resources/controller/api/apiUser.js\");\r\nconst Cart = __webpack_require__(/*! ../controller/api/apiCart */ \"./src/resources/controller/api/apiCart.js\");\r\nconst register = __webpack_require__(/*! ../controller/api/another/apiRegister */ \"./src/resources/controller/api/another/apiRegister.js\");\r\nconst login = __webpack_require__(/*! ../controller/api/another/apiLogin */ \"./src/resources/controller/api/another/apiLogin.js\");\r\nconst getBanner = __webpack_require__(/*! ../controller/api/another/apiGetBanner */ \"./src/resources/controller/api/another/apiGetBanner.js\");\r\nconst Booking = __webpack_require__(/*! ../controller/api/apiBooking */ \"./src/resources/controller/api/apiBooking.js\");\r\n\r\nlet router = express.Router();\r\n\r\nconst initAPIWebRoute = (app) => {\r\n  //products API\r\n  router.get(\"/get-product-all\", Products.getAllProducts);\r\n  router.get(\"/get-product-type\", Products.getProductsType);\r\n  router.get(\"/get-product-info\", Products.getInforProduct);\r\n\r\n  //User API\r\n  router.get(\"/get-user\", VerifyJWT, User.getUser);\r\n  router.post(\"/update-user\", VerifyJWT, User.updateUser);\r\n  router.post(\r\n    \"/get-capcha\",\r\n    User.getCapcha\r\n  );\r\n  router.post(\"/change-password\", User.changePassword);\r\n  router.post('/forgot-password', User.forgotPassword);\r\n\r\n  //Cart API\r\n  router.post(\"/add-to-cart\", VerifyJWT, Cart.addToCart);\r\n  router.get(\"/cart/get-cart\", VerifyJWT, Cart.getCart);\r\n  router.post(\"/cart/delete-product-cart/\", VerifyJWT, Cart.deleteProductCart);\r\n  router.post(\"/buy\", VerifyJWT, Cart.buy);\r\n\r\n  //Another API\r\n  router.post(\"/register\", register.register);\r\n  router.post(\"/login\", login.login);\r\n  router.post(\"/check-user\", login.checkUser);\r\n  router.get(\"/check-token\", login.checkToken);\r\n  router.get(\"/get-banners\", getBanner.getBanner);\r\n  router.post(\"/booking\", VerifyJWT, Booking.booking);\r\n\r\n  return app.use(\"/api/v1\", Headers, router);\r\n};\r\n\r\nmodule.exports = initAPIWebRoute;\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/route/api.js?");

/***/ }),

/***/ "./src/resources/route/web.js":
/*!************************************!*\
  !*** ./src/resources/route/web.js ***!
  \************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const express = __webpack_require__(/*! express */ \"express\");\r\nconst uploadCloud = __webpack_require__(/*! ../config/cloudinary.config */ \"./src/resources/config/cloudinary.config.js\");\r\nconst Products = __webpack_require__(/*! ../controller/web/Products */ \"./src/resources/controller/web/Products.js\");\r\nconst Customers = __webpack_require__(/*! ../controller/web/Customers */ \"./src/resources/controller/web/Customers.js\");\r\nconst Order = __webpack_require__(/*! ../controller/web/Orders */ \"./src/resources/controller/web/Orders.js\");\r\nconst Banners = __webpack_require__(/*! ../controller/web/Banners */ \"./src/resources/controller/web/Banners.js\");\r\nconst Booking = __webpack_require__(/*! ../controller/web/Bookings */ \"./src/resources/controller/web/Bookings.js\");\r\nconst { checkIpInWhitelist } = __webpack_require__(/*! ../../middleware/AuthorWeb */ \"./src/middleware/AuthorWeb.js\");\r\nlet router = express.Router();\r\nconst multer = __webpack_require__(/*! multer */ \"multer\");\r\n\r\nconst upload = multer({ dest: \"uploads/\" });\r\n\r\nconst initWebRoute = (app) => {\r\n  //Web products\r\n  router.get(\"/\", Products.getProducts);\r\n  router.get(\"/post-product\", Products.postProductsPage);\r\n  router.post(\r\n    \"/create-new-product\",\r\n    uploadCloud.array(\"image\", 10),\r\n    Products.createNewProduct\r\n  );\r\n  router.post(\"/post-product-excel\", upload.single('file'), Products.postProductExcel);\r\n  router.get(\"/post-product-excel\", Products.createNewProductExcel);\r\n  router.get(\"/update-product/:id\", Products.updateProductGet);\r\n  router.post(\r\n    \"/update-product/:id\",\r\n    uploadCloud.array(\"image\", 10),\r\n    Products.updateProductPost\r\n  );\r\n  router.get(\"/delete-product/:id\", Products.deleteProduct);\r\n  router.get(\"/delete-image-product/:id\", Products.deleteImageProduct);\r\n\r\n  //Web customer\r\n  router.get(\"/get-customer\", Customers.getCustomers);\r\n\r\n  //Web order\r\n  router.get(\"/get-orders\", Order.getOrder);\r\n  router.get(\"/export-bill/:order_id\", Order.exportBill);\r\n  router.get(\"/delete-order/:order_id\", Order.deleteOrder);\r\n  \r\n  //Web banner\r\n  router.get(\"/get-banners\", Banners.getBanner);\r\n  router.get(\"/post-banner\", Banners.postBannerPage);\r\n  router.post(\"/post-banner\", uploadCloud.single(\"banner\"), Banners.postBanner);\r\n  router.get(\"/delete-banner\", Banners.deleteBanner);\r\n\r\n  //Web booking\r\n  router.get(\"/get-bookings\", Booking.getBookings);\r\n  router.get(\"/export-bill-repair/:schedule_id\", Booking.exportBill);\r\n  router.get(\"/delete-repair/:schedule_id\", Booking.deleteRepair);\r\n\r\n  return app.use(\"/cms\", checkIpInWhitelist, router);\r\n};\r\nmodule.exports = initWebRoute;\r\n\n\n//# sourceURL=webpack://store-backend/./src/resources/route/web.js?");

/***/ }),

/***/ "bcrypt":
/*!*************************!*\
  !*** external "bcrypt" ***!
  \*************************/
/***/ ((module) => {

"use strict";
module.exports = require("bcrypt");

/***/ }),

/***/ "cloudinary":
/*!*****************************!*\
  !*** external "cloudinary" ***!
  \*****************************/
/***/ ((module) => {

"use strict";
module.exports = require("cloudinary");

/***/ }),

/***/ "cookie-parser":
/*!********************************!*\
  !*** external "cookie-parser" ***!
  \********************************/
/***/ ((module) => {

"use strict";
module.exports = require("cookie-parser");

/***/ }),

/***/ "dotenv":
/*!*************************!*\
  !*** external "dotenv" ***!
  \*************************/
/***/ ((module) => {

"use strict";
module.exports = require("dotenv");

/***/ }),

/***/ "express":
/*!**************************!*\
  !*** external "express" ***!
  \**************************/
/***/ ((module) => {

"use strict";
module.exports = require("express");

/***/ }),

/***/ "express-handlebars":
/*!*************************************!*\
  !*** external "express-handlebars" ***!
  \*************************************/
/***/ ((module) => {

"use strict";
module.exports = require("express-handlebars");

/***/ }),

/***/ "fs":
/*!*********************!*\
  !*** external "fs" ***!
  \*********************/
/***/ ((module) => {

"use strict";
module.exports = require("fs");

/***/ }),

/***/ "ip":
/*!*********************!*\
  !*** external "ip" ***!
  \*********************/
/***/ ((module) => {

"use strict";
module.exports = require("ip");

/***/ }),

/***/ "jsonwebtoken":
/*!*******************************!*\
  !*** external "jsonwebtoken" ***!
  \*******************************/
/***/ ((module) => {

"use strict";
module.exports = require("jsonwebtoken");

/***/ }),

/***/ "morgan":
/*!*************************!*\
  !*** external "morgan" ***!
  \*************************/
/***/ ((module) => {

"use strict";
module.exports = require("morgan");

/***/ }),

/***/ "multer":
/*!*************************!*\
  !*** external "multer" ***!
  \*************************/
/***/ ((module) => {

"use strict";
module.exports = require("multer");

/***/ }),

/***/ "multer-storage-cloudinary":
/*!********************************************!*\
  !*** external "multer-storage-cloudinary" ***!
  \********************************************/
/***/ ((module) => {

"use strict";
module.exports = require("multer-storage-cloudinary");

/***/ }),

/***/ "mysql2/promise":
/*!*********************************!*\
  !*** external "mysql2/promise" ***!
  \*********************************/
/***/ ((module) => {

"use strict";
module.exports = require("mysql2/promise");

/***/ }),

/***/ "nodemailer":
/*!*****************************!*\
  !*** external "nodemailer" ***!
  \*****************************/
/***/ ((module) => {

"use strict";
module.exports = require("nodemailer");

/***/ }),

/***/ "path":
/*!***********************!*\
  !*** external "path" ***!
  \***********************/
/***/ ((module) => {

"use strict";
module.exports = require("path");

/***/ }),

/***/ "pdfkit":
/*!*************************!*\
  !*** external "pdfkit" ***!
  \*************************/
/***/ ((module) => {

"use strict";
module.exports = require("pdfkit");

/***/ }),

/***/ "voilab-pdf-table":
/*!***********************************!*\
  !*** external "voilab-pdf-table" ***!
  \***********************************/
/***/ ((module) => {

"use strict";
module.exports = require("voilab-pdf-table");

/***/ }),

/***/ "voilab-pdf-table/plugins/fitcolumn":
/*!*****************************************************!*\
  !*** external "voilab-pdf-table/plugins/fitcolumn" ***!
  \*****************************************************/
/***/ ((module) => {

"use strict";
module.exports = require("voilab-pdf-table/plugins/fitcolumn");

/***/ }),

/***/ "xlsx":
/*!***********************!*\
  !*** external "xlsx" ***!
  \***********************/
/***/ ((module) => {

"use strict";
module.exports = require("xlsx");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;