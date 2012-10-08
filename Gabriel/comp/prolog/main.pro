:- consult('processing/atomize.pro').
:- consult('data/data.pro').
:- consult('grammar/wordAssociations.pro').
:- consult('grammar/grammarStatements.pro').
:- consult('grammar/grammarQuestions.pro').

sentence(Input, Output) :-
	atomize(Input, Tokens),
	(
		(is_statement(Tokens) -> process_statement(Tokens, Resp));
		respond_error(Resp)
	),
	atom_codes(Output, Resp).

	
is_statement(Tokens):-
	phrase(statement, Tokens).

process_statement(Tokens, Resp) :-
	(uses_verb(Tokens, be) -> process_assignment(Tokens, Resp));
	Resp = "This is some other kind of statement.".

process_assignment(Tokens, Resp) :-
	get_statement_object(Tokens, Object),
	get_statement_subject(Tokens, Subject),
	(
		(is_object_adjective(Object) -> )
	)
	Resp = "This is an assignment.".

respond_error(Resp) :-
	Resp = "This is an error.".