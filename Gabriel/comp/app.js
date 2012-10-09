var sicstus = require('./sicstus'),
	sources = require('./data');

sources.generateData();

var inst = sicstus.instance();

inst.listen(function(output){
	console.log(output);
});

inst.init();

inst.consult('prolog/main.pro');

//	inst.queryOne('sentence', ['"the house has animals"', 'X']);

inst.queryOne('sentence', ['"the blue house is big"', 'X'], function(err, res){
	console.log("Error: " + err);
	console.log("Response: " + res.X);
});

inst.queryOne('sentence', ['"the blue house is a home"', 'X'], function(err, res){
	console.log("Error: " + err);
	console.log("Response: " + res.X);
});