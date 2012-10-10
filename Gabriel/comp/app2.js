var sicstus = require('./sicstus'),
	sources = require('./data');

sources.generateData();

var inst = sicstus.instance();

inst.listen(function(output){
	//console.log(output);
});

inst.init();

inst.consult('prolog/main.pro');

//	inst.queryOne('sentence', ['"the house has animals"', 'X']);

var queries = ['"the blue house is big"', '"the orange is sweet"', '"the cat has two eyes."'];

for (var i = 0; i < queries.length; i++) {
	console.log("Querying: " + queries[i]);
	inst.queryOne('sentence', [queries[i], 'X'], function(err, res){
		console.log("Error: " + err);
		console.log("Response: " + res.X);
	});
}

var isQueries = ['orange', 'cat']
for (var i = 0; i < isQueries.length; i++) {
	console.log("Asking about a: " + isQueries[i]);
	inst.queryAll('is_a', [isQueries[i], 'X'], function(err, resp){
		console.log("Error: " + err);
		console.log("Response: " + resp.X);
	});
}

for (var i = 0; i < isQueries.length; i++) {
	console.log("Asking about a: " + isQueries[i]);
	inst.queryAll('attr', [isQueries[i], 'X'], function(err, resp){
		console.log("Error: " + err);
		console.log("Response: " + resp.X);
	});
}


