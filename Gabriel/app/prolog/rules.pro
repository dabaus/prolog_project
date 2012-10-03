/* -*- Mode:Prolog; coding:iso-8859-1; -*- */

% LOAD DATA
:- include('data.pro').

/* ------------------------------------ LOGIC RULES ------------------------------------ */

/* Establish relationships with:
 * child_of(Child, Parent)
 * give(Owner, Num, Obj)
 * make(Obj, Attr)
 */

% IS-A RELATIONSHIPS
is_a(Child, Parent) :- child_of(Child, Parent).
is_a(Child, Parent) :- child_of(Child, Mid), is_a(Mid, Parent).

% HAS-A RELATIONSHIPS
has(Owner, Num, Obj) :- give(Owner, Num, Obj).
has(Owner, Num, Obj) :- is_a(Owner, Parent), give(Parent, Num, Obj).

% ATTRIB RELATIONSHIPS
attr(Obj, Attr) :- make(Obj, Attr).
attr(Obj, Attr) :- is_a(Obj, Parent), make(Parent, Attr).

/* ----------------------------------- GRAMMAR RULES ----------------------------------- */

/* --- IDENTIFY PARTS OF SPEECH --- */

:- use_module(library(between)).

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
        member(Index, [1, 4, 7, 10]),
        arg(Index, Conjugations, FP).

isVerbSecondPerson(SP) :-
        verb(_, Conjugations),
        member(Index, [2, 5, 8, 11]),
        arg(Index, Conjugations, SP).

isVerbThirdPerson(TP) :-
        verb(_, Conjugations),
        member(Index, [3, 6, 9, 12]),
        arg(Index, Conjugations, TP).

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

makeAdjective(Adjective) :-
        assert(adjective(Adjective)).

makePossessiveAdjective(PossessiveAdjective) :-
        assert(possessiveAdjective(PossessiveAdjective)),
        assert(adjective(PossessiveAdjective)).