% Adjectives
:- discontiguous adjective/1, comparative_adjective/1, superlative_adjective/1, non_gradable_adjective/1.
adjective(X) :- comparative_adjective(X).
adjective(X) :- superlative_adjective(X).
adjective(alive).
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
adjective(cute).
comparative_adjective(cuter).
superlative_adjective(cutest).
adjective(dangerous).
non_gradable_adjective(dangerous).
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
adjective(juicy).
comparative_adjective(juicier).
superlative_adjective(juiciest).
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
adjective(long).
comparative_adjective(longer).
superlative_adjective(longest).
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
adjective(short).
comparative_adjective(shorter).
superlative_adjective(shortest).
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
adjective(sweet).
comparative_adjective(sweeter).
superlative_adjective(sweetest).
adjective(sour).
comparative_adjective(sourer).
superlative_adjective(sourest).
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
:- discontiguous noun/1, plural_of/2, plural_noun/2, is_countable/1, collective_of/2, collective_noun/1, is_collective/1, plural_noun/1, plural_collective_noun/1,plural_collective_of/2.
noun(air).
noun(anger).
noun(animal).
is_countable(animal).
noun(animals).
plural_of(animal, animals).
plural_noun(animals).
noun(apple).
is_countable(apple).
noun(apples).
plural_of(apple, apples).
plural_noun(apples).
noun(archaeon).
is_countable(archaeon).
noun(archaea).
plural_of(archaeon, archaea).
plural_noun(archaea).
noun(arm).
is_countable(arm).
noun(arms).
plural_of(arm, arms).
plural_noun(arms).
noun(bacterium).
is_countable(bacterium).
noun(bacteria).
plural_of(bacterium, bacteria).
plural_noun(bacteria).
noun(banana).
is_countable(banana).
noun(bananas).
plural_of(banana, bananas).
plural_noun(bananas).
noun(bear).
is_countable(bear).
noun(bears).
plural_of(bear, bears).
plural_noun(bears).
noun(bell).
is_countable(bell).
noun(bells).
plural_of(bell, bells).
plural_noun(bells).
noun(berry).
is_countable(berry).
noun(berries).
plural_of(berry, berries).
plural_noun(berries).
noun(bird).
is_countable(bird).
noun(birds).
plural_of(bird, birds).
plural_noun(birds).
noun(boat).
is_countable(boat).
noun(boats).
plural_of(boat, boats).
plural_noun(boats).
noun(body).
is_countable(body).
noun(bodies).
plural_of(body, bodies).
plural_noun(bodies).
noun(book).
is_countable(book).
noun(books).
plural_of(book, books).
plural_noun(books).
noun(box).
is_countable(box).
noun(boxes).
plural_of(box, boxes).
plural_noun(boxes).
noun(boy).
is_countable(boy).
noun(boys).
plural_of(boy, boys).
plural_noun(boys).
noun(building).
is_countable(building).
noun(buildings).
plural_of(building, buildings).
plural_noun(buildings).
noun(captain).
is_countable(captain).
noun(captains).
plural_of(captain, captains).
plural_noun(captains).
noun(car).
is_countable(car).
noun(cars).
plural_of(car, cars).
plural_noun(cars).
noun(case).
is_countable(case).
noun(cases).
plural_of(case, cases).
plural_noun(cases).
noun(cat).
is_countable(cat).
noun(cats).
plural_of(cat, cats).
plural_noun(cats).
is_collective(clowder).
noun(clowder).
collective_of(cat, clowder).
collective_noun(clowder).
is_collective(clowders).
noun(clowders).
plural_of(clowder, clowders).
plural_collective_of(cat, clowders).
plural_collective_noun(clowders).
noun(century).
is_countable(century).
noun(centuries).
plural_of(century, centuries).
plural_noun(centuries).
noun(chair).
is_countable(chair).
noun(chairs).
plural_of(chair, chairs).
plural_noun(chairs).
noun(chest).
is_countable(chest).
noun(chests).
plural_of(chest, chests).
plural_noun(chests).
noun(chicken).
is_countable(chicken).
noun(chickens).
plural_of(chicken, chickens).
plural_noun(chickens).
noun(child).
is_countable(child).
noun(children).
plural_of(child, children).
plural_noun(children).
noun(company).
is_countable(company).
noun(companies).
plural_of(company, companies).
plural_noun(companies).
noun(computer).
is_countable(computer).
noun(computers).
plural_of(computer, computers).
plural_noun(computers).
noun(cow).
is_countable(cow).
noun(cows).
plural_of(cow, cows).
plural_noun(cows).
is_collective(herd).
noun(herd).
collective_of(cow, herd).
collective_noun(herd).
is_collective(herds).
noun(herds).
plural_of(herd, herds).
plural_collective_of(cow, herds).
plural_collective_noun(herds).
noun(day).
is_countable(day).
noun(days).
plural_of(day, days).
plural_noun(days).
noun(dog).
is_countable(dog).
noun(dogs).
plural_of(dog, dogs).
plural_noun(dogs).
noun(duck).
is_countable(duck).
noun(ducks).
plural_of(duck, ducks).
plural_noun(ducks).
is_collective(flock).
noun(flock).
collective_of(duck, flock).
collective_noun(flock).
is_collective(flocks).
noun(flocks).
plural_of(flock, flocks).
plural_collective_of(duck, flocks).
plural_collective_noun(flocks).
noun(ear).
is_countable(ear).
noun(ears).
plural_of(ear, ears).
plural_noun(ears).
noun(elephant).
is_countable(elephant).
noun(elephants).
plural_of(elephant, elephants).
plural_noun(elephants).
noun(extremity).
is_countable(extremity).
noun(extremities).
plural_of(extremity, extremities).
plural_noun(extremities).
noun(eukaryote).
is_countable(eukaryote).
noun(eukaryotes).
plural_of(eukaryote, eukaryotes).
plural_noun(eukaryotes).
noun(eye).
is_countable(eye).
noun(eyes).
plural_of(eye, eyes).
plural_noun(eyes).
noun(face).
is_countable(face).
noun(faces).
plural_of(face, faces).
plural_noun(faces).
noun(fact).
is_countable(fact).
noun(facts).
plural_of(fact, facts).
plural_noun(facts).
noun(feather).
is_countable(feather).
noun(feathers).
plural_of(feather, feathers).
plural_noun(feathers).
noun(fruit).
is_countable(fruit).
noun(fruits).
plural_of(fruit, fruits).
plural_noun(fruits).
noun(fungus).
is_countable(fungus).
noun(fungi).
plural_of(fungus, fungi).
plural_noun(fungi).
noun(giraffe).
is_countable(giraffe).
noun(giraffes).
plural_of(giraffe, giraffes).
plural_noun(giraffes).
noun(girl).
is_countable(girl).
noun(girls).
plural_of(girl, girls).
plural_noun(girls).
noun(government).
is_countable(government).
noun(governments).
plural_of(government, governments).
plural_noun(governments).
noun(group).
is_countable(group).
noun(groups).
plural_of(group, groups).
plural_noun(groups).
noun(hand).
is_countable(hand).
noun(hands).
plural_of(hand, hands).
plural_noun(hands).
noun(hate).
noun(head).
is_countable(head).
noun(heads).
plural_of(head, heads).
plural_noun(heads).
noun(heart).
is_countable(heart).
noun(hearts).
plural_of(heart, hearts).
plural_noun(hearts).
noun(hen).
is_countable(hen).
noun(hens).
plural_of(hen, hens).
plural_noun(hens).
noun(home).
is_countable(home).
noun(homes).
plural_of(home, homes).
plural_noun(homes).
noun(horse).
is_countable(horse).
noun(horses).
plural_of(horse, horses).
plural_noun(horses).
noun(house).
is_countable(house).
noun(houses).
plural_of(house, houses).
plural_noun(houses).
noun(leg).
is_countable(leg).
noun(legs).
plural_of(leg, legs).
plural_noun(legs).
noun(lemon).
is_countable(lemon).
noun(lemons).
plural_of(lemon, lemons).
plural_noun(lemons).
noun(life).
is_countable(life).
noun(lives).
plural_of(life, lives).
plural_noun(lives).
noun(lion).
is_countable(lion).
noun(lions).
plural_of(lion, lions).
plural_noun(lions).
noun(love).
noun(man).
is_countable(man).
noun(men).
plural_of(man, men).
plural_noun(men).
noun(mink).
is_countable(mink).
noun(minks).
plural_of(mink, minks).
plural_noun(minks).
noun(month).
is_countable(month).
noun(months).
plural_of(month, months).
plural_noun(months).
noun(mouth).
is_countable(mouth).
noun(mouths).
plural_of(mouth, mouths).
plural_noun(mouths).
noun(nose).
is_countable(nose).
noun(noses).
plural_of(nose, noses).
plural_noun(noses).
noun(number).
is_countable(number).
noun(numbers).
plural_of(number, numbers).
plural_noun(numbers).
noun(orange).
is_countable(orange).
noun(oranges).
plural_of(orange, oranges).
plural_noun(oranges).
noun(organism).
is_countable(organism).
noun(organisms).
plural_of(organism, organisms).
plural_noun(organisms).
noun(part).
is_countable(part).
noun(parts).
plural_of(part, parts).
plural_noun(parts).
noun(peace).
noun(peanut).
is_countable(peanut).
noun(peanuts).
plural_of(peanut, peanuts).
plural_noun(peanuts).
noun(pear).
is_countable(pear).
noun(pears).
plural_of(pear, pears).
plural_noun(pears).
noun(person).
is_countable(person).
noun(persons).
plural_of(person, persons).
plural_noun(persons).
is_collective(people).
noun(people).
collective_of(person, people).
collective_noun(people).
is_collective(peoples).
noun(peoples).
plural_of(people, peoples).
plural_collective_of(person, peoples).
plural_collective_noun(peoples).
noun(pig).
is_countable(pig).
noun(pigs).
plural_of(pig, pigs).
plural_noun(pigs).
noun(place).
is_countable(place).
noun(places).
plural_of(place, places).
plural_noun(places).
noun(plane).
is_countable(plane).
noun(planes).
plural_of(plane, planes).
plural_noun(planes).
noun(plant).
is_countable(plant).
noun(plants).
plural_of(plant, plants).
plural_noun(plants).
noun(point).
is_countable(point).
noun(points).
plural_of(point, points).
plural_noun(points).
noun(pride).
noun(problem).
is_countable(problem).
noun(problems).
plural_of(problem, problems).
plural_noun(problems).
noun(prokaryote).
is_countable(prokaryote).
noun(prokaryotes).
plural_of(prokaryote, prokaryotes).
plural_noun(prokaryotes).
noun(protist).
is_countable(protist).
noun(protists).
plural_of(protist, protists).
plural_noun(protists).
noun(reptile).
is_countable(reptile).
noun(reptiles).
plural_of(reptile, reptiles).
plural_noun(reptiles).
noun(rooster).
is_countable(rooster).
noun(roosters).
plural_of(rooster, roosters).
plural_noun(roosters).
noun(sheep).
is_countable(sheep).
noun(sheep).
plural_of(sheep, sheep).
plural_noun(sheep).
noun(snake).
is_countable(snake).
noun(snakes).
plural_of(snake, snakes).
plural_noun(snakes).
noun(soldier).
is_countable(soldier).
noun(soldiers).
plural_of(soldier, soldiers).
plural_noun(soldiers).
noun(strawberry).
is_countable(strawberry).
noun(strawberries).
plural_of(strawberry, strawberries).
plural_noun(strawberries).
noun(table).
is_countable(table).
noun(tables).
plural_of(table, tables).
plural_noun(tables).
noun(thing).
is_countable(thing).
noun(things).
plural_of(thing, things).
plural_noun(things).
noun(time).
is_countable(time).
noun(times).
plural_of(time, times).
plural_noun(times).
noun(tree).
is_countable(tree).
noun(trees).
plural_of(tree, trees).
plural_noun(trees).
noun(truck).
is_countable(truck).
noun(trucks).
plural_of(truck, trucks).
plural_noun(trucks).
noun(vehicle).
is_countable(vehicle).
noun(vehicles).
plural_of(vehicle, vehicles).
plural_noun(vehicles).
noun(walnut).
is_countable(walnut).
noun(walnuts).
plural_of(walnut, walnuts).
plural_noun(walnuts).
noun(way).
is_countable(way).
noun(ways).
plural_of(way, ways).
plural_noun(ways).
noun(week).
is_countable(week).
noun(weeks).
plural_of(week, weeks).
plural_noun(weeks).
noun(wing).
is_countable(wing).
noun(wings).
plural_of(wing, wings).
plural_noun(wings).
noun(woman).
is_countable(woman).
noun(women).
plural_of(woman, women).
plural_noun(women).
noun(work).
is_countable(work).
noun(works).
plural_of(work, works).
plural_noun(works).
noun(world).
is_countable(world).
noun(worlds).
plural_of(world, worlds).
plural_noun(worlds).
noun(year).
is_countable(year).
noun(years).
plural_of(year, years).
plural_noun(years).
% Verbs
:- discontiguous transitive_v/1, intransitive_v/1, conjugation/2.
conjugation(be, conj(am, are, is, are, are, are, was, were, was, were, were, were)).
transitive_v(be).
intransitive_v(be).
conjugation(have, conj(have, have, has, have, have, have, had, had, had, had, had, had)).
transitive_v(have).
intransitive_v(have).
% Relationships child of
:- multifile child_of/2.
:- discontiguous child_of/2.
child_of(fruit, apple).
child_of(fruit, pear).
child_of(fruit, berry).
child_of(fruit, citrus).
child_of(citrus, orange).
child_of(citrus, lemon).
child_of(berry, banana).
child_of(berry, avocado).
child_of(berry, blueberry).
child_of(child, boy).
child_of(child, girl).
child_of(animal, mammal).
child_of(animal, bird).
child_of(animal, reptile).
child_of(extremity, arm).
child_of(extremity, leg).
child_of(feline, cat).
child_of(feline, lion).
child_of(canine, dog).
child_of(bird, hen).
child_of(bird, duck).
child_of(bird, rooster).
child_of(mammal, bear).
child_of(mammal, cow).
child_of(mammal, pig).
child_of(mammal, sheep).
child_of(mammal, mink).
child_of(mammal, elephant).
child_of(mammal, giraffe).
child_of(mammal, feline).
child_of(mammal, canine).
child_of(reptile, snake).
child_of(building, house).
child_of(person, man).
child_of(person, woman).
child_of(person, child).
child_of(vehicle, truck).
child_of(vehicle, car).
child_of(vehicle, plane).
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
:- multifile give/3.
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
give(bird, 1, feather).
give(bird, 1, wing).
% Relationships make
:- multifile make/2.
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
make(extremity, long).
make(car, fast).
make(car, heavy).
make(child, young).
make(child, small).
make(orange, orange).
make(orange, small).
make(pear, green).
make(pear, small).
make(fruit, juicy).
make(berry, sweet).
make(organism, alive).
make(citrus, sour).
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
