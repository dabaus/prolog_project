child_of(animal, lifeform).
child_of(bird, animal).
child_of(mamal, animal).
child_of(cat, mamal).
child_of(raven, bird).
child_of(black, color).

is_a(Child, Parent) :-
        child_of(Child, Parent).
is_a(Child, Grand_parent) :-
        child_of(Parent, Grand_parent), is_a(Child, Parent).

give(cat, 1, tail).
give(cat, 4, leg).
give(cat, 1, fur).
give(bird, 2, leg).
give(bird, many, feather).

has(Object, X) :-
        has(Object, _, X).
has(Object, N, Attribute) :-
        give(Object, N, Attribute).
has(Child, N, Attribute) :-
        is_a(Child, Parent), give(Parent, N, Attribute).

make(raven, black).
make(bird, flies).

attrib(Child, X) :-
        make(Child, X).
attrib(Child, X) :-
        attrib(Parent, X), is_a(Child, Parent).
