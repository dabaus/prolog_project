var sicstus = require('./sicstus'),
	sources = require('./data');

sources.generateData();

var inst = sicstus.instance();

inst.listen(function(output){
	console.log(output);
});

inst.init();

inst.consult('prolog/main.pro');

inst.state('verb', ['was']);
inst.state('verb', ['wus']);

inst.state('process', ['"The house is red."']);


inst.queryOne('sentence', ['"The house is red."', 'X']);
inst.queryOne('sentence', ['"Is the house red?"', 'X']);