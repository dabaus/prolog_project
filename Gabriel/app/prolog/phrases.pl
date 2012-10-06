do_respond(Sentence, Resp) :-
        operation(Phrase, Sentence, []),
        call(Phrase, Sentence, Resp).

operation(Sentence) --> select_phrase(Sentence).

select_phrase(greeting) --> ([hi]; [hello]; [hai]; [hey]). 
select_phrase(introduction) --> ([nice, to, meet, you]).
select_phrase(none) --> [_].

greeting(_, Out) :-
        Out = "Hello!".

introduction(_, Out) :-
        Out = "Nice too meet you too.".

none(_, Out) :-
        Out = "No rule matched this phrase.".