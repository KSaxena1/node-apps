const express = require("express");
const app = express();
const cors = require("cors");

const bookRouter = require("./src/book");
const coffeeRouter = require("./src/coffee");

const port = process.env.PORT || 3000;
app.use(cors());
app.use("/api/book", bookRouter);
app.use("/api/coffee", coffeeRouter);

app.get("/", (req, res) => {
  res.send("Welcome to coffee and books API");
});

app.listen(port, () => {
  console.log(`Running on port ${port}`);
});
