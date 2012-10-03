
var partsOfSpeech = [
	{
		name: 'determiner',
		subc: [
			{
				name: 'article',
				subc: [
					{
						name: 'definiteArticle',
						vals: ['the']
					},
					{
						name: 'indefiniteArticle',
						vals: ['a', 'an']
					},
					{
						name: 'partitiveArticle',
						vals: ['some']
					}
				]
			},
			{
				name: 'demonstrativeDeterminer',
				vals: ['this', 'that', 'these', 'those']
			},
			{
				name: 'interrogativeDeterminer',
				vals: ['which', 'what', 'whose']
			},
			{
				name: 'possessiveDeterminer',
				vals: ['my', 'your', 'his', 'her', 'its', 'our', 'their', 'whose']
			},
			{
				name: 'quantifier',
				vals: ['some', 'many']
			}
		]
	},
	{
		name: 'pronoun',
		subc: [
			{
				name: 'personalPronoun',
				subc: [
					{
						name: 'personalSubjectPronoun',
						vals: ['I', 'you', 'he', 'she', 'it', 'we', 'they']
					},
					{
						name: 'personalObjectPronoun',
						vals: ['me', 'you', 'him', 'her', 'it', 'us', 'them']
					},
				]
			},
			{
				name: 'demonstrativePronoun',
				vals: ['this', 'that', 'these', 'those']
			},
			{
				name: 'interrogativePronoun',
				vals: ['who', 'whom', 'what', 'which', 'where', 'when', 'how', 'why']
			},
			{
				name: 'possessivePronoun',
				vals: ['mine', 'yours', 'his', 'hers', 'its', 'ours', 'theirs']
			}
		]
	}
]

function generateParts(list, parent) {
	var statements = '';
	for (var i = 0; i < list.length; i++) {
		if (typeof parent !== 'undefined') {
			statements += parent + '(X) :- ' + list[i].name + '(X).\n';
		}
		if (typeof list[i].vals !== 'undefined') {
			for (var j = 0; j < list[i].vals.length; j++) {
				statements += list[i].name + '(' + list[i].vals[j] + ').\n';
			}
		}
		if (typeof list[i].subc !== 'undefined') {
			statements += generateParts(list[i].subc, list[i].name);
		}
	}
	return statements;
}

exports.genGrammar = function(){
	generateParts(partsOfSpeech);
};