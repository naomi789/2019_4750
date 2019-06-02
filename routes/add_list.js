module.exports = {
    addListPage: (req, res) => {

        // execute query
        res.render('add_list.ejs', {
            title: "Welcome to Dictionary | View Add List Page"
        });
    },
};
