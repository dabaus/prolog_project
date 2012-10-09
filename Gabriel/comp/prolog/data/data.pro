% Adjectives
:- discontiguous adjective/1, comparative_adjective/1, superlative_adjective/1, non_gradable_adjective/1.
adjective(X) :- comparative_adjective(X).
adjective(X) :- superlative_adjective(X).
adjective(angry).
comparative_adjective(angrier).
superlative_adjective(angriest).
adjective(big).
comparative_adjective(bigger).
superlative_adjective(biggest).
adjective(black).
comparative_adjective(blacker).
superlative_adjective(blackest).
adjective(blue).
comparative_adjective(bluer).
superlative_adjective(bluest).
adjective(bright).
comparative_adjective(brighter).
superlative_adjective(brightest).
adjective(brown).
comparative_adjective(browner).
superlative_adjective(brownest).
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
adjective(fast).
comparative_adjective(faster).
superlative_adjective(fastest).
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
adjective(high).
comparative_adjective(higher).
superlative_adjective(highest).
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
adjective(low).
comparative_adjective(lower).
superlative_adjective(lowest).
adjective(old).
comparative_adjective(older).
superlative_adjective(oldest).
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
adjective(slow).
comparative_adjective(slower).
superlative_adjective(slowest).
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
adjective(tall).
comparative_adjective(taller).
superlative_adjective(tallest).
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
adjective(young).
comparative_adjective(younger).
superlative_adjective(youngest).
% Nouns
:- discontiguous noun/1, plural_of/2, is_countable/1, collective_of/1, is_collective/1.
noun(air).
noun(anger).
noun(animal).
plural_of(animal, animals).
noun(animals).
is_countable(animal).
noun(apple).
plural_of(apple, apples).
noun(apples).
is_countable(apple).
noun(archaeon).
plural_of(archaeon, archaea).
noun(archaea).
is_countable(archaeon).
noun(arm).
plural_of(arm, arms).
noun(arms).
is_countable(arm).
noun(bacterium).
plural_of(bacterium, bacteria).
noun(bacteria).
is_countable(bacterium).
noun(banana).
plural_of(banana, bananas).
noun(bananas).
is_countable(banana).
noun(bear).
plural_of(bear, bears).
noun(bears).
is_countable(bear).
noun(bell).
plural_of(bell, bells).
noun(bells).
is_countable(bell).
noun(berry).
plural_of(berry, berries).
noun(berries).
is_countable(berry).
noun(bird).
plural_of(bird, birds).
noun(birds).
is_countable(bird).
noun(boat).
plural_of(boat, boats).
noun(boats).
is_countable(boat).
noun(body).
plural_of(body, bodies).
noun(bodies).
is_countable(body).
noun(book).
plural_of(book, books).
noun(books).
is_countable(book).
noun(box).
plural_of(box, boxes).
noun(boxes).
is_countable(box).
noun(boy).
plural_of(boy, boys).
noun(boys).
is_countable(boy).
noun(building).
plural_of(building, buildings).
noun(buildings).
is_countable(building).
noun(captain).
plural_of(captain, captains).
noun(captains).
is_countable(captain).
noun(car).
plural_of(car, cars).
noun(cars).
is_countable(car).
noun(case).
plural_of(case, cases).
noun(cases).
is_countable(case).
noun(cat).
plural_of(cat, cats).
noun(cats).
is_countable(cat).
collective_of(cat, clowder).
noun(clowder).
is_collective(clowder).
noun(century).
plural_of(century, centuries).
noun(centuries).
is_countable(century).
noun(chair).
plural_of(chair, chairs).
noun(chairs).
is_countable(chair).
noun(chest).
plural_of(chest, chests).
noun(chests).
is_countable(chest).
noun(chicken).
plural_of(chicken, chickens).
noun(chickens).
is_countable(chicken).
noun(child).
plural_of(child, children).
noun(children).
is_countable(child).
noun(company).
plural_of(company, companies).
noun(companies).
is_countable(company).
noun(computer).
plural_of(computer, computers).
noun(computers).
is_countable(computer).
noun(cow).
plural_of(cow, cows).
noun(cows).
is_countable(cow).
noun(day).
plural_of(day, days).
noun(days).
is_countable(day).
noun(dog).
plural_of(dog, dogs).
noun(dogs).
is_countable(dog).
noun(duck).
plural_of(duck, ducks).
noun(ducks).
is_countable(duck).
collective_of(duck, flock).
noun(flock).
is_collective(flock).
noun(ear).
plural_of(ear, ears).
noun(ears).
is_countable(ear).
noun(elephant).
plural_of(elephant, elephants).
noun(elephants).
is_countable(elephant).
noun(eukaryote).
plural_of(eukaryote, eukaryotes).
noun(eukaryotes).
is_countable(eukaryote).
noun(eye).
plural_of(eye, eys).
noun(eys).
is_countable(eye).
noun(face).
plural_of(face, faces).
noun(faces).
is_countable(face).
noun(fact).
plural_of(fact, facts).
noun(facts).
is_countable(fact).
noun(fruit).
plural_of(fruit, fruits).
noun(fruits).
is_countable(fruit).
noun(fungus).
plural_of(fungus, fungi).
noun(fungi).
is_countable(fungus).
noun(giraffe).
plural_of(giraffe, giraffes).
noun(giraffes).
is_countable(giraffe).
noun(girl).
plural_of(girl, girls).
noun(girls).
is_countable(girl).
noun(government).
plural_of(government, governments).
noun(governments).
is_countable(government).
noun(group).
plural_of(group, groups).
noun(groups).
is_countable(group).
noun(hand).
plural_of(hand, hands).
noun(hands).
is_countable(hand).
noun(hate).
noun(head).
plural_of(head, heads).
noun(heads).
is_countable(head).
noun(heart).
plural_of(heart, hearts).
noun(hearts).
is_countable(heart).
noun(hen).
plural_of(hen, hens).
noun(hens).
is_countable(hen).
noun(home).
plural_of(home, homes).
noun(homes).
is_countable(home).
noun(horse).
plural_of(horse, horses).
noun(horses).
is_countable(horse).
noun(house).
plural_of(house, houses).
noun(houses).
is_countable(house).
noun(leg).
plural_of(leg, legs).
noun(legs).
is_countable(leg).
noun(life).
plural_of(life, lives).
noun(lives).
is_countable(life).
noun(love).
noun(man).
plural_of(man, men).
noun(men).
is_countable(man).
noun(mink).
plural_of(mink, minks).
noun(minks).
is_countable(mink).
noun(month).
plural_of(month, months).
noun(months).
is_countable(month).
noun(mouth).
plural_of(mouth, mouths).
noun(mouths).
is_countable(mouth).
noun(nose).
plural_of(nose, noses).
noun(noses).
is_countable(nose).
noun(number).
plural_of(number, numbers).
noun(numbers).
is_countable(number).
noun(orange).
plural_of(orange, oranges).
noun(oranges).
is_countable(orange).
noun(organism).
plural_of(organism, organisms).
noun(organisms).
is_countable(organism).
noun(part).
plural_of(part, parts).
noun(parts).
is_countable(part).
noun(peace).
noun(peanut).
plural_of(peanut, peanuts).
noun(peanuts).
is_countable(peanut).
noun(pear).
plural_of(pear, pears).
noun(pears).
is_countable(pear).
noun(person).
plural_of(person, persons).
noun(persons).
is_countable(person).
collective_of(person, people).
noun(people).
is_collective(people).
plural_of(people, peoples).
noun(peoples).
is_collective(peoples).
noun(pig).
plural_of(pig, pigs).
noun(pigs).
is_countable(pig).
noun(place).
plural_of(place, places).
noun(places).
is_countable(place).
noun(plane).
plural_of(plane, planes).
noun(planes).
is_countable(plane).
noun(plant).
plural_of(plant, plants).
noun(plants).
is_countable(plant).
noun(point).
plural_of(point, points).
noun(points).
is_countable(point).
noun(pride).
noun(problem).
plural_of(problem, problems).
noun(problems).
is_countable(problem).
noun(prokaryote).
plural_of(prokaryote, prokaryotes).
noun(prokaryotes).
is_countable(prokaryote).
noun(protist).
plural_of(protist, protists).
noun(protists).
is_countable(protist).
noun(rooster).
plural_of(rooster, roosters).
noun(roosters).
is_countable(rooster).
noun(sheep).
plural_of(sheep, sheep).
noun(sheep).
is_countable(sheep).
noun(snake).
plural_of(snake, snakes).
noun(snakes).
is_countable(snake).
noun(soldier).
plural_of(soldier, soldiers).
noun(soldiers).
is_countable(soldier).
noun(strawberry).
plural_of(strawberry, strawberries).
noun(strawberries).
is_countable(strawberry).
noun(table).
plural_of(table, tables).
noun(tables).
is_countable(table).
noun(thing).
plural_of(thing, things).
noun(things).
is_countable(thing).
noun(time).
plural_of(time, times).
noun(times).
is_countable(time).
noun(tree).
plural_of(tree, trees).
noun(trees).
is_countable(tree).
noun(truck).
plural_of(truck, trucks).
noun(trucks).
is_countable(truck).
noun(walnut).
plural_of(walnut, walnuts).
noun(walnuts).
is_countable(walnut).
noun(way).
plural_of(way, ways).
noun(ways).
is_countable(way).
noun(week).
plural_of(week, weeks).
noun(weeks).
is_countable(week).
noun(woman).
plural_of(woman, women).
noun(women).
is_countable(woman).
noun(work).
plural_of(work, works).
noun(works).
is_countable(work).
noun(world).
plural_of(world, worlds).
noun(worlds).
is_countable(world).
noun(year).
plural_of(year, years).
noun(years).
is_countable(year).
% Verbs
:- discontiguous transitive_v/1, intransitive_v/1, conjugation/2.
conjugation(be, conj(am, are, is, are, are, are, was, were, was, were, were, were)).
transitive_v(be).
intransitive_v(be).
conjugation(have, conj(have, have, has, have, have, have, had, had, had, had, had, had)).
transitive_v(have).
intransitive_v(have).
% Relationships child of
:- discontiguous child_of/2.
child_of(fruit, apple).
child_of(fruit, pear).
child_of(fruit, banana).
child_of(fruit, orange).
child_of(child, boy).
child_of(child, girl).
child_of(animal, mammal).
child_of(mammal, bear).
child_of(mammal, cow).
child_of(mammal, pig).
child_of(mammal, sheep).
child_of(mammal, mink).
child_of(mammal, elephant).
child_of(mammal, giraffe).
child_of(building, house).
child_of(person, man).
child_of(person, woman).
child_of(person, child).
child_of(child, boy).
child_of(child, girl).
child_of(thing, organism).
child_of(organism, prokaryote).
child_of(organism, eukaryote).
child_of(prokaryote, bacterium).
child_of(prokaryote, archaeon).
child_of(eukaryote, protist).
child_of(eukaryote, plant).
child_of(eukaryote, fungus).
child_of(eukaryote, animal).
% Relationships give
:- discontiguous give/3.
give(face, 1, nose).
give(face, 2, eye).
give(face, 1, mouth).
give(head, 1, face).
give(head, 2, ear).
give(body, 1, head).
give(body, 2, arm).
give(body, 2, leg).
give(person, 1, body).
give(body, 1, heart).
% Relationships make
:- discontiguous make/2.
make(apple, red).
make(apple, green).
make(apple, small).
make(banana, yellow).
make(banana, green).
make(banana, brown).
make(banana, small).
make(bear, strong).
make(bear, black).
make(bear, brown).
make(car, fast).
make(car, heavy).
make(child, young).
make(orange, orange).
make(orange, small).
make(pear, green).
make(pear, small).
% Grammar
:- discontiguous article/1, determiner/1, pronoun/1, personal_pronoun/1.
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
personal_subject_pronoun(i).
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
interjection(hello).
interjection(hi).
interjection(yo).
