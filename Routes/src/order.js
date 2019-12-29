const { pool, poolConnect } = require("./dbConn");
const express = require("express");
const orderRouter = express.Router();
var sql = require("mssql");

/* get the list of NA providers for general use on reports*/
orderRouter.get("/order", (req, res) => {
  async function sqlQueryHandler() {
    await poolConnect;
    try {
      const request = pool.request();
      // query to the database and get the records
      request.query(`select * from [dbo].orderHd`, function(err, recordsets) {
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

orderRouter.post("/order", (req, res) => {
  response = {
    name: req.body.name,
    total: req.body.total
  };

  const itemText = JSON.stringify(req.body.item);

  async function sqlQueryHandler() {
    await poolConnect;
    try {
      const request = pool.request();
      // query to the database and get the records
      request.query(
        `INSERT 
        INTO [coffeenbooks].[dbo].[order]
        VALUES
            (
             '${req.body.name}'
            , ${req.body.subtotal}
            , ${req.body.tax}
            , ${req.body.total}
            , '${itemText}'
            );`,
        function(err) {
          if (err) {
            console.log(err);
          }
          // send records as a response
          res.setHeader("Content-Type", "application/json");
          res.end(JSON.stringify(response));
        }
      );
    } catch (err) {
      console.error("SQL error", err);
    }
  }

  sqlQueryHandler();
});

module.exports = orderRouter;
