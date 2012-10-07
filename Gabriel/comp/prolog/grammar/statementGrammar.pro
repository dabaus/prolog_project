statement(s(Np, Vp)) :- noun_phrase(Np), verb_phrase(Vp).
statement(s(Intj)) :- [Intj], interjection(Intj).

noun_phrase(np(Det, Nou)) :- determiner(Det), noun(Nou).
noun_phrase(np(Det, Adj, Nou)) :- determiner(Det), adjective(Adj), noun(Nou).
noun_phrase(np(Pron)) :- pronoun(Pron).

verb_phrase(vp(Verb, Np)) :- transitive_verb(Verb), noun_phrase(Np).
verb_phrase(vp(Verb, Adj)) :- transitive_verb(Verb), adjective(Adj).
verb_phrase(vp(Verb)) :_ intransitive_verb(Verb).


