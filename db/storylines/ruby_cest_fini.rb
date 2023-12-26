# Storyline
storyline = create_or_update(
  Storyline.new(
    title: "Ruby, c'est finiii",
    district: "11ᵉ arr.",
    duration: 20,
    distance: 6,
    theme: "grosse teuf",
    difficulty: 3,
    short_description: "Party of your life",
    long_description: "Comment se rendre à une soirée épique de fin de batch après deux mois de code intensif.",
    introduction: "Vous êtes épuisés. Épuisés, mais ravi, encore portés par l’adrénaline de cette journée. Deux mois intenses viennent de s’écouler dans les murs du Wagon. Votre application n’a pas crashé pendant la démonstration (enfin on espère ^^). Maintenant s’ouvre devant vous le scintillement d’une soirée trépidante. Pas de controller en vue, c’est le moment d’oublier tout vos bundle install et autres folles gem, queryselector et elsif, bootstrap et fetch…c’est le moment pour un rm-rf de qualité, un reboot complet, délestez-vous de vos git push origin (master??) en fredonnant 'Ruby, c'est finiiiii, et dire que c'était le code de mon premier amoooour !'",
  ), {
    filename: "teuf",
    url: "https://media.sudouest.fr/16036980/1000x500/20230723111519-copiedebi7963.jpg?v=1690178400",
    content_type: "image/jpg"
  }
)


# Places
place1 = create_or_update(
  Place.new(
    name: "Le Wagon",
    address: "68 Avenue Parmentier, 75011 Paris",
    description: "Alors en route, get/batch_party_path(bière), alcools.querySelectorAll(« babyguinness »), soirée.addEventListener('danse' -> Soirée.new(batch_party)",
    storyline: storyline
  ), {
    filename: "LeWagon",
    url: "https://i.ibb.co/Kmjtv1T/le-wagon.jpg",
    content_type: "image/jpg"
  }
)


place2 = create_or_update(
  Place.new(
    name: "Lycée Charles Péguy",
    storyline: storyline,
    address: "80 avenue Parmentier, 75004 Paris, France",
    description: ""
  ), {
    filename: "Lycée Charles Péguy",
    url: "https://slack-imgs.com/?c=1&o1=ro&url=http%3A%2F%2Fwww.edarchitectes.net%2Fsite%2Fpeguy%2Fed_lycee_peguy_2.jpg",
    content_type: "image/jpg"
  }
)

place3 = create_or_update(
  Place.new(
    name: "Metro Parmentier",
    storyline: storyline,
    address: "90 avenue Parmentier, 75004 Paris, France",
    description: "Yes la bonne réponse était Parmentier ( par - 'ment' - 'T.A.' )\n
    Du nom de ce bon vieux Antoine qui a importé la patate en France au XVIIIeme siècle et qui a laissé son nom au fameux hachis."
  ), {
    filename: "metro_parmentier",
    url: "https://p.monumentum.fr/galerie/maxi/00446/446476-francais-entree-de-la-station-de-metro-parmentier-avenue-parmentier-paris.jpg",
    content_type: "image/jpg"
  }
)

place4 = create_or_update(
  Place.new(
    name: "104",
    address: "99 avenue Jean Jaurès, 75019 Paris",
    description: "",
    storyline: storyline,
  ), {
    filename: "Frères-Lumière",
    url: "https://static.nationalgeographic.fr/files/styles/image_3200/public/01-auguste-louis-lumiere.jpg?w=710&h=788",
    content_type: "image/jpg"
  }
)

# Riddles
riddle1 = Riddle.find_or_create_by(title: "Chat de Diane", place: place1)
riddle1.description = 'Une première enigme pour se chauffer,'
riddle1.question = "Quel est le nom du chat de Diane?"
riddle1.solution = "swan"
riddle1.motion_type = 'static'
riddle1.save!

riddle2 = Riddle.find_or_create_by(title: 'Trouver le lycée', place: place1)
riddle2.description = "Maintenant, il est temps de sortir du Wagon et de rejoindre le bar.Enigme pour aller au deuxième lieu:\n
Le lieu se situe avenue parmentier.\n
Le numéro de l’avenue correspond à 4 fois l’âge d’une chanson célèbre de Pierre Bachelet.\n

Il s’agit d’un lieu d’apprentissage, mais ce n’est pas le wagon. Il faut un code pour y entrer, mais ce n’est pas en ruby. If age > 18 tu as peu de chance d’y aller encore, à moins d’en avoir fait son métier.
Son nom est celui d’un écrivain français du début du XXème siècle, connu pour ses poèmes et ses cahiers, mort au front en 1914."
riddle2.question = "Va à l’adresse et valide ta position!"
riddle2.motion_type = 'shifting'
riddle2.solution = "salut"
riddle2.save!

riddle3 = Riddle.find_or_create_by(title: 'Rejoindre le métro', place: place2)
riddle3.description = "Félicitations!Après le Lycée Charles Peguy il faut maintenant rejoindre une station de métro depuis ta position.\nPetite devinette:
\nMon premier est un adverbe
\nMon deuxième ne dit pas la vérité
\nMon troisième est l’appellation d’un prof assistant du wagon."
riddle3.question = "Rejoins la station de métro en question"
riddle3.solution = "parmentier"
riddle3.motion_type = 'shifting'
riddle3.save!

riddle4 = Riddle.find_or_create_by(title: 'Sortie de métro', place: place3)
riddle4.description = "Rentre dans le métro Parmentier.
Pour éviter les problèmes de connexion dans le métro on vous donne la suite du trajet:
Prendre la 3 jusqu’à Répu puis la 5 direction Bobigny\n
Il ne reste plus qu’à trouver la bonne sortie:Enigme de dèv:\n
riddle = “Quel est le nom de famille des frères qui ont inventé le cinéma”\n
answer = ????\n
answer = answer.chars\n
subway_exit = answer.insert(1, 'A').join"
riddle4.question = "subway_exit = ??? (l'écrire sans accent)"
riddle4.motion_type = 'static'
riddle4.solution = "laumiere"
riddle4.save!

riddle5 = Riddle.find_or_create_by(title: 'Qui suis-je?', place: place3)
riddle5.description = "La prochaine enigme à trouver est un peu plus chaude, elle te donne l’adresse vers laquelle aller en sortant du métro.
D’abord le nom de la rue/avenue/boulevard : Je suis un homme d'État français, Mon nom résonne comme un cri de paix. Engagé pour les droits des travailleurs, Mon combat était empreint de ferveur.
J'ai défendu la justice sociale, Contre les inégalités, je m'étale. Assassiné pour mes idées ardentes, Mon nom reste synonyme de résistance.’
(écrire seulement le prénom et nom avec accents) "
riddle5.question = "Qui suis-je?"
riddle5.solution = "jean jaurès"
riddle5.motion_type = 'static'
riddle5.save!

riddle6 = Riddle.find_or_create_by(title: 'Numéro de rue', place: place3)
riddle6.description = "Oui c’était bien Jean Jaurès, assassiné en 1914 parce qu’il défendait une certaine idée de la France et militait pour la paix. Maintenant pour le numéro…\n
Petit bout de code à résoudre (dédicace à Romain):\n
family = Family.new\n
father = Dog.new(“Pongo”, family: family)\n
mother = Dog.new(“Perdita”, family: family)\n
street_number = family.kids.count\n
street_number = ???"
riddle6.question = "Quel est le numéro?"
riddle6.solution = "99"
riddle6.motion_type = 'static'
riddle6.save!

riddle7 = Riddle.find_or_create_by(title: 'Batch 1410', place: place4)
riddle7.description = "Nice! C'était la dernière énigme! l’adresse à valider est :
99 avenue Jean Jaurès

Pour la suite, l’adresse du bar étant  dans l’invit slack ça n'avait pas trop d’intérêt de la faire deviner, donc on se retrouve au bar Belushi's Paris Canal, 159 rue de Crimée, 75019 Paris

des bécots de la team CityHunters,
AP, Alexis, Henri et Pif\n
\n
Répondre 'Batch1410' pour terminer la partie"
riddle7.motion_type = 'static'
riddle7.solution = "Batch1410"
riddle7.save!
