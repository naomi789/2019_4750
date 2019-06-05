module.exports = {
    getListDetailPage: (req, res) => {
        //console.log("SELECT list_name, list_description, keb, reb, gloss_def, is_foreign, orig_lang, orig_word, waseieigo, pos_type FROM words_in_lists WHERE list_name = " + "'" + req.query.list_name + "'");
        let query = "SELECT JMdict.keb, JMdict.reb, gloss.gloss_def, pos.pos_type, list.list_name, list.list_description FROM words_in_lists WHERE list_name = " + "'" + req.params.list_name + "'"; // query database to get all the players

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                return res.redirect('/');
            }
            res.render('list_detail.ejs', {
                title: "Welcome to Dictionary | View List Details" ,list_words: result
            });
        });
    },
};
