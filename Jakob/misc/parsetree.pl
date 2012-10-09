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
noun_phrase((np, [N])) --> noun(N).
noun_phrase((np, [D, AD, N])) --> determiner(D), adjective(AD), noun(N).
noun_phrase(np(PN)) --> pronoun(PN).
verb_phrase((vp, [V, Q, N])) --> transitive_verb(V), quantity(Q), noun(N).
verb_phrase((vp, [V, NP])) --> transitive_verb(V), noun_phrase(NP).
verb_phrase((vp, [V, AD])) --> transitive_verb(V), adjective(AD).

verb_phrase((vp, V)) --> intransitive_verb(V).
noun((n, X)) --> [X], {noun(X)}.  
determiner((d, X)) --> [X], {determiner(X)}.
transitive_verb((v, X)) --> [X], {transVerb(X)}.
intransitive_verb((v, X)) --> [X], {intransVerb(X)}.
adjective((ad, X)) --> [X], {adjective(X)}.
pronoun((p, X)) --> [X], {pronoun(X)}.
quantity((q, X)) --> [X], {quantity(X)}.

%main(Out) :- phrase(sentence(s(_,vp(loves,np(every,woman)))), Out).

interogative(what).

quantity(X) :-
        number(X).

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
        findElement(v, Query, Verb),
        retrieve(Noun, Verb).
             
respond(Stat) :-
        Stat = (s, _),
        findElement(ad, Stat, Adjective),
        findElement(v, Stat, Verb),
        findElement(n, Stat, Noun),
        assign_adj(Noun, Verb, Adjective).

respond(Stat) ;-
        Stat = (s, _),
        findElement(np, Stat, VerbPhrase),
        findElement(np, Stat, NounPhrase),
        findElement(n, NounPhrase, Noun),
        findElement(vp, Stat, VerbPhrase),
        findElement(v, VerbPhrase, Verb),
        findElement(q, VerbPhrase, Quantity),
        findElement(n, VerbPhrase, TargetNoun),
        assign_quant(Noun, Verb, Quantity, TargetNoun).
        
respond(Stat) :-
        Stat = (s, _),
        findElement(vp, Stat, VerbPhrase),
        findElement(v, VerbPhrase, Verb),
        findElement(n, Stat, Noun),
        findElement(n, VerbPhrase, TargetNoun),
        assign_noun(Noun, Verb, TargetNoun).
        
retrieve(Noun, Verb) :-
        getVerb(be, Verb),
        make(Noun, Adjective),
        format("~w ~w ~w ~n", [Noun, Verb, Adjective]).
retrieve(Noun, Verb) :-
        getVerb(have, Verb),
        give(Noun, Quantity, Adjective),
        format("~w ~w ~w ~w ~n", [Noun, Verb, Quantity, Adjective]).
retrieve(Noun, Verb) :-
        getVerb(have, Verb),
        give(Noun, Adjective),
        format("~w ~w ~w ~n", [Noun, Verb, Adjective]).

assign_adj(Noun, Verb, Adjective) :-
        getVerb(be, Verb),
        assert(make(Noun, Adjective)),
        format("~w is ~w ~n", [Noun, Adjective]). 
assign_noun(Noun, Verb, Target) :-
        getVerb(be, Verb),
        assert(child_of(Noun, Target)),
        format("~w is a ~w ~n", [Noun, Target]).
assign_noun(Noun, Verb, Target) :-
        getVerb(have, Verb),
        assert(give(Noun, 1, Target)),
        format("~w has ~w ~n", [Noun, Target]). 
assign_quant(Noun, Verb, Quantity, Target) :-
        getVerb(have, Verb),
        assert(give(Noun, Quantity, Target)),
        format("~w has ~w ~w ~n", [Noun, Quantity, Target]).
                        
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
       (readSentence,
       main); 
       (format('no clue man.~n', []),
       main).
        
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
        