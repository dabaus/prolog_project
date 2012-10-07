statement(N, V) --> noun_phrase(N), verb_phrase(V).
statement(I) --> interjection(I).

noun_phrase(D, N) --> determiner(D), noun(N).
noun_phrase(D, A) --> determiner(D), adjective(A).
noun_phrase(D, A, N) --> determiner(D), adjective(A), noun(N).
noun_phrase(P) --> pronoun(P).

verb_phrase(V, N) --> transitive_verb(V), noun_phrase(N).
verb_phrase(V, A) --> transitive_verb(V), adjective(A).
verb_phrase(V) --> intransitive_verb(V).

interjection(I) --> [I], {interjection(I)}.
determiner(D) --> [D], {determiner(D)}.
noun(N) --> [N], {noun(N)}.
adjective(A) --> [A], {adjective(A)}.
pronoun(P) --> [P], {pronoun(P)}.
transitive_verb(V) --> [V], {transitive_verb(V)}.
intransitive_verb(V) --> [V], {intransitive_verb(V)}.
