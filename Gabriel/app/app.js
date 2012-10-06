var sicstus = require('./sicstus'),
	express = require('express'),
	http = require('http'),
	app = express(),
	server = http.createServer(app),
	io = require('socket.io').listen(server);
	
app.use(express.compress()); 					// Compress response for speed
app.use(express.static(__dirname + '/public'));	// Static/public files directory

io.set('log level', 1);

io.sockets.on('connection', function(socket){
	inst = sicstus.instance();

	inst.listen(function(consoleOutput){
		socket.emit('console', {line: consoleOutput});
	});

	inst.init();

	socket.on('disconnect', function(){
		inst.kill();
	});

	socket.on('console', function(data) {
		inst.write(data.line);
	});
	
	inst.consult("prolog/main.pl");
	//inst.consult("prolog/test.pl");

	socket.on('chat', function(data) {
		inst.queryOne('sentence', ['"' + data.line + '"', 'RESP'], function(err, resp){
			if (err !== null) {
				console.log('Error: ' + err);
			} else {
				socket.emit('chat', resp);	
			}
		});
	})
});

server.listen(8082);