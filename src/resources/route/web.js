const express = require("express");
const uploadCloud = require("../config/cloudinary.config");
const Products = require("../controller/web/Products");
const Customers = require("../controller/web/Customers");
const Order = require("../controller/web/Orders");
const Banners = require("../controller/web/Banners");
const Booking = require("../controller/web/Bookings");
const { checkIpInWhitelist } = require("../../middleware/AuthorWeb");
let router = express.Router();
const multer = require("multer");

const upload = multer({ dest: "uploads/" });

const initWebRoute = (app) => {
  //Web products
  router.get("/", Products.getProducts);
  router.get("/post-product", Products.postProductsPage);
  router.post(
    "/create-new-product",
    uploadCloud.array("image", 10),
    Products.createNewProduct
  );
  router.post("/post-product-excel", upload.single('file'), Products.postProductExcel);
  router.get("/post-product-excel", Products.createNewProductExcel);
  router.get("/update-product/:id", Products.updateProductGet);
  router.post(
    "/update-product/:id",
    uploadCloud.array("image", 10),
    Products.updateProductPost
  );
  router.get("/delete-product/:id", Products.deleteProduct);
  router.get("/delete-image-product/:id", Products.deleteImageProduct);

  //Web customer
  router.get("/get-customer", Customers.getCustomers);

  //Web order
  router.get("/get-orders", Order.getOrder);
  router.get("/export-bill/:customer_id", Order.exportBill);
  router.get("/delete-order/:customer_id", Order.deleteOrder);
  
  //Web banner
  router.get("/get-banners", Banners.getBanner);
  router.get("/post-banner", Banners.postBannerPage);
  router.post("/post-banner", uploadCloud.single("banner"), Banners.postBanner);
  router.get("/delete-banner", Banners.deleteBanner);

  //Web booking
  router.get("/get-bookings", Booking.getBookings);
  router.get("/export-bill-repair/:schedule_id", Booking.exportBill);
  router.get("/delete-repair/:schedule_id", Booking.deleteRepair);

  return app.use("/cms", checkIpInWhitelist, router);
};
module.exports = initWebRoute;
