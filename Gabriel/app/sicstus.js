var spawn = require('child_process').spawn;
var util = require('util');

function Sicstus() {
	var outputListeners = [],
		pendingCommands = [],
		outBuffer = "";
	
	var process = null;

	function init() {
		process = spawn('sicstus', ['-i']);

		function evalBuffer() {
			var foundNewline = true;
			
			while (foundNewline) {
				if (outBuffer.indexOf('\n') > -1) {
					foundNewline = true;

					var stringPos = outBuffer.indexOf('\n');
					var line = outBuffer.substring(0, stringPos);
					outBuffer = outBuffer.substring(stringPos+1, outBuffer.length);
					for (var i = 0; i < outputListeners.length; i++) {
						outputListeners[i](line);
					}
				} else {
					foundNewline = false;
				}
			}

			if (outBuffer === '| ?- ') {
				if (pendingCommands.length > 0) {
					var nextCommand = pendingCommands.pop();
					nextCommand.func();
				}
			}
		}

		process.stderr.on('data', function (buffer) {
			outBuffer += buffer.toString();
			evalBuffer();
		});

		process.stdout.on('data', function (buffer) {
			outBuffer += buffer.toString();
			evalBuffer();
		});
	};
	function consult(file, callback) {
		state('consult', ["'"+file+"'"], function(data){
			callback(data);
		});
	};
	function state(pred, args, callback) {
		var msg = pred + '(' + args.join(',') + ').';
		pendingCommands.unshift({
			func: function(){
				write(msg);
			},
			resp: function(data) {
				callback(data);
			}
		});
	};
	function listen(listener) {
		outputListeners.push(listener);
	};
	function write(data) {
		console.log('--> ' + data);
		process.stdin.write(data + '\n');
	};
	return {
		init: init,
		consult: consult,
		state: state,
		listen: listen,
		write: write
	}
}

var prol = new Sicstus();
prol.init();
prol.consult('test.pl');
prol.state('honk', ['donkey']);
prol.state('honk', ['toni']);
prol.listen(function(line){
	console.log(line);
});
