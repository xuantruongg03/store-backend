const express = require("express");
const Headers = require("../../middleware/HeadersAPI");
const Products = require("../controller/api/apiProducts");
const User = require("../controller/api/apiUser");
const Cart = require("../controller/api/apiCart");
const register = require("../controller/api/apiRegister");
const login = require("../controller/api/apiLogin");
const getBanner = require("../controller/api/apiGetBanner");
const Booking = require("../controller/api/apiBooking");
const Blog = require("../controller/api/apiBlog");
const RefreshToken = require("../../middleware/RefreshToken");
const VerifyToken = require("../../middleware/VerifyToken");

let router = express.Router();

const initAPIWebRoute = (app) => {
  //products API
  router.get("/get-product-all", VerifyToken, RefreshToken, Products.getAllProducts);
  router.get("/get-product-type", VerifyToken, RefreshToken, Products.getProductsType);
  router.get("/get-product-info", VerifyToken, RefreshToken, Products.getInforProduct);
  router.get("/get-product-sale", VerifyToken, RefreshToken, Products.getProductsSale);

  //User API
  router.get("/get-user", VerifyToken, RefreshToken, User.getUser);
  router.post("/update-user", VerifyToken, RefreshToken, User.updateUser);
  router.post("/get-capcha", User.getCapcha);
  router.post("/change-password", User.changePassword);
  router.post("/forgot-password", User.forgotPassword);

  //Cart API
  router.post("/add-to-cart", VerifyToken, RefreshToken, Cart.addToCart);
  router.get("/cart/get-cart", VerifyToken, RefreshToken, Cart.getCart);
  router.post("/cart/delete-product-cart/", VerifyToken, RefreshToken, Cart.deleteProductCart);
  router.post("/buy", VerifyToken, RefreshToken, Cart.buy);

  //Blog API
  router.post("/post-blog", VerifyToken, RefreshToken, Blog.postBlog);
  router.get("/get-all-blog", VerifyToken, RefreshToken, Blog.getAllBlog);
  router.get("/get-blog-detail", VerifyToken, RefreshToken, Blog.getBlogDetail);
    router.post("/comment-blog", VerifyToken, RefreshToken, Blog.commentBlog);
    router.get("/get-comment-blog", Blog.getComments);
  router.post("/rate-blog", VerifyToken, RefreshToken, Blog.rateBlog);

  //Another API
  router.post("/register", register.register);
  router.post("/login", login.login);
  router.post("/check-user", login.checkUser);
  router.get("/check-token", login.checkToken);
  router.get("/get-banners", getBanner.getBanner);
  router.post("/booking", VerifyToken, RefreshToken, Booking.booking);

  return app.use("/api/v1", Headers, router);
};

module.exports = initAPIWebRoute;
