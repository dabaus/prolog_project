:- include('atomize.pl').



statement((s, [NP,VP])) --> noun_phrase(NP), verb_phrase(VP).
noun_phrase((np, (det, [D]), (n, [N]))) --> determiner(D), noun(N).
noun_phrase((np, [(p,[P]),(n, [N])])) --> particle(P), noun(N).
noun_phrase((np, [(n, [N])])) --> proper_name(N).
noun_phrase((np, [(det, [D]), (ad, [AD]), (n, [N])])) --> determiner(D), adjective(AD), noun(N).
%noun_phrase(np(PN)) --> pronoun(PN).
verb_phrase((vp, [(v, [V], [NP])])) --> transitive_verb(V), noun_phrase(NP).
verb_phrase((vp, [(v, [V]), (ad, [AD])])) --> transitive_verb(V), adjective(AD).
verb_phrase((vp, [V])) --> intransitive_verb(V).
noun(X) --> [X], {noun(X)}.  
determiner(X) --> [X], {determiner(X)}.
proper_name(X) --> [X], {name(X)}. 
transitive_verb(X) --> [X], {transVerb(X)}.
intransitive_verb(X) --> [X], {intransVerb(X)}.
adjective(X) --> [X], {adjective(X)}.
particle(X) --> [X], {particle(X)}.

noun(man).
noun(men).
noun(woman).
noun(women).
noun(cat).
pluralOf(man, men).
pluralOf(woman, women).
isCountable(man).
isCountable(women).
determiner(a).
determiner(every).
determiner(many).
particle(the).
name(john).
transVerb(loves).
transVerb(is).
intransVerb(run).
adjective(red).
adjective(big).
%main(Out) :- phrase(sentence(s(_,vp(loves,np(every,woman)))), Out).

main :-
        write('Sentence:'),
        read_line(X),
        atomize(X, Atoms),
        phrase(statement(Out), Atoms),
        write(Out).
 
%findEl(El, Tree, Out) :-
%        findEl(El, [Tree], Out).
        
%Element found
%findEl(El, [(El, L)|_], Out) :-
%        Out = L.

%findEl(_, [], _) :-
%        fail.

%Depth first recursion
%findEl(El, [(_, L)|Rest], Out) :-
%        findEl(El, L, Out),
%        findEl(El, Rest, Out).
        