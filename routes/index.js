module.exports = {
    getHomePage: (req, res) => {
      res.render('index.ejs', {
          title: "Welcome to Dictionary | "
      });
      /*
        let query = "SELECT * FROM english_word"; // query database to get all the players

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('index.ejs', {
                title: "Welcome to Dictionary | View English Words" ,english: result
            });
        });*/
    },
};
