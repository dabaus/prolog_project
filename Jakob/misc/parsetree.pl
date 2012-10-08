:- consult('atomize.pl').
:- consult('../../Gabriel/comp/prolog/data/data.pro').
:- consult('../../Gabriel/comp/prolog/grammar/wordAssociations.pro').

query((q,[IP, VP])) --> interogative_phrase(IP), verb_phrase(VP).
interogative_phrase((ip, [(i, I)])) --> interogative(I).
interogative(I) --> [I], {interogative(I)}.

statement((s, [NP,VP])) --> noun_phrase(NP), verb_phrase(VP).
noun_phrase((np, [(d, D), (n, N)])) --> determiner(D), noun(N).
noun_phrase((np, [(d, D), (ad, AD), (n, N)])) --> determiner(D), adjective(AD), noun(N).
noun_phrase(np(PN)) --> pronoun(PN).
verb_phrase((vp, [(v, V), NP])) --> transitive_verb(V), noun_phrase(NP).
verb_phrase((vp, [(v, V), (ad, AD)])) --> transitive_verb(V), adjective(AD).
verb_phrase((vp, V)) --> intransitive_verb(V).
noun(X) --> [X], {noun(X)}.  
determiner(X) --> [X], {determiner(X)}.
transitive_verb(X) --> [X], {transVerb(X)}.
intransitive_verb(X) --> [X], {intransVerb(X)}.
adjective(X) --> [X], {adjective(X)}.
pronoun(X) --> [X], {pronoun(X)}.

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
      findElement(ad, Stat, Adjective),
      findElement(v, Stat, Verb),
      findElement(n, Stat, Noun),
      findElement(d, Stat, Determiner),
      assert(fact(Determiner, Noun, Verb, Adjective)),
      format('~w ~w ~w ~w ~n', [Determiner, Noun, Verb, Adjective]).

readQuery :-
      write('Query:'),
      read_line(X),
      atomize(X, Atoms),
      phrase(query(Query), Atoms),
      findElement(n, Query, Noun),
      findElement(d, Query, Determiner),
      findElement(v, Query, Verb),
      fact(Determiner, Noun, Verb, Adjective),
      format('~w ~w ~w ~w ~n', [Determiner, Noun, Verb, Adjective]).

main :-
       readStatement,
       readQuery.
        
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
        