var dict = require('./source/sourceDict'),
	gram = require('./source/sourceGrammar'),
	fs = require('fs');

function generate() {
	var outputString = '';
	outputString += '% Adjectives\n' + dict.genAdjectives() + 
					'% Nouns\n' + dict.genNouns() + 
					'% Verbs\n' + dict.genVerbs() + 
					'% Relationships\n' + dict.genRelationships() +
					'% Grammar\n' + gram.genGrammar();
		
	fs.writeFile("prolog/data/data.pro", outputString, function(err) {
	    if(err) {
	        console.log(err);
	    } else {
	        console.log("Generated data file.");
	    }
	});
}

exports.generateData = generate;

