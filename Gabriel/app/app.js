var express = require('express'),
	socket = require('socket.io');

var app = express();

app.use(express.compress()); 					// Compress response for speed
app.use(express.static(__dirname + '/public'));	// Static/public files directory

app.listen(8082);