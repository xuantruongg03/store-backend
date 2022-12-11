const express = require("express");
const homeController = require("../controller/homeController");
const postProductsController = require("../controller/postProductsController");
let router = express.Router();

const initWebRoute = (app) => {
  
  
  router.get("/", homeController.homePage);
  router.get("/post", postProductsController.postProductsPage);
  router.get("/update-product", homeController.getProduct);
  router.post("/create-new-product", postProductsController.createNewProduct);
  router.post("/delete-product", homeController.deleteProduct);

  return app.use("/", router);
};

module.exports = initWebRoute;
