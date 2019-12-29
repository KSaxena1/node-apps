const express = require("express");
const app = express();
const cors = require("cors");
var bodyParser = require("body-parser");

const bookRouter = require("./src/book");
const coffeeRouter = require("./src/coffee");
const orderRouter = require("./src/order");

const port = process.env.PORT || 3000;
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(cors());
app.use("/api/book", bookRouter);
app.use("/api/coffee", coffeeRouter);
app.use("/api/order", orderRouter);

app.get("/", (req, res) => {
  res.send("Welcome to coffee and books API");
});

app.listen(port, () => {
  console.log(`Running on port ${port}`);
});
