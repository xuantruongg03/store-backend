const express = require("express");
const { VerifyJWT, CheckLogin } = require("../../middleware/JWTActions");
const Headers = require("../../middleware/HeadersAPI");
const Products = require("../controller/api/apiProducts");
const User = require("../controller/api/apiUser");
const Cart = require("../controller/api/apiCart");
const register = require("../controller/api/apiRegister");
const login = require("../controller/api/apiLogin");
const getBanner = require("../controller/api/apiGetBanner");
const Booking = require("../controller/api/apiBooking");
const Blog = require("../controller/api/apiBlog");

let router = express.Router();

const initAPIWebRoute = (app) => {
  //products API
  router.get("/get-product-all", CheckLogin, Products.getAllProducts);
  router.get("/get-product-type", Products.getProductsType);
  router.get("/get-product-info", Products.getInforProduct);
  router.get("/get-product-sale", Products.getProductsSale);

  //User API
  router.get("/get-user", VerifyJWT, User.getUser);
  router.post("/update-user", VerifyJWT, User.updateUser);
  router.post("/get-capcha", User.getCapcha);
  router.post("/change-password", User.changePassword);
  router.post("/forgot-password", User.forgotPassword);

  //Cart API
  router.post("/add-to-cart", VerifyJWT, Cart.addToCart);
  router.get("/cart/get-cart", VerifyJWT, Cart.getCart);
  router.post("/cart/delete-product-cart/", VerifyJWT, Cart.deleteProductCart);
  router.post("/buy", VerifyJWT, Cart.buy);

  //Blog API
  router.post("/post-blog", VerifyJWT, Blog.postBlog);
  router.get("/get-all-blog", Blog.getAllBlog);
  router.get("/get-blog-detail", Blog.getBlogDetail);
  router.post("/rate-blog", VerifyJWT, Blog.rateBlog);

  //Another API
  router.post("/register", register.register);
  router.post("/login", login.login);
  router.post("/check-user", login.checkUser);
  router.get("/check-token", login.checkToken);
  router.get("/get-banners", getBanner.getBanner);
  router.post("/booking", VerifyJWT, Booking.booking);

  return app.use("/api/v1", Headers, router);
};

module.exports = initAPIWebRoute;
