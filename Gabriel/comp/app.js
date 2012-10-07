var sicstus = require('./sicstus');

var inst = sicstus.instance();

inst.listen(function(output){
	console.log(output);
});

inst.init();

inst.consult('prolog/main.pro');

inst.queryOne('sentence', ['"The house is red."', 'X']);
inst.queryOne('sentence', ['"Is the house red?"', 'X']);