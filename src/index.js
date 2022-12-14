const express = require("express");
const path = require("path");
const morgan = require("morgan");
require("dotenv").config();
const handlebars = require("express-handlebars");
const initWebRoute = require("./resources/route/web");
const initAPIWebRoute = require("./resources/route/api");

const app = express();
const port = process.env.PORT || 8080;

app.use(express.static(path.join(__dirname, "/public")));

//use morgan for console log
app.use(morgan("combined"));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

//Template Engine
app.engine(
  "hbs",
  handlebars.engine({
    extname: ".hbs",
  })
);
app.set("view engine", "hbs");
app.set("views", path.join(__dirname, "/resources/views"));

initWebRoute(app);
initAPIWebRoute(app);

app.listen(port, () => {
  console.log("Server is running on port " + port);
});
