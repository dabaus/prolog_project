var dict = require('./sourceDict'),
	gram = require('./sourceGrammar');

var outputString = '';
outputString += '% Adjectives\n' + dict.genAdjectives() + 
				'% Nouns\n' + dict.genNouns() + 
				'% Verbs\n' + dict.genVerbs() + 
				'% Relationships\n' + dict.genRelationships() +
				'% Grammar\n' + gram.genGrammar();
	
var fs = require('fs');
fs.writeFile("./data.pro", outputString, function(err) {
    if(err) {
        console.log(err);
    } else {
        console.log("The file was saved!");
    }
});