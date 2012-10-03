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


console.log(processNouns());