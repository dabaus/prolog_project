% reverse(InputList, ReversedList)
% Reverses a list.
reverse(X, Out) :-
        reverse(X, [], Out).
reverse([X|Xt], Acc, Out) :-
        reverse(Xt, [X|Acc], Out).
reverse([], Acc, Out) :-
        Out = Acc.

% atomize(InputString, ListOfTokens)
% Turns a space-sparated string into a series of atoms
atomize(X, Out) :- % Interface
        atomize(X, [], [], Out).
atomize([], [], WA, Out) :-             % Reverse answer, return result
        reverse(WA, Out).
atomize([X], [], WA, Out) :-            % Check if last remaining character is
        is_question(X),                 % question mark.
        atom_codes(W, [X]),
        atomize([], [], [W|WA], Out).
atomize([X|Xt], [], WA, Out) :-         % If character is skippable and there's 
        should_skip(X),                 % nothing in IA, keep going & ignore it.
        atomize(Xt, [], WA, Out).
atomize([], IA, WA, Out) :-             % If there are no characters left,
        reverse(IA, T),                 % atomize the remaining contents of IA.
        atom_codes(W, T),
        atomize([], [], [W|WA], Out).
atomize([X|Xt], IA, WA, Out) :-         % Found a word, reverse the previous one
        should_skip(X),                 %  held in IA and keep going.
        reverse(IA, T),
        atom_codes(W, T),
        atomize([X|Xt], [], [W|WA], Out).
atomize([X|Xt], IA, WA, Out) :-         % If nothing else was matched, append
        atomize(Xt, [X|IA], WA, Out).   % characters to intermediate array.

% shouldSkip(CharacterValue)
% Evaluates whether character should be skipped or not.
should_skip(X) :-
       is_space(X);
       is_dot(X);
       is_comma(X);
       is_question(X).

is_space(X) :- X is 32.
is_dot(X) :- X is 46.
is_question(X) :- X is 63.
is_comma(X) :- X is 44.

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

is_statement(_Tokens, Answer) :-
    Answer = true.
