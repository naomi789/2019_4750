module.exports = {
    getHelpPage: (req, res) => {

        // execute query
        res.render('help.ejs', {
            title: "Welcome to Dictionary | View FAQ"
        });
    },
};
