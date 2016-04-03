var express = require('express');
var app = require('express')();
var server = require('http').Server(app);
var io = require('socket.io')(server);
server.listen(4210);
app.use(express.static('public'));

var listOfitems = ["chair",
"pencil",
"pen",
"bottle",
"tree",
"computer",
"bagel",
"cup"];

io.on('connection', function(socket){
  	console.log('a user connected');
  	socket.emit('itemToHunt', listOfitems[3]);


  	socket.on('itemFound', function() {
  		socket.emit('huntIsOver');
  	});

});
