:- use_module(library(between)).
:- use_module(library(lists)).

/* ----- VERB FUNCTIONS ----- */

getVerb(Verb, Conj) :-
        conjugation(Verb, Conjugations),
        functor(Conjugations,conj,Arity),
        between(1,Arity,Index),
        arg(Index, Conjugations, Conj).

%verb(Conj) :- getVerb(_, Conj).

% transitive_verb(Conjugation)
% Checks if any conjugation of a verb belongs to a transitive verb
transitive_verb(Conj) :- 
        transitive_v(Verb),
        getVerb(Verb, Conj).

% intransitive_verb(Conjugation)
% Checks if any conjugation of a verb belongs to an intransitive verb
intransitive_verb(Conj) :- 
        intransitive_v(Verb),
        getVerb(Verb, Conj).

% uses_verb(ListOfTokens, Verb)
% Check if a list of tokens uses any conjugation of a specific verb.
uses_verb([Th|_], Verb) :-
	getVerb(Verb, Th).
uses_verb([_|Th], Verb) :-
	uses_verb(Th, Verb).

/* ----- PARTS OF SENTENCE -----*/

% get_statement_subject(ListOfTokens, SubjectOfStatement)
% Takes a list of tokens interpreted as a sentence and identifies what segment
% is the subject
get_statement_subject(Tokens, Subject) :-
	get_statement_subject(Tokens, [], Subject).
get_statement_subject([Th|_], Acc, Subject) :-
	transitive_verb(Th),
	Subject = Acc.
get_statement_subject([Th|Tt], Acc, Subject) :-
	append(Acc, [Th], Comp),
	get_statement_subject(Tt, Comp, Subject).

% get_statement_object(ListOfTokens, ObjectOfStatement)
% Takes a list of tokens interpreted as a sentence and identifies what segment
% is the object
get_statement_object([Th|Tt], Out) :-
	transitive_verb(Th),
	Out = Tt.
get_statement_object([_|Tt], Out) :-
	get_statement_object(Tt, Out).

% get_statement_possession(ObjectTokens, Object, ObjectQuantity)
% Takes the object of a sentence and identifies what the specific object is and 
% its quantity
get_statement_possession([Th|Tt], Object, Quantity) :-
        numeral(Th),
        (number(Th, _, Value); number(_, Th, Value)),
        Quantity = Value,
        get_statement_possession(Tt, Object, Value).
get_statement_possession([Th|_], Object, _) :-
        noun(Th),
        get_noun_root(Th, Result),
        Object = Result.
get_statement_possession([_|Tt], Object, Quantity) :-
        get_statement_possession(Tt, Object, Quantity).

get_noun_phrase_core([Th|_], Core) :-
        noun(Th),
        get_noun_root(Th, Result),
        Core = Result.
get_noun_phrase_core([Th|_], Core) :-
        pronoun(Th),
        get_pronoun_equivalent(Th, Core).
get_noun_phrase_core([_|Tt], Core) :-
        get_noun_phrase_core(Tt, Core).

/* ----- ADJECTIVE ----- */
is_object_adjective([Obj]) :- adjective(Obj).

/* ----- NOUN ----- */
get_noun_root(Derived, Root) :-
	(plural_noun(Derived) -> plural_of(Root, Derived));
	(collective_noun(Derived) -> collective_of(Root, Derived));
	(plural_collective_noun(Derived) -> plural_collective_of(Root, Derived));
        (noun(Derived) -> Root = Derived).

get_noun_plural(Noun, Plural) :-
        (plural_noun(Noun) -> Plural = Noun);
        plural_of(Noun, Plural).

/* ----- PRONOUN ----- */
get_pronoun_equivalent([Pronoun], Equiv) :-
	(Pronoun == i -> Equiv = user);
	(Pronoun == you -> Equiv = protalk);
	Equiv = someoneelse.


