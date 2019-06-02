module.exports = {

    getDetailPage: (req, res) => {

        //console.log(req.params);
        let query = "SELECT * FROM join_all_tables WHERE romaji = " + "'" + req.params.romaji + "'";

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('detail.ejs', {
                title: "Welcome to Dictionary | View English Words Detail" , detail_results: result,message:''
            });
        });
    },
};
