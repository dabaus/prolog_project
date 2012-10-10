:- use_module(library(codesio)).
:- use_module(library(random)).

is_statement(Tokens):-
	phrase(statement, Tokens).

process_statement(Tokens, Resp) :-
	(uses_verb(Tokens, be) -> process_assignment(Tokens, Resp));
        (uses_verb(Tokens, have) -> process_ownership(Tokens, Resp));
	Resp = "This is some other kind of statement.".

process_assignment(Tokens, Resp) :-
	get_statement_subject(Tokens, Subject),
	get_statement_object(Tokens, Object),
	get_noun_phrase_core(Subject, Subj),
	(
		(is_object_adjective(Object) -> 
			(
				nth1(1, Object, Obj),
				assert(make(Subj, Obj)),
                                random_member(Chosen, ['So, a ~a is ~a.', 'Aha! A ~a is ~a!', 'A ~a is ~a? Cool']),
                                format_to_codes(Chosen, [Subj, Obj], Resp)
			)
		);
		(
			get_noun_phrase_core(Object, Obj),
			assert(child_of(Obj, Subj)),
                        random_member(Chosen, ['So, a ~a is actually a ~a!', 'Aha! A ~a is a ~a.', 'A ~a is a ~a? Cool']),
                        format_to_codes(Chosen, [Subj, Obj], Resp)
		)
	);
	Resp = "This is an assignment, but I couldn't figure it out. Sorry.".

process_ownership(Tokens, Resp) :-
        (
                get_statement_subject(Tokens, Subject),
                get_noun_phrase_core(Subject, Subj),
                get_statement_object(Tokens, Object),
                get_statement_possession(Object, Owned, Quantity),
                assert(give(Subj, Quantity, Owned)),
                random_member(Chosen, ['I didn\'t know that a ~a had ~p ~a!', 'A ~a really has ~p ~a? Wow.', 'So a ~a has ~p ~a. OK.']),
                get_noun_plural(Owned, Plural),
                format_to_codes(Chosen, [Subj, Quantity, Plural], Resp)
        );
        Resp = "This denotes ownership, but I can't figure out how".