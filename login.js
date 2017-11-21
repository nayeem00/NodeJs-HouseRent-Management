
var express = require('express');
var router = express.Router();
var db = require('./db');
var expressSession = require('express-session');

var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyParser.json({extended: false}));
router.use(expressSession({secret: 'top secret', resave: false, saveUninitialized: true}));



router.get('/', function(req, res){
	if(req.session.login== true){
		res.redirect('/home');
		return;
	}

		var msg = req.session.message;
		req.session.message = "";
		res.render('login',{"message": msg});
	
	
});


router.post('/', function(req, res){
	
	var username = req.body.username;
	var password = req.body.password;


	var q = "SELECT * FROM user where UserName='"+username+"' and Password='"+password+"'";
    db.getData(q, null, function(result){
  	if(result.length > 0 ){
  		req.session.login = true;
  		req.session.user = result[0];
  		req.session.message = "Welcome "+result[0].FullName;
  		res.redirect('/home');
  	}
  	else
  	{
  		res.render('login',{"message": "invalid username or password"});
  	}
    
  });


	return;

});

module.exports = router;