const express = require('express');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
const app = express();

const {getHomePage} = require('./routes/index');
const {getListPage} = require('./routes/list');
const {getSearchPage} = require('./routes/search');
const {getDetailPage} = require('./routes/detail');
const {getHelpPage} = require('./routes/help');

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

//configure middleware
app.set('port', process.env.port || port); // set express to use this port
app.set('views', __dirname + '/views'); // set express to look in this folder to render our view
app.set('view engine', 'ejs'); // configure template engine
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json()); // parse form data client
app.use(fileUpload()); // configure fileupload

// routes for the app
app.get('/', getHomePage);
app.get('/new_search',getSearchPage);
app.get('/list', getListPage);
app.get('/search', getSearchPage);
app.get('/detail/:romaji', getDetailPage);
app.get('/help', getHelpPage);


//app.get('/sumbit', searchWordPage);


// set the app to listen on the port
app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});
