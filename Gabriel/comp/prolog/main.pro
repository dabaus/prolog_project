:- include('processing/atomize.pro').
:- include('processing/evaluate.pro').
:- include('data/data.pro').
:- include('grammar/wordAssociations.pro').
:- include('grammar/grammarStatements.pro').
:- include('grammar/grammarQuestions.pro').

process(Input) :-
	atomize(Input, Tokens),
	phrase(statement, Tokens).

sentence(Input, Resp) :-
	atomize(Input, Tokens),
	get_response(Tokens, Out),
	atom_codes(Resp, Out).

get_response(Tokens, Resp) :-
	is_question(Tokens, QAns),
	is_statement(Tokens, SAns),
	((QAns == true -> process_question(Tokens, Resp)), !);
	((SAns == true -> process_statement(Tokens, Resp)), !);
	respondError(Resp).

:- process("animal is big").