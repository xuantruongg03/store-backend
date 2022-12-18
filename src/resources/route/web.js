const express = require("express");
const getProducts = require("../controller/web/getProducts");
const postProducts = require("../controller/web/postProduct");
const updateProduct = require("../controller/web/updateProduct");
const deleteProduct = require("../controller/web/deleteProduct");
const getCustomer = require("../controller/web/getCustomer");
const uploadCloud = require("../config/cloudinary.config");

let router = express.Router();

const initWebRoute = (app) => {
  
  router.get("/", getProducts.getProducts);
  router.get("/post-product", postProducts.postProductsPage);
  router.post("/create-new-product", uploadCloud.single('image'), postProducts.createNewProduct);
  router.get("/update-product/:id", updateProduct.updateProductGet);
  router.post("/update-product/:id", updateProduct.updateProductPost);
  router.get("/delete-product/:id", deleteProduct.deleteProduct);
  router.get("/get-customer", getCustomer.getCustomer);

  return app.use("/", router);
};
module.exports = initWebRoute;
