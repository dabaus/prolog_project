:- multifile user:child_of/2, user:give/3, user:make/2.
:- dynamic user:child_of/2, user:give/3, user:make/2.

/* Establish relationships with:
 * child_of(Parent, Child)
 * give(Owner, Num, Obj)
 * make(Obj, Attr)
 */

child_of(parent, child).
give(reality, 1, universe).
make(universe, infinite).

% IS-A RELATIONSHIPS
is_a(Child, Parent) :- child_of(Parent, Child).
is_a(Child, Parent) :- child_of(Mid, Child), child_of(Parent, Mid).

% HAS-A RELATIONSHIPS
has(Owner, Num, Obj) :- give(Owner, Num, Obj).
has(Owner, Num, Obj) :- is_a(Owner, Parent), give(Parent, Num, Obj).

% ATTRIB RELATIONSHIPS
attr(Obj, Attr) :- make(Obj, Attr).
attr(Obj, Attr) :- is_a(Obj, Parent), make(Parent, Attr).