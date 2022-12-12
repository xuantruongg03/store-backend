const express = require("express");
const homeController = require("../controller/homeController");
const postProductsController = require("../controller/postProductsController");
const updateProductController = require("../controller/updateProductController");
const deleteProductController = require("../controller/deleteProductController");
const getCustomerController = require("../controller/getCustomerController");
let router = express.Router();

const initWebRoute = (app) => {
  
  router.get("/", homeController.homePage);
  router.get("/post", postProductsController.postProductsPage);
  router.post("/create-new-product", postProductsController.createNewProduct);
  router.get("/update-product/:id", homeController.getProduct);
  router.post("/update-product/:id", updateProductController.updateProduct);
  router.get("/delete-product/:id", deleteProductController.deleteProduct);
  router.get("/get-customer", getCustomerController.getCustomer);

  return app.use("/", router);
};

module.exports = initWebRoute;
