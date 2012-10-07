var nouns = [
	{ sin: 'thing', plu: 'things', abs: false},
	{ sin: 'organism', plu: 'organisms', abs: false},
	{ sin: 'prokaryote', plu: 'prokaryotes', abs: false},
	{ sin: 'eukaryote', plu: 'eukaryotes', abs: false},
	{ sin: 'bacterium', plu: 'bacteria', abs: false},
	{ sin: 'archaeon', plu: 'archaea', abs: false},
	{ sin: 'protist', plu: 'protists', abs: false},
	{ sin: 'plant', plu: 'plants', abs: false},
	{ sin: 'fungus', plu: 'fungi', abs: false},
	{ sin: 'animal', plu: 'animals', abs: false},
	{ sin: 'air'}
]

var adjectives = [
	{ pos: 'angry', com: 'angrier', sup: 'angriest'},
	{ pos: 'big', com: 'bigger', sup: 'biggest'},
	{ pos: 'blue', com: 'bluer', sup: 'bluest'},
	{ pos: 'bright', com: 'brighter', sup: 'brightest'},
	{ pos: 'cold', com: 'colder', sup: 'coldest'},
	{ pos: 'colorful', irr: true},
	{ pos: 'cool', com: 'cooler', sup: 'coolest'},
	{ pos: 'crazy', com: 'crazier', sup: 'craziest'},
	{ pos: 'dark', com: 'darker', sup: 'darkest'},
	{ pos: 'green', com: 'greener', sup: 'greenest'},
	{ pos: 'happy', com: 'happier', sup: 'happiest'},
	{ pos: 'hard', com: 'harder', sup: 'hardest'},
	{ pos: 'heavy', com: 'heavier', sup: 'heaviest'},
	{ pos: 'hot', com: 'hotter', sup: 'hottest'},
	{ pos: 'large', com: 'larger', sup: 'largest'},
	{ pos: 'light', com: 'lighter', sup: 'lightest'},
	{ pos: 'loud', com: 'louder', sup: 'loudest'},
	{ pos: 'orange', com: 'oranger', sup: 'orangest'},
	{ pos: 'quiet', com: 'quieter', sup: 'quietest'},
	{ pos: 'red', com: 'redder', sup: 'reddest'},
	{ pos: 'sad', com: 'sadder', sup: 'saddest'},
	{ pos: 'shiny', com: 'shinier', sup: 'shiniest'},
	{ pos: 'small', com: 'smaller', sup: 'smallest'},
	{ pos: 'smelly', com: 'smellier', sup: 'smelliest'},
	{ pos: 'soft', com: 'softer', sup: 'softest'},
	{ pos: 'strong', com: 'stronger', sup: 'strongest'},
	{ pos: 'tiny', com: 'tinier', sup: 'tiniest'},
	{ pos: 'warm', com: 'warmer', sup: 'warmest'},
	{ pos: 'weak', com: 'weaker', sup: 'weakest'},
	{ pos: 'yellow', com: 'yellower', sup: 'yellowest'},
	{ pos: 'fast', com: 'faster', sup: 'fastest'},
	{ pos: 'slow', com: 'slower', sup: 'slowest'},
	{ pos: 'low', com: 'lower', sup: 'lowest'},
	{ pos: 'high', com: 'higher', sup: 'highest'},
	{ pos: 'tall', com: 'taller', sup: 'tallest'},
	{ pos: 'young', com: 'younger', sup: 'youngest'},
	{ pos: 'old', com: 'older', sup: 'oldest'}
]

var verbs = [
	{
		name: 'be',
		pres: ['am', 'are', 'is', 'are', 'are', 'are'],
		past: ['was', 'were', 'was', 'were', 'were', 'were'],
		transitive: true,
		intransitive: true
	},
	{
		name: 'have',
		pres: ['have', 'have', 'has', 'have', 'have', 'have'],
		past: ['had', 'had', 'had', 'had', 'had', 'had'],
		transitive: true,
		intransitive: true
	}
]

items = [
	{
		name: 'thing',
		children: ['organism'],
	},
	{
		name: 'organism',
		children: ['prokaryote', 'eukaryote']
	},
	{
		name: 'prokaryote',
		children: ['bacterium', 'archaeon'],
	},
	{
		name: 'eukaryote',
		children: ['protist', 'plant', 'fungus', 'animal'],
	}
];

function processAdjectives() {
	var outputString = '';
	outputString += 'adjective(X) :- comparative_adjective(_, X).\n';
	outputString += 'adjective(X) :- superlative_adjective(_, X).\n';
	
	
	for (var i = 0; i < adjectives.length; i++){
		outputString += 'adjective(' + adjectives[i].pos + ').\n';
		if (typeof adjectives[i].com !== 'undefined') {
			outputString += 'comparative_adjective(' + adjectives[i].com + ').\n';
		}
		if (typeof adjectives[i].sup !== 'undefined') {
			outputString += 'superlative_adjective(' + adjectives[i].sup + ').\n';
		}
		if (typeof adjectives[i].irr !== 'undefined') {
			if (adjectives[i].irr === true) {
				outputString += 'non_gradable_adjective(' + adjectives[i].pos + ').\n';
			}
		}
	}
	return outputString;
}

function processVerbs() {
	var outputString = '';
	
	for (var i = 0; i < verbs.length; i++){
		var a = verbs[i].pres;
		var b = verbs[i].past;
		outputString += 'verb(' + verbs[i].name + ', conj(' + a.join(', ') + ', ' + b.join(', ') + ')).\n';
		if (typeof verbs[i].transitive !== 'undefined'){
				if (verbs[i].transitive === true){
					outputString += 'transitive_verb(' + verbs[i].name + ').\n';
				}
		}
		if (typeof verbs[i].intransitive !== 'undefined'){
				if (verbs[i].intransitive === true){
					outputString += 'intransitive_verb(' + verbs[i].name + ').\n';
				}
		}
	}
	return outputString;
}
			

function processNouns() {
	var outputString = '';
	for (var i = 0; i < nouns.length; i++) {
		if (typeof nouns[i].sin !== 'undefined') {
			outputString += "noun(" + nouns[i].sin + ").\n";
			if (typeof nouns[i].plu !== 'undefined') {
				outputString += "plural_of(" + nouns[i].sin + ", " + nouns[i].plu + ").\n";
				outputString += "noun(" + nouns[i].plu + ").\n";
				outputString += "is_countable(" + nouns[i].sin + ").\n";
			}

			if (typeof nouns[i].col !== 'undefined') {
				outputString += "collective_of(" + nouns[i].sin + ", " + nouns[i].col + ").\n";
				outputString += "noun(" + nouns[i].col + ").\n";
				outputString += "is_collective(" + nouns[i].col + ").\n";

				if (typeof nouns[i].colp !== 'undefined') {
					outputString += "plural_of(" + nouns[i].col + ", " + nouns[i].colp + ").\n";
					outputString += "noun(" + nouns[i].colp + ").\n";
					outputString += "is_collective(" + nouns[i].colp + ").\n";
				}			
			}
		}
	}

	return outputString;
}

function processRelationships() {
	var outputString = '';
	for (var i = 0; i < items.length; i++) {
		if (typeof items[i].name !== 'undefined') {
			if (typeof items[i].children !== 'undefined') {
				for (var c = 0; c < items[i].children.length; c++) {
					outputString += 'child_of('+ items[i].children[c] + ', ' + items[i].name +').\n';
				}
			}
		}
	}
	return outputString;
}

exports.genAdjectives = processAdjectives;
exports.genNouns = processNouns;
exports.genRelationships = processRelationships;
exports.genVerbs = processVerbs;