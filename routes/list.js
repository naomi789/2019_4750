
module.exports = {
    getListPage: (req, res) => {
        let query = "SELECT * FROM vocab_list"; // query database to get all the players

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('list.ejs', {
                title: "Welcome to Dictionary | View Vocab List" ,lists: result
            });
        });
    },
};
