const express = require("express");
const getProduct = require("../controller/api/apiGetProducts");
const addToCart = require("../controller/api/apiAddToCart");
const register = require("../controller/api/apiRegister");
const login = require("../controller/api/apiLogin");

let router = express.Router();

const initAPIWebRoute = (app) => {

  router.get("/get-product", getProduct.getProduct);
  router.post("/add-to-cart", addToCart.addToCart);
  router.post("/register", register.register);
  router.post("/login", login.login);

  return app.use("/api/v1/", router);
};

module.exports = initAPIWebRoute;
