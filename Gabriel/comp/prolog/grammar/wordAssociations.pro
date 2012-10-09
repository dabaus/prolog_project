:- use_module(library(between)).

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

% get_statement_object(ListOfTokens, ObjectOfStatement)
% Takes a list of tokens interpreted as a sentence and identifies what segment
% is the object
get_statement_object([Th|Tt], Out) :-
	transitive_verb(Th),
	Out = Tt.
get_statement_object([_|Tt], Out) :-
	get_object(Tt, Out).

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

is_object_adjective([Obj]) :-
	adjective(Obj).

is_object_pronoun([Obj]) :-
	pronoun(Obj).

is_object_noun([Obj]) :-
	noun(Obj).

get_noun_phrase_core(Tokens, Core) :-
	length(Tokens, L),
	(L == 1 -> (
		(is_object_noun(Tokens) -> get_noun_root(Tokens, Core));
		(is_object_pronoun(Tokens) -> get_pronoun_equivalent(Tokens, Core))
	));
	(L == 2 -> nth(2, Tokens, Core));
	(L == 3 -> nth(3, Tokens, Core));
	Core = fail.


/* ----- ADJECTIVE ----- */

/* ----- NOUN ----- */
get_noun_root([Derived], Root) :-
	(plural_noun(Derived) -> plural_of(Root, Derived));
	(collective_noun(Derived) -> collective_of(Root, Derived));
	(plural_collective_noun(Derived) -> plural_collective_of(Root, Derived));
	Root = fail.

/* ----- PRONOUN ----- */
get_pronoun_equivalent([Pronoun], Equiv) :-
	(Pronoun == i -> Equiv = user);
	(Pronoun == you -> Equiv = protalk);
	Equiv = someoneelse.


