
var express = require('express');
var router = express.Router();

var expressSession = require('express-session');




router.use(expressSession({secret: 'top secret', resave: false, saveUninitialized: true}));

router.get('/', function(req, res){

  	req.session.login = false;
	res.redirect('/home');

});

module.exports = router;