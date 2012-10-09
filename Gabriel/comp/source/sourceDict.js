var nouns = [
	{ sin: 'air', abs: true},
	{ sin: 'anger', abs: true},
	{ sin: 'animal', plu: 'animals', abs: false},
	{ sin: 'apple', plu: 'apples', abs: false},
	{ sin: 'archaeon', plu: 'archaea', abs: false},
	{ sin: 'arm', plu: 'arms', abs: false},
	{ sin: 'bacterium', plu: 'bacteria', abs: false},
	{ sin: 'bear', plu: 'bears', abs: false},
	{ sin: 'bell', plu: 'bells', abs: false},
	{ sin: 'berry', plu: 'berries', abs: false},
	{ sin: 'bird', plu: 'birds', abs: false},
	{ sin: 'boat', plu: 'boats', abs: false},
	{ sin: 'book', plu: 'books', abs: false},
	{ sin: 'box', plu: 'boxes', abs: false},
	{ sin: 'boy', plu: 'boys', abs: false},
	{ sin: 'captain', plu: 'captains', abs: false},
	{ sin: 'car', plu: 'cars', abs: false},
	{ sin: 'case', plu: 'cases', abs: false},
	{ sin: 'cat', plu: 'cats', col:'clowder', abs: false},
	{ sin: 'century', plu: 'centuries', abs: true},
	{ sin: 'chair', plu: 'chairs', abs: false},
	{ sin: 'chest', plu: 'chests', abs: false},
	{ sin: 'chicken', plu: 'chickens', abs: false},
	{ sin: 'child', plu: 'children', abs: false},
	{ sin: 'company', plu: 'companies', abs: false},
	{ sin: 'computer', plu: 'computers', abs: false},
	{ sin: 'cow', plu: 'cows', cal:'herd', abs: false},
	{ sin: 'day', plu: 'days', abs: true},
	{ sin: 'dog', plu: 'dogs', abs: false},
	{ sin: 'duck', plu: 'ducks', col:'flock', abs: false},
	{ sin: 'ear', plu: 'ears', abs: false},
	{ sin: 'elephant', plu: 'elephants', abs: false},
	{ sin: 'eukaryote', plu: 'eukaryotes', abs: false},
	{ sin: 'eye', plu: 'eys', abs: false},
	{ sin: 'face', plu: 'faces', abs: false},
	{ sin: 'fact', plu: 'facts', abs: false},
	{ sin: 'fruit', plu: 'fruits', abs: false},
	{ sin: 'fungus', plu: 'fungi', abs: false},
	{ sin: 'giraffe', plu: 'giraffes', abs: false},
	{ sin: 'girl', plu: 'girls', abs: false},
	{ sin: 'government', plu: 'governments', abs: false},
	{ sin: 'group', plu: 'groups', abs: false},
	{ sin: 'hand', plu: 'hands', abs: false},
	{ sin: 'hate', abs: true},
	{ sin: 'head', plu: 'heads', abs: false},
	{ sin: 'heart', plu: 'hearts', abs: false},
	{ sin: 'hen', plu: 'hens', abs: false},
	{ sin: 'home', plu: 'homes', abs: false},
	{ sin: 'horse', plu: 'horses', abs: false},
	{ sin: 'house', plu: 'houses', abs: false},
	{ sin: 'leg', plu: 'legs', abs: false},
	{ sin: 'life', plu: 'lives', abs: false},
	{ sin: 'love', abs: true},
	{ sin: 'man', plu: 'men', abs: false},
	{ sin: 'mink', plu: 'minks', abs: false},
	{ sin: 'month', plu: 'months', abs: true},
	{ sin: 'mouth', plu: 'mouths', abs: false},
	{ sin: 'nose', plu: 'noses', abs: false},
	{ sin: 'number', plu: 'numbers', abs: false},
	{ sin: 'orange', plu: 'oranges', abs: false},
	{ sin: 'organism', plu: 'organisms', abs: false},
	{ sin: 'part', plu: 'parts', abs: false},
	{ sin: 'peace', abs: true},
	{ sin: 'peanut', plu: 'peanuts', abs: false},
	{ sin: 'pear', plu: 'pears', abs: false},
	{ sin: 'person', plu: 'persons', col: 'people', colp:'peoples', abs: false},
	{ sin: 'pig', plu: 'pigs', abs: false},
	{ sin: 'place', plu: 'places', abs: false},
	{ sin: 'plane', plu: 'planes', abs: false},
	{ sin: 'plant', plu: 'plants', abs: false},
	{ sin: 'point', plu: 'points', abs: false},
	{ sin: 'pride', abs: true},
	{ sin: 'problem', plu: 'problems', abs: false},
	{ sin: 'prokaryote', plu: 'prokaryotes', abs: false},
	{ sin: 'protist', plu: 'protists', abs: false},
	{ sin: 'rooster', plu: 'roosters', abs: false},
	{ sin: 'sheep', plu: 'sheep', abs: false},
	{ sin: 'snake', plu: 'snakes', abs: false},
	{ sin: 'soldier', plu: 'soldiers', abs: false},
	{ sin: 'strawberry', plu: 'strawberries', abs: false},
	{ sin: 'table', plu: 'tables', abs: false},
	{ sin: 'thing', plu: 'things', abs: false},
	{ sin: 'time', plu: 'times', abs: false},
	{ sin: 'tree', plu: 'trees', abs: false},
	{ sin: 'truck', plu: 'trucks', abs: false},
	{ sin: 'walnut', plu: 'walnuts', abs: false},
	{ sin: 'way', plu: 'ways', abs: false},
	{ sin: 'week', plu: 'weeks', abs: true},
	{ sin: 'woman', plu: 'women', abs: false},
	{ sin: 'work', plu: 'works', abs: false},
	{ sin: 'world', plu: 'worlds', abs: false},
	{ sin: 'year', plu: 'years', abs: true},
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
	{ pos: 'fast', com: 'faster', sup: 'fastest'},
	{ pos: 'green', com: 'greener', sup: 'greenest'},
	{ pos: 'happy', com: 'happier', sup: 'happiest'},
	{ pos: 'hard', com: 'harder', sup: 'hardest'},
	{ pos: 'heavy', com: 'heavier', sup: 'heaviest'},
	{ pos: 'high', com: 'higher', sup: 'highest'},
	{ pos: 'hot', com: 'hotter', sup: 'hottest'},
	{ pos: 'large', com: 'larger', sup: 'largest'},
	{ pos: 'light', com: 'lighter', sup: 'lightest'},
	{ pos: 'loud', com: 'louder', sup: 'loudest'},
	{ pos: 'low', com: 'lower', sup: 'lowest'},
	{ pos: 'old', com: 'older', sup: 'oldest'},
	{ pos: 'orange', com: 'oranger', sup: 'orangest'},
	{ pos: 'quiet', com: 'quieter', sup: 'quietest'},
	{ pos: 'red', com: 'redder', sup: 'reddest'},
	{ pos: 'sad', com: 'sadder', sup: 'saddest'},
	{ pos: 'shiny', com: 'shinier', sup: 'shiniest'},
	{ pos: 'slow', com: 'slower', sup: 'slowest'},
	{ pos: 'small', com: 'smaller', sup: 'smallest'},
	{ pos: 'smelly', com: 'smellier', sup: 'smelliest'},
	{ pos: 'soft', com: 'softer', sup: 'softest'},
	{ pos: 'strong', com: 'stronger', sup: 'strongest'},
	{ pos: 'tall', com: 'taller', sup: 'tallest'},
	{ pos: 'tiny', com: 'tinier', sup: 'tiniest'},
	{ pos: 'warm', com: 'warmer', sup: 'warmest'},
	{ pos: 'weak', com: 'weaker', sup: 'weakest'},
	{ pos: 'yellow', com: 'yellower', sup: 'yellowest'},
	{ pos: 'young', com: 'younger', sup: 'youngest'}
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
	outputString += ':- discontiguous adjective/1, comparative_adjective/1, superlative_adjective/1, non_gradable_adjective/1.\n';
	outputString += 'adjective(X) :- comparative_adjective(X).\n';
	outputString += 'adjective(X) :- superlative_adjective(X).\n';
	

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
	outputString += ':- discontiguous transitive_v/1, intransitive_v/1, conjugation/2.\n';
	
	for (var i = 0; i < verbs.length; i++){
		var a = verbs[i].pres;
		var b = verbs[i].past;
		outputString += 'conjugation(' + verbs[i].name + ', conj(' + a.join(', ') + ', ' + b.join(', ') + ')).\n';
		if (typeof verbs[i].transitive !== 'undefined'){
				if (verbs[i].transitive === true){
					outputString += 'transitive_v(' + verbs[i].name + ').\n';
				}
		}
		if (typeof verbs[i].intransitive !== 'undefined'){
				if (verbs[i].intransitive === true){
					outputString += 'intransitive_v(' + verbs[i].name + ').\n';
				}
		}
	}
	return outputString;
}
			

function processNouns() {
	var outputString = '';
	
	outputString += ':- discontiguous noun/1, plural_of/2, is_countable/1, collective_of/1, is_collective/1.\n';
	
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
	
	outputString += ':- discontiguous child_of/1.\n';
	
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