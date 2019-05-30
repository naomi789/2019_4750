var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "data",
  password: "password"

});

con.connect(function(err) {
  if (err) throw err;
  con.query("USE main_db", function (err, result, fields) {
    if (err) throw err;
    console.log("Correct");
  });
  con.query("SELECT * FROM english_word", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});
