sentence(s(NP,VP)) --> noun_phrase(NP), verb_phrase(VP).
noun_phrase(np(D, N)) --> determiner(D), noun(N).
noun_phrase(np(N)) --> proper_name(N).
noun_phrase(np(D, A, N)) --> determiner(D), (A), noun(N).
noun_phrase(np(PN)) --> pronoun(PN).
verb_phrase(vp(V,NP)) --> transitive_verb(V), noun_phrase(NP).
verb_phrase(vp(V)) --> intransitive_verb(V).
determiner(X) --> [X], {determiner(X)}.
noun(X) --> [X], {noun(X)}.
proper_name(X) --> [X], {name(X)}. 
transitive_verb(X) --> [X], {transVerb(X)}.
intransitive_verb(X) --> [X], {intransVerb(X)}.

noun(man).
noun(men).
noun(woman).
noun(women).
pluralOf(man, men).
pluralOf(woman, women).
isCountable(man).
isCountable(women).
determiner(a).
determiner(every).
determiner(many).
name(john).
transVerb(loves).
intransVerb(run).

main(Out) :- phrase(sentence(s(_,vp(loves,np(every,woman)))), Out).