var path = require('path');
var express = require('express');
var router = express.Router();
var db = require('./db');
var bodyParser = require('body-parser');
var expressValidator = require('express-validator');

var expressSession = require('express-session');
router.use(expressSession({secret: 'top secret', resave: false, saveUninitialized: true}));

 

router.use(expressValidator());
router.use(bodyParser.urlencoded({extended: true}));
router.use(bodyParser.json({extended: true}));

router.get('/', function(req, res){
  if(req.session.login== true){
    res.redirect('/home');
  }
	res.render('registration',{'errors':null});
});


router.post('/',function(req, res){
	req.check('username', 'UserName is required').notEmpty();
  req.check('FullName', 'FullName is required').notEmpty();
  req.check('password', 'Password is required').notEmpty();
  req.check('PhoneNo', 'Phone No is required').notEmpty();
  req.check("PhoneNo", "Invalid Phone No").matches(/[0-9]{11}/, "i");
  req.check('Repassword', 'Passwords do not match').equals(req.body.password);

	var problems = req.validationErrors();

	if(problems)
	{
		res.render('registration', {'errors': problems});
    return;
	}

var Username = req.body.username;
var FullName = req.body.FullName;
var Password = req.body.password;
var PhoneNo = req.body.PhoneNo;

var q = "INSERT INTO `user`( `UserName`, `Password`, `FullName`, `PhoneNo`, `UserStatus`) VALUES ('"+Username+"','"+Password+"','"+FullName+"','"+PhoneNo+"','user')";
  db.getData(q, null, function(result){
  	   
       req.session.message = "Registration Successfull...Please Login";
       res.redirect('/login');
  		
  	
    
  });
  return;

});



module.exports = router;