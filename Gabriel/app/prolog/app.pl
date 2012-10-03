:- include('atomize.pl').

sentence(Input, Resp) :-
        atomize(Input, Resp).
        