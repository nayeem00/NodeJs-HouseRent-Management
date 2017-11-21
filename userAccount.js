
var express = require('express');
var router = express.Router();
var db = require('./db');
var expressSession = require('express-session');

var bodyParser = require('body-parser');

router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyParser.json({extended: false}));
router.use(expressSession({secret: 'top secret', resave: false, saveUninitialized: true}));



router.get('/', function(req, res){
	if(!req.session.login){
    res.redirect('/login');
    return;
  }
  else
  {
  	if(req.session.user.UserStatus != "user"){
  		res.redirect('/login');
       return;
  	}
  }
	message = req.session.message;
	req.session.message = "";
	var q = "SELECT * FROM (`post`) JOIN `area` ON `area`.`AreaId` = `post`.`Area` WHERE `CreatedBy` = '"+req.session.user.UserId+"' and HireStatus = '0' ORDER BY `postId` desc";
  db.getData(q, null, function(result){


  	var q = "SELECT * FROM (`post`) JOIN `area` ON `area`.`AreaId` = `post`.`Area` WHERE `CreatedBy` = '"+req.session.user.UserId+"' and HireStatus = '1' ORDER BY `postId` desc";
  db.getData(q, null, function(result2){
		    var data = {'post': result,
		    'posti' : result2,
		    'message': message,
		    
		};
	res.render('user',data);
	});
});

  });


router.get('/deletePost/:id', function(req, res){
	var q = "DELETE FROM `post` WHERE `PostId` = '"+req.params.id+"'";
  db.getData(q, null, function(result){
		    
		    
		});
		req.session.message = "Post Deleted";
		res.redirect('/userAccount');

});
router.get('/ActivePost/:id', function(req, res){
	var q = "UPDATE `post` SET `HireStatus` = '0', `UpdatedDate` = '2017-05-03 07:52:46' WHERE `PostId` = '"+req.params.id+"'";
  db.getData(q, null, function(result){
		    
		    
		});
		req.session.message = "Post Activated";
		res.redirect('/userAccount');

});
router.get('/DisablePost/:id', function(req, res){
	var q = "UPDATE `post` SET `HireStatus` = '1', `UpdatedDate` = '2017-05-03 07:52:46' WHERE `PostId` = '"+req.params.id+"'";
  db.getData(q, null, function(result){
		    
		    
		});
		req.session.message = "Post Deactivated";
		res.redirect('/userAccount');

});

module.exports = router;