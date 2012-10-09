:- consult('atomize.pl').
:- consult('../../Gabriel/comp/prolog/data/data.pro').
:- consult('../../Gabriel/comp/prolog/grammar/wordAssociations.pro').

sentence(X) --> query(X); statement(X); greeting(X).

greeting((g, [G])) --> interjection_phrase(G). 
interjection_phrase((gp, [I])) --> interjection(I).
interjection((ij, I)) --> [I], {interjection(I)}.

query((q,[IP, VP])) --> interogative_phrase(IP), verb_phrase(VP).
interogative_phrase((ip, [I])) --> interogative(I).
interogative((ig, I)) --> [I], {interogative(I)}.

statement((s, [NP,VP])) --> noun_phrase(NP), verb_phrase(VP).
noun_phrase((np, [D, N])) --> determiner(D), noun(N).
noun_phrase((np, [D, AD, N])) --> determiner(D), adjective(AD), noun(N).
noun_phrase(np(PN)) --> pronoun(PN).
verb_phrase((vp, [V, NP])) --> transitive_verb(V), noun_phrase(NP).
verb_phrase((vp, [V, AD])) --> transitive_verb(V), adjective(AD).
verb_phrase((vp, V)) --> intransitive_verb(V).
noun((n, X)) --> [X], {noun(X)}.  
determiner((d, X)) --> [X], {determiner(X)}.
transitive_verb((v, X)) --> [X], {transVerb(X)}.
intransitive_verb((v, X)) --> [X], {intransVerb(X)}.
adjective((ad, X)) --> [X], {adjective(X)}.
pronoun((p, X)) --> [X], {pronoun(X)}.

%main(Out) :- phrase(sentence(s(_,vp(loves,np(every,woman)))), Out).

interogative(what).

transVerb(Conj) :-
        getVerb(Inf, Conj),
        transitive_v(Inf).
intransVerb(Conj) :-
        getVerb(Inf, Conj),
        intransitive_v(Inf).

readStatement :-
        write('Statement:'),
        read_line(X),
        atomize(X, Atoms),
        phrase(statement(Stat), Atoms),
        respond(Stat).
      
readQuery :-
        write('Query:'),
        read_line(X),
        atomize(X, Atoms),
        phrase(query(Query), Atoms),
        respond(Query).
      
respond(Query) :-
        Query = (q, _),
        findElement(n, Query, Noun),
        findElement(d, Query, Determiner),
        findElement(v, Query, Verb),
        fact(Determiner, Noun, Verb, Adjective),
        format('~w ~w ~w ~w ~n', [Determiner, Noun, Verb, Adjective]).

respond(Stat) :-
        Stat = (s, _),
        findElement(ad, Stat, Adjective),
        findElement(v, Stat, Verb),
        findElement(n, Stat, Noun),
        findElement(d, Stat, Determiner),
        assert(fact(Determiner, Noun, Verb, Adjective)),
        format('~w ~w ~w ~w ~n', [Determiner, Noun, Verb, Adjective]).

respond(Greet) :-
        Greet = (g, _),
        findElement(ij, Greet, Inter),
        interjection(X),
        X \= Inter,
        format('~w ~n', [X]).

readSentence :-
        write('Input:'),
        read_line(X),
        atomize(X, Atoms),
        phrase(sentence(Tree), Atoms),
        respond(Tree).

main :-
       readSentence.
        
findElement(El, Tree, Out) :-
       findEl(El, [Tree], Out).
        
%Element found
findEl(El, [(El, L)|_], Out) :-
       Out = L, !.

%Depth first branch
findEl(El, [(_, L)|T], Out) :-
       findEl(El, L, Out);
       findEl(El, T, Out).

findEl(_, [], _) :-
       fail.
        