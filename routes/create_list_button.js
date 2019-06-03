module.exports = {
    listCreateButtonPage: (req, res) => {

        //console.log("INSERT INTO vocab_list VALUES (" + ", " + "'" + req.query.listName + "')");
        //let query = "SELECT * FROM learn_kanji WHERE romaji = " + "'" + req.query.search + "'"; // query database to get all the players
        let query1 = "INSERT INTO vocab_list VALUES (1235" + ", " + "'" + req.query.listName + "')";
        //INSERT INTO vocab_list VALUES (3333, 'test');
        let query2 = "SELECT * FROM vocab_list";
        // execute query

        db.query(query1, (err, result) => {
            if (err) {
                return res.redirect('/');
            }
            //console.log(result[2]);

        });

        // execute query
        db.query(query2, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('list.ejs', {
                title: "Welcome to Dictionary | View English Words" , lists: result
            });
        });
    },
};
