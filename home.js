
var express = require('express');
var router = express.Router();
var expressSession = require('express-session');

var bodyParser = require('body-parser');
var db = require('./db');


var Socketio = require('socket.io');


router.use(bodyParser.urlencoded({extended: false}));
router.use(bodyParser.json({extended: false}));
router.use(expressSession({secret: 'top secret', resave: false, saveUninitialized: true}));


router.get('/', function(req, res){
	
	res.redirect('home');
});

router.get('/postdetail/:id', function(req, res){
	var id = req.params.id;
	
	
         var q="SELECT * FROM post JOIN `area` ON `area`.`AreaId` = `post`.`Area` WHERE `PostId` = "+id;
		db.getData(q, null, function(res1){

					  var q="SELECT * FROM commnet JOIN `user` ON `user`.`userId` = `commnet`.`userId` WHERE `postId` = "+id;
			db.getData(q, null, function(result){


				var q="SELECT * FROM post JOIN `area` ON `area`.`AreaId` = `post`.`Area` WHERE AreaName ='"+res1[0].AreaName+"' and Rent<"+res1[0].Rent+" and BedRoom >"+res1[0].BedRoom;
				db.getData(q, null, function(suggesion){
					if( suggesion.length > 0 )
					{
							var s = "You may Also like";
					}else
					{
						var s = "";
					}
							
						  res.render('postdetail',{'post': res1,'comment': result,'suggesion':suggesion,'Stitle': s});
						  return;
				  });


				return;
			  });
			return;
				  
				   
		  });
		
		
		



	
	
	return;
});

router.post('/postdetail/:id', function(req, res){
	if(!req.session.login){
    res.redirect('/login');
    return;
  }
	var q = "INSERT INTO `commnet` (`postId`, `userId`, `Commnet`) VALUES ('"+req.params.id+"', '"+req.session.user.UserId+"', '"+req.body.comment+"')";
	db.getData(q, null, function(result){
		  res.redirect('/postdetail/'+req.params.id);
		  return;
		 });   

	});

router.get('/getSearchResult', function(req, res){
	var regex =req.body.term;

		
		
		var names = [];
		

		var q = "SELECT * FROM area  WHERE AreaName like '%"+regex+"%'";
  db.getData(q, null, function(result){
		  for (var i = 0; i < result.length; i++) {
		    	names.push(result[i].AreaName);
		    }  
		    res.json(names);
  });
		
		return;
});

router.get('/home', function(req, res){
	if(req.session.login== true){
		    var   Status = req.session.user.UserStatus;
			var AccountOptionAction = "";
			var AccountOption="";
			var action = "/logout";
			var label = "LogOut";
			var RegistrationAction = "" ;
			var RegistrationLabel = "" ;
			var username = "("+req.session.user.FullName+")" ;
			var SearchBoxValue = "" ;
			var message = req.session.message;
			req.session.message = "";
			if(req.session.user.UserStatus=="admin"){
				AccountOptionAction = "/adminpanel";
				AccountOption = "Admin Panel";

			}
			else
			{
				AccountOptionAction = "/userAccount";
				AccountOption = "Your Account";
			}
			
	}
	else
	{
		     var   Status = "";
		    var AccountOptionAction = "";
			var AccountOption="";
			var action = "/login";
			var label = "Login";
			var RegistrationAction = "/registration" ;
			var RegistrationLabel = "Registration" ;
			var username = "" ;
			var SearchBoxValue = "" ;
			var message = req.session.message;
	}
	var q = "SELECT * FROM (`post`) JOIN `area` ON `area`.`AreaId` = `post`.`Area` WHERE `Approval` = '1' ORDER BY `postId` desc";
  db.getData(q, null, function(result){
		    var data = {'post': result,
		    'action':action,
		    'label':label,
		    'RegistrationAction':RegistrationAction,
		    'RegistrationLabel':RegistrationLabel,
		    'username': username,
		    'AccountOptionAction':AccountOptionAction,
		    'AccountOption':AccountOption,
		    'SearchBoxValue':SearchBoxValue,
		    'message': message,
		    'Stitle' : "",
		    "suggesion" : [],
		    'Status' : Status
		};
    res.render('home', data);
  });
	
});


router.post('/home', function(req, res){
	if(req.session.login== true){
		var   Status = req.session.user.UserStatus;
			var AccountOptionAction = "";
			var AccountOption="";
			var action = "/logout";
			var label = "LogOut";
			var RegistrationAction = "" ;
			var RegistrationLabel = "" ;
			var username = "("+req.session.user.FullName+")" ;
			var SearchBoxValue = req.body.SearchBox ;
			
			req.session.message = "";
			if(req.session.user.UserStatus=="admin"){
				AccountOptionAction = "/adminpanel";
				AccountOption = "Admin Panel";

			}
			else
			{
				AccountOptionAction = "/userAccount";
				AccountOption = "Your Account";
			}
			
	}
	else
	{
		    var AccountOptionAction = "";
			var AccountOption="";
			var action = "/login";
			var label = "Login";
			var RegistrationAction = "/registration" ;
			var RegistrationLabel = "Registration" ;
			var username = "" ;
			var SearchBoxValue = req.body.SearchBox ;
			var   Status = "";
			
	}


		var SearchBox = req.body.SearchBox;
		var priceRange = req.body.priceRange;
		var RoomNumber = req.body.RoomNumber;
		var Category = req.body.Category;

		var parray = priceRange.split("-");
		
		var q = "INSERT INTO `searchhistory` (`Keyword`, `PriceFilter`, `RoomFilter`, `CategoryFilter`, `Ip`) VALUES ('"+SearchBox+"', '"+priceRange+"', '"+RoomNumber+"', '"+Category+"', '"+req.connection.remoteAddress+"')";
  db.getData(q, null, function(result){
		    
  });


 //  	 var q = "SELECT * FROM (`area`)  WHERE `AreaName` = '"+SearchBox+"'";
	// 	  db.getData(q, null, function(result){
		  	 
	// 	        req.session.SArea = result[0].SurroundingArea;

	// 	  });
 //  res.send(req.session.SArea);
 //  return;
 // var SAreaArray = req.session.SArea.split(",");

 // req.session.suggesion = [];
 // for (var i = 0; i < SAreaArray.length; i++) {
 // 	var q = "SELECT * FROM (`post`) JOIN `area` ON `area`.`AreaId` = `post`.`Area` WHERE `Approval` = '1' and `AreaName` ='"+SAreaArray[i]+"' ORDER BY `postId` desc";
	// 	  db.getData(q, null, function(result){
	// 	  	 for (var j = 0; j < result.length; j++) {
	// 	  	 	req.session.suggesion.push(result[j]);
	// 	  	 }
		        
	// 	  });
 // }
  



	var q = "SELECT * FROM (`post`) JOIN `area` ON `area`.`AreaId` = `post`.`Area` WHERE `Approval` = '1' and  `AreaName` LIKE '%"+SearchBox+"%' and `Rent` >= '"+parray[0]+"' AND `Rent` < '"+parray[1]+"' AND `BedRoom` > '"+RoomNumber+"' AND `Category` LIKE '%"+Category+"%' ORDER BY `postId` desc";
  db.getData(q, null, function(result){
			  	if(result.length > 0){
			  			var message = "";
			  	}
			  	else{
			  			var message = "No Post Found";
			  	}

			  	

		    var data = {'post': result,
		    'action':action,
		    'label':label,
		    'RegistrationAction':RegistrationAction,
		    'RegistrationLabel':RegistrationLabel,
		    'username': username,
		    'AccountOptionAction':AccountOptionAction,
		    'AccountOption':AccountOption,
		    'SearchBoxValue':SearchBoxValue,
		    'message': message,
		    'Stitle' : "",
		    "suggesion" : [],
		    'Status' : Status
		};
    res.render('home', data);
  });
	
});







module.exports = router;