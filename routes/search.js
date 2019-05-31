module.exports = {
    getSearchPage: (req, res) => {
        
        let query = "SELECT * FROM learn_kanji WHERE romaji = " + "'" + req.query.search + "'"; // query database to get all the players

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('search.ejs', {
                title: "Welcome to Dictionary | View English Words" , search_results: result
            });
        });
    },
};
