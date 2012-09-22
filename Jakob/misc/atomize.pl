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
%Last word
atomize([], IA, WA, Out) :-
        reverse(IA, T),
        atom_codes(W, T),
        atomize([], [], [W|WA], Out).
%Eat spaces
atomize([X|Xt], [], WA, Out) :-
        is_space(X),
        atomize(Xt, [], WA, Out).
%Word found
atomize([X|Xt], IA, WA, Out) :-
        is_space(X),
        reverse(IA, T),
        atom_codes(W, T),
        atomize(Xt, [], [W|WA], Out).
%Eat characters
atomize([X|Xt], IA, WA, Out) :-
        atomize(Xt, [X|IA], WA, Out).

is_space(X) :-
        X is 32.