module.exports = {
    getDeletePage: (req, res) => {
        console.log("DELETE FROM vocab_list_word WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "';" + "DELETE FROM vocab_list WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "';" + "SELECT * FROM vocab_list");
        let query = "DELETE FROM vocab_list_word WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "'; " + "DELETE FROM vocab_list WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "'; " + "SELECT * FROM vocab_list";
        //let query = "SELECT * FROM vocab_list";

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('list.ejs', {
                title: "Welcome to Dictionary | View List Detail" ,lists: result
            });
        });
    },
};
