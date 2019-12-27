const { pool, poolConnect } = require("./dbConn");
const express = require("express");
const bookRouter = express.Router();
var sql = require("mssql");

/* get the list of NA providers for general use on reports*/
bookRouter.get("/list", (req, res) => {
  async function sqlQueryHandler() {
    //const poolConnect = pool.connect();
    await poolConnect;
    try {
      const request = pool.request();
      // query to the database and get the records
      request.query(`select * from [dbo].books`, function(err, recordsets) {
        if (err) {
          console.log(err);
        }
        // send records as a response
        //console.log(recordsets);
        res.setHeader("Content-Type", "application/json");
        res.send(recordsets.recordset);
      });
    } catch (err) {
      console.error("SQL error", err);
    }
  }

  sqlQueryHandler();
});

bookRouter.get("/:id", (req, res) => {
  async function sqlQueryHandler() {
    await poolConnect;
    try {
      const request = pool.request();

      // query to the database and get the records
      request.query(
        `select * from [dbo].books where bookId = '${req.params.id}'`,
        function(err, recordsets) {
          if (err) {
            console.log(err);
          }
          // send records as a response
          res.setHeader("Content-Type", "application/json");
          res.send(JSON.stringify(recordsets.recordset[0]));
        }
      );
    } catch (err) {
      console.error("SQL error", err);
    }
  }
  sqlQueryHandler();
});

module.exports = bookRouter;
