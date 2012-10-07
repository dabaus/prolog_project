sentence(s(NP,VP)) --> noun_phrase(NP), verb_phrase(VP).
noun_phrase(np(D, N)) --> determiner(D), noun(N).
noun_phrase(np(N)) --> proper_name(N).
verb_phrase(vp(V,NP)) --> transitive_verb(V), noun_phrase(NP).
verb_phrase(vp(V)) --> intransitive_verb(V).
determiner(every) --> [every].
determiner(a) --> [a].
noun(X) --> [X], {noun(X)}.
proper_name(john) --> [john].
transitive_verb(loves) --> [loves].

noun(man).
noun(men).
noun(woman).
noun(women).
pluralOf(man, men).
pluralOf(woman, women).
isCountable(man).
isCountable(women).

main(Out) :- phrase(sentence(s(_,vp(loves,np(every,woman)))), Out).