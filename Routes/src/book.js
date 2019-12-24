const config = require("./dbConn");
const express = require("express");
const bookRouter = express.Router();
var sql = require("mssql");

/* get the list of NA providers for general use on reports*/
bookRouter.get("/list", (req, res) => {
  sql.connect(config, function(err) {
    if (err) console.log(err);

    //create Request object
    var request = new sql.Request();

    // query to the database and get the records
    request.query(`select * from [dbo].books`, function(err, recordsets) {
      if (err) {
        console.log(err);
        sql.close();
      }
      // send records as a response
      res.setHeader("Content-Type", "application/json");
      res.send(recordsets.recordset);
      sql.close();
    });
  });
});

module.exports = bookRouter;
