module.exports = {
    addWordPage: (req, res) => {

        let query1 = "INSERT IGNORE INTO list_word VALUES ('" + req.query.ent_seq + "', '" + req.query.list_name + "')";
        //console.log(req.query.ent_seq);
        let query2 = "SELECT * FROM words_in_lists WHERE list_name = " + "'" + req.query.list_name + "'"; // query database to get all the players

        // execute query

        db.query(query1, (err, result) => {
            if (err) {
                return res.redirect('/');
            }
            //console.log(result[2]);

        });

        db.query(query2, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('list_detail.ejs', {
                title: "Welcome to Dictionary | View English Words" , list_words: result
            });
        });

    },
};
