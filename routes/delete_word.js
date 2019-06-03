module.exports = {
    deleteWordPage: (req, res) => {

        //console.log("SELECT * FROM learn_kanji WHERE romaji = " + "'" + req.query.search + "'");
      //  console.log("DELETE FROM vocab_list_word WHERE kanji_id = " + "'" + req.query.kanji_id + "' AND " + "english_word_id = " + "'" + req.query.english_id + "'" + " AND " + "vocab_list_id = " + "'" + req.query.list + "'");

        let query1 = "DELETE FROM vocab_list_word WHERE kanji_id = " + "'" + req.query.kanji_id + "' AND " + "english_word_id = " + "'" + req.query.english_id + "'" + " AND " + "vocab_list_id = " + "'" + req.query.list + "'";
        let query2 = "SELECT * FROM join_all_tables WHERE vocab_list_id = " + "'" + req.query.list + "'"; // query database to get all the players

        // execute query

        db.query(query1, (err, result) => {
            if (err) {
                res.redirect('/');
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
