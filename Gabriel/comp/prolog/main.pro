:- consult('grammar/wordAssociations.pro').	% Load word grammar rules.
:- consult('grammar/wordRelationships.pro').    % Load word relationship rules.
:- consult('data/data.pro'). 			% Load word and relationship data.

:- consult('processing/atomize.pro').	% Convert string into list of atoms.
:- consult('processing/statement.pro').	% Evaluate and process statements.
:- consult('processing/question.pro').	% Evaluate and process questions.

:- consult('grammar/grammarStatements.pro').	% Load statement grammar
:- consult('grammar/grammarQuestions.pro').		% Load question grammar

sentence(Input, Output) :-
	atomize(Input, Tokens),
	(
		(is_statement(Tokens) -> process_statement(Tokens, Resp));
		respond_error(Resp)
	),
	atom_codes(Output, Resp).

respond_error(Resp) :-
	Resp = "This is an error.".