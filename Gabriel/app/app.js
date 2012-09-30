var sicstus = require('./sicstus'),
	express = require('express'),
	http = require('http'),
	app = express(),
	server = http.createServer(app),
	io = require('socket.io').listen(server);
	
app.use(express.compress()); 					// Compress response for speed
app.use(express.static(__dirname + '/public'));	// Static/public files directory

io.sockets.on('connection', function(socket){
	inst = sicstus.instance();

	inst.listen(function(consoleOutput){
		socket.emit('console', {line: consoleOutput});
		console.log(consoleOutput);
	});

	inst.init();

	socket.on('disconnect', function(){
		console.log('Killing sicstus');
		inst.kill();
	});

	socket.on('console', function(data) {
		console.log('Wrinting raw: ' + data.line);
		inst.write(data.line);
	});

	socket.on('chat', function(data) {
		console.log('Querying sentence: ' + data.line);
		inst.queryOne('sentence', [data.line, 'RESP'], function(err, resp){
			if (err !== null) {
				socket.emit('chat', resp);	
			} else {
				console.log('Error: ' + err);
			}
		});
	})
	

});

server.listen(8082);