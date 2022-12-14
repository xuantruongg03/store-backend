const express = require("express");
const getProduct = require("../controller/api/apiGetProducts");
const addToCart = require("../controller/api/apiAddToCart");

let router = express.Router();

const initAPIWebRoute = (app) => {

  router.get("/get-product", getProduct.getProduct);
  router.post("/add-to-cart", addToCart.addToCart);

  return app.use("/api/v1/", router);
};

module.exports = initAPIWebRoute;
