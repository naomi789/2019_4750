module.exports = {
    deleteWordPage: (req, res) => {

        let query1 = "DELETE FROM list_word WHERE ent_seq = " + "'" + req.query.ent_seq + "' AND " + "list_name = " + "'" + req.query.list_name + "'";

          let query2 = "SELECT * FROM words_in_lists WHERE list_name = " + "'" + req.query.list_name + "'";

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
