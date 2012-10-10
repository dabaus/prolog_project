% lastElem(List, LastElement)
% Finds the last element in a list 
last_elem([X], Last) :-
    Last = X.
last_elem([_X|Xt], Last) :-
    last_elem(Xt, Last).

is_question(Tokens, Answer) :-
    last_elem(Tokens, Last),
    (is_question(Last) -> Answer = true);
    Answer = false.