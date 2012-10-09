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
				nth(1, Object, Obj),
				assert(make(Subj, Obj))
			)
		);
		(
			get_noun_phrase_core(Subject, Subj),
			get_noun_phrase_core(Object, Obj),
			assert(child_of(Obj, Subj))
		)
	);
	Resp = "This is an assignment.".