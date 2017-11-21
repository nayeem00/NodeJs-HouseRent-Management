var path = require('path');
var express = require('express');
var router = express.Router();
var db = require('./db');
var bodyParser = require('body-parser');
var crypto = require('crypto');
var mime = require('mime')
var multer  = require('multer')
var expressValidator = require('express-validator');

var expressSession = require('express-session');
 
 var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, 'public/img/'))
  },
  filename: function (req, file, cb) {
    crypto.pseudoRandomBytes(16, function (err, raw) {
      cb(null, raw.toString('hex') + Date.now() + '.' + mime.extension(file.mimetype));
    });
  }
});
var upload = multer({ storage: storage });

router.use(expressValidator());
router.use(bodyParser.urlencoded({extended: true}));
router.use(bodyParser.json({extended: true}));





router.get('/', function(req, res){
  if(!req.session.login){
    res.redirect('/login');
    return;
  }
  var q = "SELECT * FROM area";
  db.getData(q, null, function(result){
       
       res.render('postad',{ 'message': [{msg:""}], 'area':result });
      
 })
	
});

var temp= [];
router.post('/', upload.single('Image'),function(req, res){
  
	req.check('HouseName', 'HouseName is required').notEmpty();
  req.check('Floor', 'Floor is required').notEmpty();
  req.check('address', 'Address is required').notEmpty();
  req.check('PhoneNo', 'Phone No is required').notEmpty();
  req.check("PhoneNo", "Invalid Phone No").matches(/[0-9]{11}/, "i");
  req.check('rent', 'Rent No is required').notEmpty();
  req.check("rent", "Invalid Rent").matches(/^[0-9]*$/, "i");
  
	var problems = req.validationErrors();

	if(problems)
	{
        var q = "SELECT * FROM area";
      db.getData(q, null, function(result){
           
           
          temp=result;
          
     })
      res.render('postad',{ 'message': problems, 'area':temp });
      return;
		
	}

//data formate
var HouseName = req.body.HouseName;
var Floor = req.body.Floor;
var BedRoom = req.body.BedRoom;

var area = req.body.area;
var address = req.body.address;
var PhoneNo = req.body.PhoneNo;
var additional = req.body.additional;

var rent = req.body.rent;
var rentStatus = req.body.rentStatus;


if(req.body.Kitchen == "Kitchen"){
    var Kitchen = 1;
}
else
{
      var Kitchen = 0;
}

if(req.body.Dining == "Dining"){
    var Dining = 1;
}
else
{
      var Dining = 0;
}

if(req.body.Drawing == "Drawing"){
    var Drawing = 1;
}
else
{
      var Drawing = 0;
}

var catstr="";
         var trim=0;
        for (var i=0;i<req.body.Category.length;i++) {
          if(trim==0){
                       catstr += req.body.Category[i];
                       trim=1;
                  }
                  else
                  {
                    catstr += ","+req.body.Category[i];
                  }
            
           }

var photo = "default.jpg";
if(req.body.filename){
  var photo = req.file.filename;
}
var q = "INSERT INTO `post` (`HouseName`, `Address`, `PhoneNumber`, `Floor`, `BedRoom`, `Kitchen`, `Dining`, `Drawing`, `Additional`, `Category`, `Approval`, `CreatedBy`, `Area`, `Rent`, `RentStatus`, `Image`) VALUES ('"+HouseName+"', '"+address+"', '"+PhoneNo+"', '"+Floor+"', '"+BedRoom+"', '"+Kitchen+"', '"+Dining+"', '"+Drawing+"', '"+additional+"' , '"+catstr+"', '0', '"+req.session.user.UserId+"', '"+area+"', '"+rent+"', '"+rentStatus+"', '"+photo+"')";

  db.getData(q, null, function(result){
  	   
       req.session.message = "Successfully Posted...";
       res.redirect('/home');
  		
  	
    
  });
  return;

});



module.exports = router;