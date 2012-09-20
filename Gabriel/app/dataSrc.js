//Data
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
nouns = [
	{ s: 'thing', p: 'things' },
	{ s: 'organism', p: 'organisms' },
	{ s: 'prokaryote', p: 'prokaryotes'},
	{ s: 'eukaryote', p: 'eukaryotes'},
	{ s: 'bacterium', p: 'bacteria'},
	{ s: 'archaeon', p: 'archaea'},
	{ s: 'protist', p: 'protists'},
	{ s: 'plant', p: 'plants'},
	{ s: 'fungus', p: 'fungi'},
	{ s: 'animal', p: 'animals'}
]
verbs = [
	{
		name: 'be',
		conj: ['am', 'are', 'is', 'are', 'are', 'are', 'was', 'were', 'was', 'were', 'were', 'were'],
		modes: ['intransitive', 'transitive']
	},
]
