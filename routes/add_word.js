/*
module.exports = {
    addWordPage: (req, res) => {

        //console.log("SELECT * FROM learn_kanji WHERE romaji = " + "'" + req.query.search + "'");
        console.log("here");

        let query = "SELECT * FROM join_all_tables WHERE vocab_list_id = " + "'" + req.query.list + "'"; // query database to get all the players

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('list_detail.ejs', {
                title: "Welcome to Dictionary | View English Words" , list_words: result
            });
        });

    },
};
*/

module.exports = {
    addWordPage: (req, res) => {
        // execute query
        console.log(req.query.list);
        res.render('help.ejs', {
            title: "Welcome to Dictionary | View FAQ"
        });
    },
};
