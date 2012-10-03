var spawn = require('child_process').spawn;
var util = require('util');

// Array help function
Array.prototype.contains = function(elem) {
	var i = this.length;
	while (i--) if (this[i] === elem) return true;
	return false;
}

function Sicstus() {
	var outputListeners = [], // List of console listeners.
		pendingCommands = []; // Commands pending to be written to console.

	var process = null, // Active processtus.exe
			nextCmd = null; // Active command.

	var outBuffer = ""; // Buffered output to be yet written.
		
	var queryModes = ['state', 'queryOne', 'queryAll'],	
		valueLine = new RegExp(/(\w+)\s\=\s(\w*)\s+\?/), // RegExp to match a query
		valueLineEnd = new RegExp(/\?\s+/);	// RegExp to match the end of a query

	/* Create process, listen to output and forward to relevant functions */
	function init() {
		process = spawn('sicstus', ['-i']);

		// Standard err is the standard out for Sicstus in windows
		process.stderr.on('data', function (buffer) {
			outBuffer += buffer.toString();
			evalBuffer();
		});

		// Standard out in case the program goes wrong and outputs where it's 
		// meant to
		process.stdout.on('data', function (buffer) {
			outBuffer += buffer.toString();
			evalBuffer();
		});
	}
	// Evaluate the contents of the buffer as they stream in.
	function evalBuffer() {
		var continueReading = true;

		while (continueReading) {
			var line = '', 
				lineEnd = -1;

			// Match a printed line
			if (outBuffer.indexOf('\n') > -1) {
				lineEnd = outBuffer.indexOf('\n');
				line = outBuffer.substring(0, lineEnd);

				outBuffer = outBuffer.substring(lineEnd + 1, outBuffer.length);
				continueReading = true;

			// Match a query line awaiting input
			} else if (outBuffer.match(valueLine)) {
				var endMatch = outBuffer.match(valueLineEnd);
				lineEnd = outBuffer.indexOf(endMatch);
				line = outBuffer.substring(0, lineEnd + endMatch.length);

				outBuffer = outBuffer.substring(lineEnd + endMatch.length + 1, outBuffer.length);
				continueReading = false;
			}

			// If there is an active command and it's awaiting a response, 
			// send the buffered output to it.
			if (line.length > 0) {
				if (nextCmd != null) {
					if (typeof nextCmd.resp !== 'undefined') {
						nextCmd.resp(line);
					}
					if (nextCmd.done) {
						nextCmd == null;
					}
				}					
				messageListeners(line); // Send output to console listeners.
			} else {
				continueReading = false;
			}
		} 
		
		// If the only remaining content in the buffer is the query prompt,
		// execute the next command in the pending commands queue.
		if (outBuffer === '| ?- ') {
			if (pendingCommands.length > 0) {
				nextCmd = pendingCommands.pop();
				messageListeners(outBuffer+nextCmd.mesg);
				outBuffer = '';
				writeImmediate(nextCmd.mesg);
			}
		}
	}
	/* Kill the process and dispose of all the data */
	function kill() {
		pendingCommands = null;
		outputListeners = null;
		outBuffer = null;
		
		nextCmd = null;
		process.kill('SIGKILL');
	}
	/* Forward console output to relevant listeners */
	function messageListeners(msg) {
		for (var i = 0; i < outputListeners.length; i++) {
			outputListeners[i](msg);
		}
	}
	/* Perform a statement or a query and return relevant data */
	function query(pred, args, mode, callback) {
		// Check if valid query
		if (!queryModes.contains(mode)) {

			throw('Unavailable query mode: ' + mode);
			return;
		} else {
			// Create a queried args object.
			var queriedArgs = {};
			if (['queryOne', 'queryAll'].contains(mode)) {
				var variable = new RegExp(/^[A-Z]\w*/);

				for (var i = 0; i < args.length; i++) {
					if (variable.test(args[i])) {
						queriedArgs[args[i]] = [];
					}
				}
			}

			var query = pred + '(' + args.join(',') + ').'; // Create query
			
			// Prepend to pending commands list.
			pendingCommands.unshift({
				mesg: query,
				done: false,
				resp: function(data) {
					if (data === 'yes\r') { // Response line is 'yes'
						if (typeof callback !== 'undefined') {
							if (mode === 'state') {
								callback(null, true);
							} else {
								callback(null, queriedArgs);
							}
						}
						this.done == true;
					} else if (data === 'no\r') { // Response line is 'no'
						if (typeof callback !== 'undefined') {
							if (mode === 'state') {
								callback(null, false);
							} else {
								callback(null, queriedArgs);
							}
						}
						this.done == true;
					} else if (data.indexOf('!') == 0) {
						if (typeof this.errMsg === 'undefined') {
							this.errMsg = data.substring(2, data.length - 1);
							this.done = false;
						} else {
							this.errMsg += '; ' + data.substring(2, data.length - 1);
							if (data.indexOf('goal:') > 0) {
								this.done = true;
								if (typeof callback !== 'undefined') {
									callback({errMsg: this.errMsg}, null);
								}
							}
						}
					} else if (data.indexOf('%') == 0 && mode === queryModes[0]) {
						//console feedback, do nothing 
					} else if (data.match(valueLine)){
						var matches = data.match(valueLine);
						queriedArgs[matches[1]].push(matches[2]);

						if (mode === queryModes[1]){ // queryOne
							writeImmediate('y');
						} else if (mode === queryModes[2]) { // queryAll
							writeImmediate('n');
						}

						this.done = false;
					} else {
						console.error('Unmatched line: ' + data);
					}
				}
			});
		}

		evalBuffer();
	}
	/* Helper function to consult files in shorthand */
	function consult(file, callback) {
		state('consult', ["'"+file+"'"], function(err, data){
			if (typeof callback !== 'undefined') {
				callback(err, data);
			}
		});
	}
	/* Help functions */
	function state(pred, args, callback) {
		query(pred, args, queryModes[0], callback);
	}
	function queryOne(pred, args, callback) {
		query(pred, args, queryModes[1], callback);
	}
	function queryAll(pred, args, callback) {
		query(pred, args, queryModes[2], callback);
	}
	function listen(listener) {
		outputListeners.push(listener);
	}
	function writeImmediate(input) {
		process.stdin.write(input + '\n');
	}
	function write(input) {
		pendingCommands.unshift({
			mesg: input,
			done: true
		});

		evalBuffer();
	}
	return {
		init: init,
		kill: kill,
		consult: consult,
		state: state,
		queryOne: queryOne,
		queryAll: queryAll,
		listen: listen,
		write: write
	}
}

exports.instance = Sicstus;

