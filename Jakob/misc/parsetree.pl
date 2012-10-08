:- include('atomize.pl').

query((q,[IP, VP])) --> interogative_phrase(IP), verb_phrase(VP).
interogative_phrase((ip, [(i, I)])) --> interogative(I).
interogative(I) --> [I], {interogative(I)}.

statement((s, [NP,VP])) --> noun_phrase(NP), verb_phrase(VP).
noun_phrase((np, [(det, D), (n, N)])) --> determiner(D), noun(N).
noun_phrase((np, [(p, P),(n, N)])) --> particle(P), noun(N).
noun_phrase((np, [(n, N)])) --> proper_name(N).
noun_phrase((np, [(det, D), (ad, AD), (n, N)])) --> determiner(D), adjective(AD), noun(N).
%noun_phrase(np(PN)) --> pronoun(PN).
verb_phrase((vp, [(v, V), NP])) --> transitive_verb(V), noun_phrase(NP).
verb_phrase((vp, [(v, V), (ad, AD)])) --> transitive_verb(V), adjective(AD).
verb_phrase((vp, V)) --> intransitive_verb(V).
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
interogative(what).


%main(Out) :- phrase(sentence(s(_,vp(loves,np(every,woman)))), Out).

readStatement :-
      write('Statement:'),
      read_line(X),
      atomize(X, Atoms),
      phrase(statement(Stat), Atoms),
      findElement(ad, Stat, Adjective),
      findElement(v, Stat, Verb),
      findElement(n, Stat, Noun),
      findElement(p, Stat, Particle), 
      assert(fact(Particle, Noun, Verb, Adjective)),
      format('~w ~w ~w ~w ~n', [Particle, Noun, Verb, Adjective]).

readQuery :-
      write('Query:'),
      read_line(X),
      atomize(X, Atoms),
      phrase(query(Query), Atoms),
      findElement(n, Query, Noun),
      findElement(p, Query, Particle),
      findElement(v, Query, Verb),
      fact(Particle, Noun, Verb, Adjective),
      format('~w ~w ~w ~w ~n', [Particle, Noun, Verb, Adjective]).

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
        