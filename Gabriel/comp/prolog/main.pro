:- consult('processing/atomize.pro').
:- consult('processing/evaluate.pro').
:- consult('data/data.pro').
:- consult('grammar/wordAssociations.pro').
:- consult('grammar/grammarStatements.pro').
%:- consult('grammar/grammarQuestions.pro').

sentence(Input, Resp) :-
	atomize(Input, Tokens),
	((is_statement(Tokens) -> process_statement(Tokens, Resp)), !);
	respond_error(Resp).
	
is_statement(Tokens):-
	phrase(statement, Tokens).

process_statement(Tokens, Resp) :-
	Resp = "This is a statement.".

respond_error(Resp) :-
	Resp = "This is an error.".