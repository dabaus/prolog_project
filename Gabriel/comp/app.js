var sicstus = require('./sicstus'),
	sources = require('./data');

sources.generateData();

var inst = sicstus.instance();

inst.listen(function(output){
	console.log(output);
});

inst.init();

inst.consult('prolog/main.pro');

inst.queryOne('sentence', ['"the house is big"', 'X']);