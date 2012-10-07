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
	outputString += 'adjective(X) :- comparativeAdjective(_, X).\n';
	outputString += 'adjective(X) :- superlativeAdjective(_, X).\n';
	
	
	for (var i = 0; i < adjectives.length; i++){
		outputString += 'adjective(' + adjectives[i].pos + ').\n';
		if (typeof adjectives[i].com !== 'undefined') {
			outputString += 'comparativeAdjective(' + adjectives[i].com + ').\n';
		}
		if (typeof adjectives[i].sup !== 'undefined') {
			outputString += 'superlativeAdjective(' + adjectives[i].sup + ').\n';
		}
		if (typeof adjectives[i].irr !== 'undefined') {
			if (adjectives[i].irr === true) {
				outputString += 'nonGradableAdjective(' + adjectives[i].pos + ').\n';
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
				outputString += "pluralOf(" + nouns[i].sin + ", " + nouns[i].plu + ").\n";
				outputString += "noun(" + nouns[i].plu + ").\n";
				outputString += "isCountable(" + nouns[i].sin + ").\n";
			}

			if (typeof nouns[i].col !== 'undefined') {
				outputString += "collectiveOf(" + nouns[i].sin + ", " + nouns[i].col + ").\n";
				outputString += "noun(" + nouns[i].col + ").\n";
				outputString += "isCollective(" + nouns[i].col + ").\n";

				if (typeof nouns[i].colp !== 'undefined') {
					outputString += "pluralOf(" + nouns[i].col + ", " + nouns[i].colp + ").\n";
					outputString += "noun(" + nouns[i].colp + ").\n";
					outputString += "isCollective(" + nouns[i].colp + ").\n";
				}			
			}
		}
	}

	return outputString;
}

function processRelationships() {
	var outputString = "";
	for (var i = 0; i < items.length; i++) {
		if (typeof items[i].name !== 'undefined') {
			if (typeof items[i].children !== 'undefined') {
				for (var c = 0; c < items[i].children.length; c++) {
					outputString += 'childOf'
				}
			}
		}
	}
}


console.log(processAdjectives());