:- use_module(library(codesio)).
:- use_module(library(random)).

is_statement(Tokens):-
	phrase(statement, Tokens).

process_statement(Tokens, Resp) :-
	(uses_verb(Tokens, be) -> process_assignment(Tokens, Resp));
	Resp = "This is some other kind of statement.".

process_assignment(Tokens, Resp) :-
	get_statement_object(Tokens, Object),
	get_statement_subject(Tokens, Subject),
	(
		(is_object_adjective(Object) -> 
			(
				get_noun_phrase_core(Subject, Subj),
				nth1(1, Object, Obj),
				assert(make(Subj, Obj)),
                                random_member(Chosen, ['So, a ~a is ~a.', 'Aha! A ~a is ~a!', 'A ~a is ~a? Cool']),
                                format_to_codes(Chosen, [Subj, Obj], Resp)
			)
		);
		(
			get_noun_phrase_core(Subject, Subj),
			get_noun_phrase_core(Object, Obj),
			assert(child_of(Obj, Subj)),
                        random_member(Chosen, ['So, a ~a is actually a ~a!', 'Aha! A ~a is a ~a.', 'A ~a is a ~a? Cool']),
                        format_to_codes(Chosen, [Subj, Obj], Resp)
		)
	);
	Resp = "This is an assignment, but I couldn't figure it out. Sorry.".