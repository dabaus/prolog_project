statement --> interjection.
statement --> noun_phrase, verb_phrase.

noun_phrase --> noun.
noun_phrase --> pronoun.
noun_phrase --> determiner, noun.
noun_phrase --> determiner, adjective, noun.

verb_phrase --> transitive_verb, noun_phrase.
verb_phrase --> transitive_verb, adjective.
verb_phrase --> intransitive_verb.
verb_phrase --> transitive_verb, numeral, noun.
verb_phrase --> transitive_verb, numeral, adjective, noun.

interjection --> [I], {interjection(I)}.
determiner --> [D], {determiner(D)}.
noun --> [N], {noun(N)}.
adjective --> [A], {adjective(A)}.
pronoun --> [P], {pronoun(P)}.
transitive_verb --> [V], {transitive_verb(V)}.
intransitive_verb --> [V], {intransitive_verb(V)}.
numeral --> [N], {numeral(N)}.