module.exports = {
    addWordPage: (req, res) => {

        //console.log("SELECT * FROM learn_kanji WHERE romaji = " + "'" + req.query.search + "'");
        console.log("INSERT INTO vocab_list_word VALUES (" + req.query.kanji_id + "," + req.query.english_id + "," + req.query.list + ")");

        let query1 = "INSERT INTO vocab_list_word VALUES (" + req.query.kanji_id + "," + req.query.english_id + "," + req.query.list + ")";
        let query2 = "SELECT * FROM join_all_tables WHERE vocab_list_id = " + "'" + req.query.list + "'"; // query database to get all the players

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
