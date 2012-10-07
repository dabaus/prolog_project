
var partsOfSpeech = [
	{
		name: 'determiner',
		subc: [
			{
				name: 'article',
				subc: [
					{
						name: 'definite_article',
						vals: ['the']
					},
					{
						name: 'indefinite_article',
						vals: ['a', 'an']
					},
					{
						name: 'partitive_article',
						vals: ['some']
					}
				]
			},
			{
				name: 'demonstrative_determiner',
				vals: ['this', 'that', 'these', 'those']
			},
			{
				name: 'interrogative_determiner',
				vals: ['which', 'what', 'whose']
			},
			{
				name: 'possessive_determiner',
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
				name: 'personal_pronoun',
				subc: [
					{
						name: 'personal_subject_pronoun',
						vals: ['i', 'you', 'he', 'she', 'it', 'we', 'they']
					},
					{
						name: 'personal_object_pronoun',
						vals: ['me', 'you', 'him', 'her', 'it', 'us', 'them']
					},
				]
			},
			{
				name: 'demonstrative_pronoun',
				vals: ['this', 'that', 'these', 'those']
			},
			{
				name: 'interrogative_pronoun',
				vals: ['who', 'whom', 'what', 'which', 'where', 'when', 'how', 'why']
			},
			{
				name: 'possessive_pronoun',
				vals: ['mine', 'yours', 'his', 'hers', 'its', 'ours', 'theirs']
			}
		]
	}
]

function generateParts(list, parent) {
	var statements = '';
	
	statements += ':- discontiguous article/1, determiner/1, pronoun/1, personal_pronoun/1.\n';
		
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
	return generateParts(partsOfSpeech);
};