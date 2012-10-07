sentence(s(NP,VP)) --> noun_phrase(NP), verb_phrase(VP).
noun_phrase(np(D, N)) --> determiner(D), noun(N).
noun_phrase(np(N)) --> proper_name(N).
verb_phrase(vp(V,NP)) --> transitive_verb(V), noun_phrase(NP).
verb_phrase(vp(V)) --> intransitive_verb(V).
determiner(every) --> [every].
determiner(a) --> [a].
noun(man) --> [man].
noun(woman) --> [woman].
proper_name(john) --> [john].
transitive_verb(loves) --> [loves].
