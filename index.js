const express = require("express");
const path = require("path");
const morgan = require("morgan");
require("dotenv").config();
const handlebars = require("express-handlebars");
const initWebRoute = require("./src/resources/route/web");
const initAPIWebRoute = require("./src/resources/route/api");
const cookieParser = require("cookie-parser");

const app = express();
const port = process.env.PORT || 8080;

app.use(express.static(path.join(__dirname, "./public")));

//use morgan for console log
app.use(morgan("combined"));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(cookieParser());
//Template Engine
app.engine(
  "hbs",
  handlebars.engine({
    extname: ".hbs",
    helpers: {
      // Function to do basic mathematical operation in handlebar
      math: function (lvalue, operator, rvalue) {
        lvalue = parseFloat(lvalue);
        rvalue = parseFloat(rvalue);
        return {
          "+": lvalue + rvalue,
          "-": lvalue - rvalue,
          "*": lvalue * rvalue,
          "/": lvalue / rvalue,
          "%": lvalue % rvalue,
        }[operator];
      },
    },
  })
);
app.set("view engine", "hbs");
app.set("views", path.join(__dirname, ".src//resources/views"));

initWebRoute(app);
initAPIWebRoute(app);

app.listen(port, () => {
  console.log("Server is running on port " + port);
});
