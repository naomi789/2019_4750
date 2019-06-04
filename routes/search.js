module.exports = {
    getSearchPage: (req, res) => {
                
        var regex = /[\u3000-\u303F]|[\u3040-\u309F]|[\u30A0-\u30FF]|[\uFF00-\uFFEF]|[\u4E00-\u9FAF]|[\u2605-\u2606]|[\u2190-\u2195]|\u203B/g; 
        var 
        if(regex.test(req.query.search)) {
            console.log("SELECT * FROM brief_result WHERE keb LIKE '" + req.query.search + "%' OR reb LIKE '" + req.query.search + "%'");   
            let query = "SELECT * FROM brief_result WHERE keb LIKE '" + req.query.search + "%' OR reb LIKE '" + req.query.search + "%'";
        }
        else {
            
            console.log("SELECT * FROM brief_result WHERE gloss_def LIKE '" + req.query.search + "%'");
            let query = "SELECT * FROM brief_result WHERE gloss_def LIKE '" + req.query.search + "%'";
        }


       //let query = "SELECT * FROM brief_result WHERE keb LIKE '" + req.query.search + "%' OR gloss_def LIKE '" + req.query.search + "%' OR reb LIKE '" + req.query.search + "%'";
        // execute query
        db.query(query, (err, result) => {
            if (err) {
                return res.redirect('/');
            }
            res.render('search.ejs', {
                title: "Welcome to Dictionary | View English Words" , search_results: result
            });
        });
    },
};
