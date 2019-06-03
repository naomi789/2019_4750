module.exports = {
    getSearchPage: (req, res) => {

        //let query = "SELECT * FROM join_all_tables WHERE romaji = " + "'" + req.query.search + "'"; // query database to get all the players
        let query = "SELECT * FROM brief_result WHERE keb LIKE " + "'%" + req.query.search + "%' OR gloss_def LIKE " + "'%" + req.query.search + "%'";
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                return res.redirect('/');
            }
            res.render('search.ejs', {
                title: "Welcome to Dictionary | View English Words" , search_results: result
            });
        });
    },
};
