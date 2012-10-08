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

inst.queryOne('get_statement_subject', ['[the, blue, house, is, red]', 'X']);