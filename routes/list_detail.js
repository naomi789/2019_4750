module.exports = {
    getListDetailPage: (req, res) => {
        let query = "SELECT * FROM vocab_list WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "'"; // query database to get all the players

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('list_detail.ejs', {
                title: "Welcome to Dictionary | View List Detail" ,list_words: result
            });
        });
    },
};
