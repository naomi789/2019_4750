module.exports = {
    getSearchPage: (req, res) => {

        let query = "SELECT * FROM learn_kanji WHERE romaji LIKE " + "%" + req.query.search + "%";
        // query(err, rows, fields)
        //   if (err) throw err;
        //   var data=[];
        //   for(i=0;i<rows.length;i++)
        //   {
        //     data.push(rows[i].romaji);
        //   }
        //   res.end(JSON.stringify(data));
        // }
        // execute query ***
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('search.ejs', {
                title: "Welcome to Dictionary | View English Words" , search_results: result
            });
        });
      }
};
