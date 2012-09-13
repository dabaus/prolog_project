/* -*- Mode:Prolog; coding:iso-8859-1; -*- */
:- dynamic user:intransitive/1, user:transitive/1, user:ditransitive/1.
:- use_module(library(between)).

verb(give, conj(give, give, gives, give, give, give, gave, gave, gave, gave, gave, gave, give)).
verb(be, conj(am, are, is, are, are, are, was, were, was, were, were, were, be)).
verb(have, conj(have, have, has, have, have, have, had, had, had, had, had, had, have)).
verb(scurry, conj(scurry, scurry, scurries, scurry, scurry, scurry, scurried, scurried, scurried, scurried, scurried, scurried, scurry)).
verb(litter, conj(litter, litter, litters, litter, litter, litter, littered, littered, littered, littered, littered, littered, litter)).



/* -- VERB -- */

% NUMBER
isVerbSingular(Singular) :- 
        verb(_, Conjugations),
        member(Index, [1, 2, 3, 7, 8, 9]),
        arg(Index, Conjugations, Singular).     

isVerbPlural(Plural) :- 
        verb(_, Conjugations),
        member(Index, [4, 5, 6, 10, 11, 12]),
        arg(Index, Conjugations, Plural).

% TENSE
isVerbPresent(Present) :-
        verb(_, Conjugations),
        member(Index, [1, 2, 3, 4, 5, 6]),
        arg(Index, Conjugations, Present).

isVerbPast(Past) :-
        verb(_, Conjugations),
        member(Index, [7, 8, 9, 10, 11, 12]),
        arg(Index, Conjugations, Past).

% PERSON
isVerbFirstPerson(FP) :-
        verb(_, Conjugations),
        member(Index, [1, 4]),
        arg(Index, Conjugations, FP).

isVerbSecondPerson(SP) :-
        verb(_, Conjugations),
        member(Index, [2, 5]),
        arg(Index, Conjugations, SP).

isVerbThirdPerson(TP) :-
        verb(_, Conjugations),
        member(Index, [3, 6]),
        arg(Index, Conjugations, TP).

% TRANSITIVITY
setVerbTransitivity(Name, Int, Tra, Dit) :-
        (Int == true -> assert(intransitive(Name)); true),
        (Tra == true -> assert(transitive(Name)); true),
        (Dit == true -> assert(ditransitive(Name)); true).

% CONJUGATION TO VERB
matchVerb(Verb, Conj) :-
        verb(Verb, Conjugations),
        functor(Conjugations,conj,Arity),
        between(1,Arity,Index),
        arg(Index, Conjugations, Conj).

% CHECK CONJUGATED VERBS
isConjVerbSingular(Cverb) :- isVerbSingular(Verb), matchVerb(Verb, Cverb).
isConjVerbPlural(Cverb) :- isVerbPlural(Verb), matchVerb(Verb, Cverb).

isConjPresent(Cverb) :- isVerbPresent(Verb), matchVerb(Verb, Cverb).
isConjPast(Cverb) :- isVerbPast(Verb), matchVerb(Verb, Cverb).

isConjVerbFirstPerson(Cverb) :- isVerbFirstPerson(Verb), matchVerb(Verb, Cverb).
isConjVerbSecondPerson(Cverb) :- isVerbSecondPerson(Verb), matchVerb(Verb, Cverb).
isConjVerbThirdPerson(Cverb) :- isVerbThirdPerson(Verb), matchVerb(Verb, Cverb).

isConjVerbIntrans(Cverb) :- intransitive(Verb), matchVerb(Verb, Cverb).
isConjVerbTrans(Cverb) :- transitive(Verb), matchVerb(Verb, Cverb).
isConjVerbDitrans(Cverb) :- ditransitive(Verb), matchVerb(Verb, Cverb).

/* -- NOUN -- */

% SAMPLES
makeNoun(Noun, Pro, Com, Con, Abs) :-
        assert(noun(Noun)),
        (Pro == true -> assert(proper(Name)); true),
        (Com == true -> assert(common(Name)); true),
        (Con == true -> assert(concrete(Name)); true),
        (Abs == true -> assert(abstract(Name)); true).
        
makeNounPlural(Noun, Plural) :-
        assert(plural(Noun, Plural)),
        assert(countable(Noun)).

makeNounCollective(Noun, Collective) :-
        assert(collection(Noun, Collective)),
        assert(collective(Noun)).

