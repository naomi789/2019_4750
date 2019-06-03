module.exports = {

    getDeletePage: (req, res) => {
        //console.log("DELETE FROM vocab_list_word WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "';" + "DELETE FROM vocab_list WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "';" + "SELECT * FROM vocab_list");
      //let query = "DELETE FROM vocab_list_word WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "'; " + "DELETE FROM vocab_list WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "'; " + "SELECT * FROM vocab_list";
        let query1 = "DELETE FROM vocab_list_word WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "'";
        let query2 = "DELETE FROM vocab_list WHERE vocab_list_id = " + "'" + req.params.vocab_list_id + "'";
        let query3 = "SELECT * FROM vocab_list";
        //let query = "SELECT * FROM vocab_list";

      //  let query = query1 + query2 + query3;

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
            //console.log(result[2]);

        });
        db.query(query3, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            //console.log(result[2]);
            res.render('list.ejs', {
                title: "Welcome to Dictionary | View List Detail" ,lists: result
            });
        });
    },
};
