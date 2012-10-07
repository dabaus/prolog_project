process_Question(_Tokens, Response) :-
	Response = "It's a question.".

process_Statement(_Tokens, Response) :-
	Response = "It's a statement.".

respondError(Response) :- 
	Response = "I'm sorry, I don't understand.".