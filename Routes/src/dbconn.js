const mssql = require("mssql");

const pool = new mssql.ConnectionPool({
  user: "coffeenbooksapi",
  password: "coffeenbooks",
  server: "localhost",
  database: "coffeenbooks"
});

const poolConnect = pool.connect();

async function sqlQueryHandler() {
  await poolConnect;
  try {
    console.log("Connection succesfull");
  } catch (err) {
    console.error("SQL error", err);
  }
}

sqlQueryHandler();

module.exports = { pool, poolConnect };

/*var pool  = mysql.createPool({
  connectionLimit : 10,
  host            : 'example.org',
  user            : 'bobby',
  password        : 'pass',
  database        : 'schema'
});
*/
