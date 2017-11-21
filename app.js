//require
var express = require('express');
var app = express();
var path = require('path');
var Socketio = require('socket.io');
var login = require('./login')
var registration = require('./registration')
var home = require('./home')
var logout = require('./logout')
var db = require('./db');
var postad = require('./postad');
var userAccount = require('./userAccount');
var adminpanel = require('./adminpanel');
var date = require('date-and-time');

var expressSession = require('express-session');

//server
var server = app.listen(1337,function(){
	console.log('Server Started at port 1337');
})
//socket config
var io = Socketio(server);
//config
app.set('view engine', 'ejs');
//middleware
app.use('/', home);
app.use('/registration', registration);
app.use('/login', login);
app.use('/logout', logout);
app.use('/postad', postad);
app.use('/userAccount', userAccount);
app.use('/adminpanel', adminpanel);

app.use(express.static('./public/contents'));
app.use(express.static('./public/scripts'));
app.use(express.static('./public/img'));





io.sockets.on('connection', function(socket){
	console.log('Connected [ID: ' + socket.id + ']');

	socket.on('disconnect', function(){
		
		
	});


		
	socket.on('Posted', function(data){	
		console.log('Connected [ID: bla]');
		 var newdata = {'message':data.msg};
	
       socket.broadcast.emit('incoming data', newdata);
		
	});
});




