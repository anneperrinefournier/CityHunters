require "open-uri"
require_relative "create_or_update"

# Creating users
require_relative 'users/dev_users'

# Importing storylines
require_relative 'storylines/ruby_cest_fini'
require_relative 'storylines/code_rouge'
require_relative 'storylines/food_call'
# require_relative 'storylines/test_stories'

# Checking that all places have address
=======
#   Des senteurs alléchantes émanent des cuisines dissimulées derrière les devantures de restaurant, des échoppes et des étals de marché. Chaque recoin de cette ville vous attire et vous offre des promesses gastronomiques, avec l'espoir de combler votre faim insatiable.

#   Entre les badauds affairés et les passants pressés, vous poursuivez votre quête, scrutant les enseignes alléchantes, à la recherche du festin parfait. Chaque boulangerie, chaque café et chaque stand coloré éveille votre appétit et fait frémir vos sens. Vous êtes déterminé à découvrir ce met délicieux, à dénicher ce plat réconfortant capable de satisfaire vos désirs les plus profonds."
# )
# file = URI.open("https://www.sofoodmag.fr/wp-content/uploads/2013/02/wpid-3161-avoir-faim.jpg")
# storyline.photo.attach(io: file, filename: "Alerte_Estomac", content_type: "image/jpg")
# storyline.save!

# place1 = Place.new(
#   name: "Le Wagon",
#   address: "68 Ave Parmentier, 75011 Paris, France",
#   description: "On y pleure, on y rit, mais surtout, on s'y sent bien!",
#   storyline: storyline
# )
# file = URI.open("https://studysmarter-mediafiles.s3.amazonaws.com/media/uploads/froala_editor/images/fa7583826ca3-Paris_Campus_3__3_.png")
# place1.photo.attach(io: file, filename: "lewagon", content_type: "image/jpg")
# place1.save!

#
# place3 = Place.new(
#   name: "Boulangerie Oberkampf",
#   address: "54 rue Oberkampf, 75001 Paris, France",
#   description: "Cette boulangerie me surprendra toujours, non pas tant par la quantité de ses portions, mais par sa qualité de service et son prix!",
#   storyline: storyline
# )
# file = URI.open("https://st.hzcdn.com/simgs/32d1769f03edfebf_16-1634/home-design.jpg")
# place3.photo.attach(io: file, filename: "boulangerie graine", content_type: "image/jpg")
# place3.save!
# place4 = Place.new(
#   name: place1.name,
#   address: place1.address,
#   description: place1.description,
#   storyline: storyline
# )
# file = URI.open("https://studysmarter-mediafiles.s3.amazonaws.com/media/uploads/froala_editor/images/fa7583826ca3-Paris_Campus_3__3_.png")
# place4.photo.attach(io: file, filename: "lewagon", content_type: "image/jpg")
# place4.save!

# riddle1 = Riddle.new(
#   title: "Ce que je préfère à 13h",
#   description: 'Find the next place',
#   question: "S'il y a bien une chose que je préfère quand l'heure de la soupe arrive, c'est...?",
#   solution: "manger",
#   motion_type: 'static',
#   place: place1
# )
# file = URI.open('https://fondationolo.ca/wp-content/uploads/2017/07/fondation-olo-bebe-a-faim.jpg')
# riddle1.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
# riddle1.save!
# riddle2 = Riddle.new(
#   title: "Trouvez le prochain lieu",
#   description: 'Find the next place',
#   question: "Notre première enigme est une bifurcation, l'intersection de tous les chemins de notre aventure, l'origine des séparations mais aussi parfois un point de rencontre...",
#   solution: "Lat:XXX, Lng:YYY",
#   motion_type: 'shifting',
#   place: place1
# )
# file = URI.open('https://www.unmondedaventures.fr/wp-content/uploads/2015/01/281530234-Copier.jpg')
# riddle2.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
# riddle2.save!
# riddle3 = Riddle.new(
#   title: 'Find next place',
#   description: 'Find the next place',
#   question: "Bravo! Mais cet endroit n'est que le point de passage, d'un lieu plus important encore!\nOn dit qu'on y fait les meilleurs gateaux mais mon dieu que c'est cher!",
#   solution: "Lat:XXX, Lng:YYY",
#   motion_type: 'shifting',
#   place: place2
# )
# file = URI.open('https://www.podcastfrancaisfacile.com/wp-content/uploads/2013/05/demander-son-chemin.jpg')
# riddle3.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
# riddle3.save!
# riddle4 = Riddle.new(
#   title: 'What a cake!',
#   description: 'Find cake price',
#   question: "Félicitation! Vous avez trouvé le lieux exact de notre aventure! Parmi les gateaux que je préfère, il y en a un particulièrement que je prends presque à chaque fois, saurez-vous trouver lequel? Seuls les vrais savent!",
#   solution: "citron pavot",
#   motion_type: 'static',
#   place: place3
# )
# file = URI.open('https://cdn.pratico-pratiques.com/app/uploads/sites/2/2022/05/02113329/gateau-au-citron-et-huile-d-olive.jpg')
# riddle4.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
# riddle4.save!
# riddle5 = Riddle.new(
#   title: 'What a cake!',
#   description: 'Find cake price',
#   question: "Et oui, j'adore ce gateau! Pourriez-vous noter le prix du sandwich au poulet pour moi s'il vous plaît? (A l'euro près)",
#   solution: "6€",
#   motion_type: 'static',
#   place: place3
# )
# file = URI.open('https://static.750g.com/images/600-600/0fa217fa9300b4fbea5919f9f7f38bdf/adobestock-430086029.jpg')
# riddle5.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
# riddle5.save!
# riddle6 = Riddle.new(
#   title: 'Rentrer manger',
#   description: 'Find cake price',
#   question: "Bon, je pense que l’on a tout ce qu’il faut pour s’assoir autour d’une table et manger tous ensemble ! Il va falloir en trouver une…",
#   solution: "LatLng",
#   motion_type: 'shifting',
#   place: place3
# )
# file = URI.open('https://images.ricardocuisine.com/services/articles/1200x630_manger-ensemble-1400.jpg')
# riddle6.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
# riddle6.save!
# riddle7 = Riddle.new(
#   title: 'Conclusion',
#   description: 'Conclusion aventure',
#   question: "Félicitation ! Votre expédition s'arrête ici, il est temps maintenant de savourer votre précieux butin! Bon appétit!\nEnvoyer 'thanks' pour terminer l'aventure :D",
#   solution: "thanks",
#   motion_type: 'static',
#   place: place4
# )
# file = URI.open('https://images.ricardocuisine.com/services/articles/1200x630_manger-ensemble-1400.jpg')
# riddle7.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
# riddle7.save!

# storyline bonus
storyline_bonus = Storyline.new(
  title: "Ruby, c'est finiii",
  district: "11ᵉ arr.",
  duration: 20,
  distance: 6,
  theme: "grosse teuf",
  difficulty: 3,
  starting_point: "68 avenue Parmentier, 75011 Paris, France",
  short_description: "Party of your life",
  long_description: "Comment se rendre à une soirée épique de fin de batch après deux mois de code intensif.",
  introduction: "Vous êtes épuisés. Épuisés, mais ravi, encore portés par l’adrénaline de cette journée. Deux mois intenses viennent de s’écouler dans les murs du Wagon. Votre application n’a pas crashé pendant la démonstration (enfin on espère ^^). Maintenant s’ouvre devant vous le scintillement d’une soirée trépidante. Pas de controller en vue, c’est le moment d’oublier tout vos bundle install et autres folles gem, queryselector et elsif, bootstrap et fetch…c’est le moment pour un rm-rf de qualité, un reboot complet, délestez-vous de vos git push origin (master??) en fredonnant 'Ruby, c'est finiiiii, et dire que c'était le code de mon premier amoooour !' "
)
file = URI.open("https://media.sudouest.fr/16036980/1000x500/20230723111519-copiedebi7963.jpg?v=1690178400")
storyline_bonus.photo.attach(io: file, filename: "teuf", content_type: "image/jpg")
storyline_bonus.save!

# 101
place101 = Place.new(
  name: "101",
  address: "68 Avenue Parmentier, 75011 Paris",
  description: "Alors en route, get/batch_party_path(bière), alcools.querySelectorAll(« babyguinness »), soirée.addEventListener('danse' -> Soirée.new(batch_party)",
  storyline: storyline_bonus
)
file = URI.open("https://i.ibb.co/Kmjtv1T/le-wagon.jpg")
place101.photo.attach(io: file, filename: "LeWagon", content_type: "image/jpg")
place101.save!

# 102
place102 = Place.new(
  name: "Lycée Charles Péguy",
  address: "80 avenue Parmentier, 75004 Paris, France",
  description: "",
  storyline: storyline_bonus
)
file = URI.open("https://slack-imgs.com/?c=1&o1=ro&url=http%3A%2F%2Fwww.edarchitectes.net%2Fsite%2Fpeguy%2Fed_lycee_peguy_2.jpg")
place102.photo.attach(io: file, filename: "lycee", content_type: "image/jpg")
place102.save!

# 103
place103 = Place.new(
  name: "Metro Parmentier",
  address: "90 avenue Parmentier, 75004 Paris, France",
  description: "Yes la bonne réponse était Parmentier ( par - 'ment' - 'T.A.' )\n
  Du nom de ce bon vieux Antoine qui a importé la patate en France au XVIIIeme siècle et qui a laissé son nom au fameux hachis.",
  storyline: storyline_bonus
)
file = URI.open("https://p.monumentum.fr/galerie/maxi/00446/446476-francais-entree-de-la-station-de-metro-parmentier-avenue-parmentier-paris.jpg")
place103.photo.attach(io: file, filename: "metro_parmentier", content_type: "image/jpg")
place103.save!

# 104
place104 = Place.new(
  name: "104",
  address: "99 avenue Jean Jaurès, 75019 Paris",
  description: "",
  storyline: storyline_bonus
)
file = URI.open("https://static.nationalgeographic.fr/files/styles/image_3200/public/01-auguste-louis-lumiere.jpg?w=710&h=788")
place104.photo.attach(io: file, filename: "Frères-Lumière", content_type: "image/jpg")
place104.save!

riddle101 = Riddle.new(
  title: ' ',
  description: 'Une première enigme pour se chauffer,',
  question: "Quel est le nom du chat de Diane?",
  solution: "swan",
  motion_type: 'static',
  place: place101
)
riddle101.save!

riddle102 = Riddle.new(
  title: ' ',
  description: "Maintenant, il est temps de sortir du Wagon et de rejoindre le bar.Enigme pour aller au deuxième lieu:\n
  Le lieu se situe avenue parmentier.\n
  Le numéro de l’avenue correspond à 4 fois l’âge d’une chanson célèbre de Pierre Bachelet.\n

  Il s’agit d’un lieu d’apprentissage, mais ce n’est pas le wagon. Il faut un code pour y entrer, mais ce n’est pas en ruby. If age > 18 tu as peu de chance d’y aller encore, à moins d’en avoir fait son métier.
  Son nom est celui d’un écrivain français du début du XXème siècle, connu pour ses poèmes et ses cahiers, mort au front en 1914.",
  question: "Va à l’adresse et valide ta position!",
  motion_type: 'shifting',
  solution: "salut",
  place: place101
)
riddle102.save!

riddle103 = Riddle.new(
  title: ' ',
  description: "Félicitations!Après le Lycée Charles Peguy il faut maintenant rejoindre une station de métro depuis ta position.\nPetite devinette:
  \nMon premier est un adverbe
  \nMon deuxième ne dit pas la vérité
  \nMon troisième est l’appellation d’un prof assistant du wagon.",
  question: "Rejoins la station de métro en question",
  solution: "parmentier",
  motion_type: 'shifting',
  place: place102
)
riddle103.save!

riddle105 = Riddle.new(
  title: ' ',
  description: "Rentre dans le métro Parmentier.
  Pour éviter les problèmes de connexion dans le métro on vous donne la suite du trajet:
  Prendre la 3 jusqu’à Répu puis la 5 direction Bobigny\n
  Il ne reste plus qu’à trouver la bonne sortie:Enigme de dèv:\n
  riddle = “Quel est le nom de famille des frères qui ont inventé le cinéma”\n
  answer = ????\n
  answer = answer.chars\n
  subway_exit = answer.insert(1, 'A').join",
  question: "subway_exit = ??? (l'écrire sans accent)",
  motion_type: 'static',
  solution: "laumiere",
  place: place103
)
riddle105.save!


riddle106 = Riddle.new(
  title: ' ',
  description: "La prochaine enigme à trouver est un peu plus chaude, elle te donne l’adresse vers laquelle aller en sortant du métro.
  D’abord le nom de la rue/avenue/boulevard : Je suis un homme d'État français, Mon nom résonne comme un cri de paix. Engagé pour les droits des travailleurs, Mon combat était empreint de ferveur.
  J'ai défendu la justice sociale, Contre les inégalités, je m'étale. Assassiné pour mes idées ardentes, Mon nom reste synonyme de résistance.’
  (écrire seulement le prénom et nom avec accents) ",
  question: "Qui suis-je?",
  solution: "jean jaurès",
  motion_type: 'static',
  place: place103
)
riddle106.save!

riddle107 = Riddle.new(
  title: ' ',
  description: "Oui c’était bien Jean Jaurès, assassiné en 1914 parce qu’il défendait une certaine idée de la France et militait pour la paix. Maintenant pour le numéro…\n
  Petit bout de code à résoudre (dédicace à Romain):\n
  family = Family.new\n
  father = Dog.new(“Pongo”, family: family)\n
  mother = Dog.new(“Perdita”, family: family)\n
  street_number = family.kids.count\n
  street_number = ???",
  question: "Quel est le numéro?",
  solution: "99",
  motion_type: 'static',
  place: place103
)
riddle107.save!

riddle108 = Riddle.new(
  title: ' ',
  description: "Nice! C'était la dernière énigme! l’adresse à valider est :
  99 avenue Jean Jaurès

  Pour la suite, l’adresse du bar étant  dans l’invit slack ça n'avait pas trop d’intérêt de la faire deviner, donc on se retrouve au bar Belushi's Paris Canal, 159 rue de Crimée, 75019 Paris

  des bécots de la team CityHunters,
  AP, Alexis, Henri et Pif\n
  \n
  Répondre 'Batch1410' pour terminer la partie",
  motion_type: 'static',
  solution: "Batch1410",
  place: place104
)
riddle108.save!

Place.all.each do |place|
  if place.latitude.nil? || place.longitude.nil?
    p "place #{place.name} has incorrect address"
  end
end
