:- use_module(library(between)).

/* -- VERB -- */

getVerb(Verb, Conj) :-
        conjugation(Verb, Conjugations),
        functor(Conjugations,conj,Arity),
        between(1,Arity,Index),
        arg(Index, Conjugations, Conj).

verb(Conj) :- getVerb(_, Conj).