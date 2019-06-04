module.exports = {

    getDetailPage: (req, res) => {
        
        //console.log(req.params);
        let query = "SELECT is_foreign, orig_lang, orig_word, waseieigo, pos_type FROM word_detail WHERE ent_seq = " + "'" + req.query.ent_seq + "' AND gloss_ID = '"
        + req.query.gloss_ID + "'";

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                return res.redirect('/');
            }
            res.render('detail.ejs', {
                title: "Welcome to Dictionary | View English Words Detail" , detail_results: result,message:''
            });
        });
    },
};

