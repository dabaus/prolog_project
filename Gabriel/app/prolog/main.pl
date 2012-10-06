:- include('atomize.pl').
:- include('phrases.pl').

sentence(Input, Resp) :-
        atomize(Input, Tokens),
        do_respond(Tokens, Resp).
 
fsentence(Input) :-
        sentence(Input, Resp),
        format(Resp, []).