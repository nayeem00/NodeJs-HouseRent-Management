
var express = require('express');
var router = express.Router();
var db = require('./db');
var expressSession = require('express-session');

var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyParser.json({extended: false}));
router.use(expressSession({secret: 'top secret', resave: false, saveUninitialized: true}));



router.get('/', function(req, res){
	
	message = req.session.message;
	req.session.message = "";
	res.render('admin');
});


router.post('/', function(req, res){

});

module.exports = router;