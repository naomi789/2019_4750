const express = require('express');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
const app = express();

// const {getHomePage} = require('./routes/index');
// const {addPlayerPage, addPlayer, deletePlayer, editPlayer, editPlayerPage} = require('./routes/player');
const port = 5000;

//create connection
const db = mysql.createConnection({
  host: "localhost",
  user: "data",
  password: "password",
  database: "main_db"

});

// connect to database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to database');
});
global.db = db;

// set the app to listen on the port
app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});
