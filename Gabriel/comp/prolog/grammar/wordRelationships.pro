/* Establish relationships with:
 * child_of(Child, Parent)
 * give(Owner, Num, Obj)
 * make(Obj, Attr)
 */

% IS-A RELATIONSHIPS
is_a(Child, Parent) :- child_of(Parent, Child).
is_a(Child, Parent) :- child_of(Mid, Child), is_a(Parent, Mid).

% HAS-A RELATIONSHIPS
has(Owner, Num, Obj) :- give(Owner, Num, Obj).
has(Owner, Num, Obj) :- is_a(Owner, Parent), give(Parent, Num, Obj).

% ATTRIB RELATIONSHIPS
attr(Obj, Attr) :- make(Obj, Attr).
attr(Obj, Attr) :- is_a(Obj, Parent), make(Parent, Attr).