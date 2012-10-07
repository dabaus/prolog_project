% Adjectives
adjective(X) :- comparative_adjective(_, X).
adjective(X) :- superlative_adjective(_, X).
adjective(angry).
comparative_adjective(angrier).
superlative_adjective(angriest).
adjective(big).
comparative_adjective(bigger).
superlative_adjective(biggest).
adjective(blue).
comparative_adjective(bluer).
superlative_adjective(bluest).
adjective(bright).
comparative_adjective(brighter).
superlative_adjective(brightest).
adjective(cold).
comparative_adjective(colder).
superlative_adjective(coldest).
adjective(colorful).
non_gradable_adjective(colorful).
adjective(cool).
comparative_adjective(cooler).
superlative_adjective(coolest).
adjective(crazy).
comparative_adjective(crazier).
superlative_adjective(craziest).
adjective(dark).
comparative_adjective(darker).
superlative_adjective(darkest).
adjective(green).
comparative_adjective(greener).
superlative_adjective(greenest).
adjective(happy).
comparative_adjective(happier).
superlative_adjective(happiest).
adjective(hard).
comparative_adjective(harder).
superlative_adjective(hardest).
adjective(heavy).
comparative_adjective(heavier).
superlative_adjective(heaviest).
adjective(hot).
comparative_adjective(hotter).
superlative_adjective(hottest).
adjective(large).
comparative_adjective(larger).
superlative_adjective(largest).
adjective(light).
comparative_adjective(lighter).
superlative_adjective(lightest).
adjective(loud).
comparative_adjective(louder).
superlative_adjective(loudest).
adjective(orange).
comparative_adjective(oranger).
superlative_adjective(orangest).
adjective(quiet).
comparative_adjective(quieter).
superlative_adjective(quietest).
adjective(red).
comparative_adjective(redder).
superlative_adjective(reddest).
adjective(sad).
comparative_adjective(sadder).
superlative_adjective(saddest).
adjective(shiny).
comparative_adjective(shinier).
superlative_adjective(shiniest).
adjective(small).
comparative_adjective(smaller).
superlative_adjective(smallest).
adjective(smelly).
comparative_adjective(smellier).
superlative_adjective(smelliest).
adjective(soft).
comparative_adjective(softer).
superlative_adjective(softest).
adjective(strong).
comparative_adjective(stronger).
superlative_adjective(strongest).
adjective(tiny).
comparative_adjective(tinier).
superlative_adjective(tiniest).
adjective(warm).
comparative_adjective(warmer).
superlative_adjective(warmest).
adjective(weak).
comparative_adjective(weaker).
superlative_adjective(weakest).
adjective(yellow).
comparative_adjective(yellower).
superlative_adjective(yellowest).
adjective(fast).
comparative_adjective(faster).
superlative_adjective(fastest).
adjective(slow).
comparative_adjective(slower).
superlative_adjective(slowest).
adjective(low).
comparative_adjective(lower).
superlative_adjective(lowest).
adjective(high).
comparative_adjective(higher).
superlative_adjective(highest).
adjective(tall).
comparative_adjective(taller).
superlative_adjective(tallest).
adjective(young).
comparative_adjective(younger).
superlative_adjective(youngest).
adjective(old).
comparative_adjective(older).
superlative_adjective(oldest).
% Nouns
noun(thing).
plural_of(thing, things).
noun(things).
is_countable(thing).
noun(organism).
plural_of(organism, organisms).
noun(organisms).
is_countable(organism).
noun(prokaryote).
plural_of(prokaryote, prokaryotes).
noun(prokaryotes).
is_countable(prokaryote).
noun(eukaryote).
plural_of(eukaryote, eukaryotes).
noun(eukaryotes).
is_countable(eukaryote).
noun(bacterium).
plural_of(bacterium, bacteria).
noun(bacteria).
is_countable(bacterium).
noun(archaeon).
plural_of(archaeon, archaea).
noun(archaea).
is_countable(archaeon).
noun(protist).
plural_of(protist, protists).
noun(protists).
is_countable(protist).
noun(plant).
plural_of(plant, plants).
noun(plants).
is_countable(plant).
noun(fungus).
plural_of(fungus, fungi).
noun(fungi).
is_countable(fungus).
noun(animal).
plural_of(animal, animals).
noun(animals).
is_countable(animal).
noun(air).
% Verbs
verb(be, conj(am, are, is, are, are, are, was, were, was, were, were, were)).
transitive_verb(be).
intransitive_verb(be).
verb(have, conj(have, have, has, have, have, have, had, had, had, had, had, had)).
transitive_verb(have).
intransitive_verb(have).
% Relationships
child_of(organism, thing).
child_of(prokaryote, organism).
child_of(eukaryote, organism).
child_of(bacterium, prokaryote).
child_of(archaeon, prokaryote).
child_of(protist, eukaryote).
child_of(plant, eukaryote).
child_of(fungus, eukaryote).
child_of(animal, eukaryote).
% Grammar
determiner(X) :- article(X).
article(X) :- definite_article(X).
definite_article(the).
article(X) :- indefinite_article(X).
indefinite_article(a).
indefinite_article(an).
article(X) :- partitive_article(X).
partitive_article(some).
determiner(X) :- demonstrative_determiner(X).
demonstrative_determiner(this).
demonstrative_determiner(that).
demonstrative_determiner(these).
demonstrative_determiner(those).
determiner(X) :- interrogative_determiner(X).
interrogative_determiner(which).
interrogative_determiner(what).
interrogative_determiner(whose).
determiner(X) :- possessive_determiner(X).
possessive_determiner(my).
possessive_determiner(your).
possessive_determiner(his).
possessive_determiner(her).
possessive_determiner(its).
possessive_determiner(our).
possessive_determiner(their).
possessive_determiner(whose).
determiner(X) :- quantifier(X).
quantifier(some).
quantifier(many).
pronoun(X) :- personal_pronoun(X).
personal_pronoun(X) :- personal_subject_pronoun(X).
personal_subject_pronoun(I).
personal_subject_pronoun(you).
personal_subject_pronoun(he).
personal_subject_pronoun(she).
personal_subject_pronoun(it).
personal_subject_pronoun(we).
personal_subject_pronoun(they).
personal_pronoun(X) :- personal_object_pronoun(X).
personal_object_pronoun(me).
personal_object_pronoun(you).
personal_object_pronoun(him).
personal_object_pronoun(her).
personal_object_pronoun(it).
personal_object_pronoun(us).
personal_object_pronoun(them).
pronoun(X) :- demonstrative_pronoun(X).
demonstrative_pronoun(this).
demonstrative_pronoun(that).
demonstrative_pronoun(these).
demonstrative_pronoun(those).
pronoun(X) :- interrogative_pronoun(X).
interrogative_pronoun(who).
interrogative_pronoun(whom).
interrogative_pronoun(what).
interrogative_pronoun(which).
interrogative_pronoun(where).
interrogative_pronoun(when).
interrogative_pronoun(how).
interrogative_pronoun(why).
pronoun(X) :- possessive_pronoun(X).
possessive_pronoun(mine).
possessive_pronoun(yours).
possessive_pronoun(his).
possessive_pronoun(hers).
possessive_pronoun(its).
possessive_pronoun(ours).
possessive_pronoun(theirs).
