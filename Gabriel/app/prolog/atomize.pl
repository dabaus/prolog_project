reverse(X, Out) :-
        reverse(X, [], Out).
reverse([X|Xt], Acc, Out) :-
        reverse(Xt, [X|Acc], Out).
reverse([], Acc, Out) :-
        Out = Acc.
        
%Interface
atomize(X, Out) :-
        atomize(X, [], [], Out).
%Return result
atomize([], [], WA, Out) :-
        reverse(WA, Out).

%Last character is question mark.
atomize([X], [], WA, Out) :-
        is_question(X),
        atom_codes(W, [X]),
        atomize([], [], [W|WA], Out).
%Skipp extra characters
atomize([X|Xt], [], WA, Out) :-
        should_skip(X),
        atomize(Xt, [], WA, Out).
%Last word
atomize([], IA, WA, Out) :-
        reverse(IA, T),
        atom_codes(W, T),
        atomize([], [], [W|WA], Out).  
%Word found
atomize([X|Xt], IA, WA, Out) :-
        should_skip(X),
        reverse(IA, T),
        atom_codes(W, T),
        atomize([X|Xt], [], [W|WA], Out).
%Append characters to word
atomize([X|Xt], IA, WA, Out) :-
        atomize(Xt, [X|IA], WA, Out).

should_skip(X) :-
       is_space(X);
       is_dot(X);
       is_question(X).

is_space(X) :-
        X is 32.
is_dot(X) :-
        X is 46.
is_question(X) :-
        X is 63.