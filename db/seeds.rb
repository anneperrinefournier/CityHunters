# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Game.destroy_all
User.destroy_all
Storyline.destroy_all
Place.destroy_all
Riddle.destroy_all
Clue.destroy_all
p "destroyed #{Game.all.count} games"
p "destroyed #{User.all.count} users"
p "destroyed #{Storyline.all.count} storylines"
p "destroyed #{Place.all.count} places"
p "destroyed #{Riddle.all.count} riddles"
p "destroyed #{Clue.all.count} clues"

User.create!(email: "john@example.com", password: "password")

monica = User.new(
  email: 'monica@gmail.com',
  password: 'password',
  name: 'monica',
  level: 3,
  xp: 310
)
joey = User.new(
  email: 'joey@gmail.com',
  password: 'password',
  name: 'joey',
  level: 2,
  xp: 230
)
monica.save!
joey.save!

storyline1 = Storyline.new(
  title: "Le Secret du Louvre",
  district: "1er arrondissement",
  duration: 60,
  distance: 2,
  theme: "historique",
  difficulty: 2,
  starting_point: "Louvre Museum, Rue de Rivoli, 75001 Paris, France",
  short_description: "Découvrez les mystères cachés dans les galeries du Louvre. Suivez les indices artistiques et percez le secret qui se cache derrière chaque chef-d'œuvre.",
  long_description: "Plongez dans l'histoire de l'art au cœur du 1er arrondissement. Le Louvre, berceau d'innombrables trésors, cache des mystères inexplorés. Parcourez les galeries emblématiques, résolvez des énigmes artistiques, et percez le secret qui se cache derrière chaque chef-d'œuvre.",
  introduction: "Ceci est une magnifique introduction aillant pour seul et unique but de combler un vide, un vide dans l'application, un vide dans la modale, un vide... dans mon coeur..."
)
storyline1.save!

storyline2 = Storyline.new(
  title: "Les Énigmes du Marais",
  district: "4e arrondissement",
  duration: 75,
  distance: 3,
  theme: "historique",
  difficulty: 2,
  starting_point: "Place des Vosges, 75004 Paris, France",
  short_description: "Plongez dans l'histoire médiévale du Marais. Résolvez des énigmes historiques et dévoilez les secrets des ruelles pavées de ce quartier emblématique.",
  long_description: "Explorez le charme médiéval du 4e arrondissement. Le Marais, témoin de l'histoire de Paris, recèle des secrets à chaque coin de rue. Suivez les énigmes historiques, parcourez les ruelles pavées et dévoilez les mystères cachés de ce quartier emblématique."
)
storyline2.save!

storyline3 = Storyline.new(
  title: "L'Odyssée du Château",
  district: "19e arrondissement",
  duration: 90,
  distance: 5,
  theme: "aventure",
  difficulty: 3,
  starting_point: "Parc des Buttes-Chaumont, 1 Rue Botzaris, 75019 Paris, France",
  short_description: "Partez à l'aventure autour du Parc des Buttes-Chaumont. Résolvez des énigmes épiques et découvrez les mystères cachés de ce parc exceptionnel.",
  long_description: "Embarquez pour une odyssée inoubliable dans le 19e arrondissement. Le Parc des Buttes-Chaumont vous réserve des défis épiques. Résolvez des énigmes, explorez des recoins cachés et découvrez les mystères qui se cachent au cœur de ce parc exceptionnel."
)
storyline3.save!

storyline4 = Storyline.new(
  title: "Les Légendes de Belleville",
  district: "20e arrondissement",
  duration: 75,
  distance: 4,
  theme: "fantastique",
  difficulty: 2,
  starting_point: "Belleville, 20th arrondissement, Paris, France",
  short_description: "Explorez les rues de Belleville à la recherche de créatures fantastiques. Résolvez des énigmes enchantées pour percer les mystères de ce quartier féérique.",
  long_description: "Plongez dans un monde fantastique au cœur du 20e arrondissement. Belleville, quartier vibrant, abrite des créatures enchantées et des mystères féériques. Suivez les énigmes enchantées, explorez les rues animées et découvrez les légendes qui peuplent ce quartier hors du commun."
)
storyline4.save!

storyline5 = Storyline.new(
  title: "Le Trésor du Panthéon",
  district: "5e arrondissement",
  duration: 60,
  distance: 3,
  theme: "historique",
  difficulty: 2,
  starting_point: "Panthéon, 75005 Paris, France",
  short_description: "Partez à la recherche d'un trésor légendaire près du Panthéon. Résolvez des énigmes historiques et revivez l'époque glorieuse du Quartier Latin.",
  long_description: "Explorez l'histoire du 5e arrondissement à la recherche d'un trésor légendaire. Près du Panthéon, des énigmes historiques vous guideront à travers le Quartier Latin. Plongez dans le passé glorieux de ce quartier emblématique et dévoilez le trésor qui y est caché depuis des siècles."
)
storyline5.save!

storyline6 = Storyline.new(
  title: "L'Énigme de Montparnasse",
  district: "14e arrondissement",
  duration: 75,
  distance: 4.5,
  theme: "mystère",
  difficulty: 2,
  starting_point: "Montparnasse, 14th arrondissement, Paris, France",
  short_description: "Résolvez l'énigme mystérieuse de Montparnasse. Parcourez les cafés emblématiques et les ruelles cachées pour dévoiler les secrets du quartier.",
  long_description: "Plongez dans l'atmosphère mystérieuse du 14e arrondissement. Montparnasse, quartier bohème, cache une énigme intrigante. Parcourez les cafés emblématiques, explorez les ruelles cachées et dévoilez les secrets qui se cachent dans les coins méconnus de ce quartier unique."
)
storyline6.save!

storyline7 = Storyline.new(
  title: "Le Mystère des Invalides",
  district: "7e arrondissement",
  duration: 60,
  distance: 3.5,
  theme: "historique",
  difficulty: 2,
  starting_point: "Les Invalides, 75007 Paris, France",
  short_description: "Explorez le mystère des Invalides. Résolvez des énigmes historiques et découvrez les secrets militaires cachés dans ce quartier emblématique.",
  long_description: "Découvrez le mystère caché derrière les murs des Invalides, au cœur du 7e arrondissement. Des énigmes historiques vous guideront à travers ce quartier empreint d'histoire militaire. Plongez dans le passé et dévoilez les secrets qui ont forgé la destinée de ce lieu emblématique."
)
storyline7.save!

storyline8 = Storyline.new(
  title: "L'Aventure des Batignolles",
  district: "17e arrondissement",
  duration: 90,
  distance: 6,
  theme: "aventure",
  difficulty: 3,
  starting_point: "Les Batignolles, 17th arrondissement, Paris, France",
  short_description: "Vivez une aventure épiques dans les Batignolles. Résolvez des énigmes audacieuses et explorez les parcs pittoresques de ce quartier bohème.",
  long_description: "Entrez dans l'aventure au cœur du 17e arrondissement. Les Batignolles, quartier bohème, regorgent de mystères et de défis audacieux. Résolvez des énigmes complexes, explorez les parcs pittoresques et vivez une aventure épiques dans ce coin de Paris plein de charme."
)
storyline8.save!

storyline9 = Storyline.new(
  title: "Les Secrets du Canal Saint-Martin",
  district: "10e arrondissement",
  duration: 75,
  distance: 5,
  theme: "mystère",
  difficulty: 2,
  starting_point: "Canal Saint-Martin, 10th arrondissement, Paris, France",
  short_description: "Découvrez les secrets cachés du Canal Saint-Martin. Résolvez des énigmes mystérieuses et explorez les rives pittoresques de ce quartier branché.",
  long_description: "Plongez dans les mystères du 10e arrondissement le long du Canal Saint-Martin. Des énigmes fascinantes vous guideront à travers les rives pittoresques de ce quartier branché. Découvrez les secrets cachés sous les ponts et dans les cafés qui font la renommée de cet endroit unique."
)
storyline9.save!

storyline10 = Storyline.new(
  title: "L'Évasion de Montorgueil",
  district: "2e arrondissement",
  duration: 60,
  distance: 3.5,
  theme: "aventure",
  difficulty: 2,
  starting_point: "Montorgueil Street, 75002 Paris, France",
  short_description: "Partez pour une aventure dans le 2e arrondissement. Résolvez des énigmes captivantes et explorez les passages secrets de Montorgueil.",
  long_description: "Vivez l'évasion au cœur du 2e arrondissement. Montorgueil, quartier dynamique, recèle des énigmes captivantes et des passages secrets à découvrir. Parcourez les rues animées, résolvez des défis intriguants et plongez dans une aventure inoubliable au cœur de ce quartier emblématique de Paris."
)
storyline10.save!

place1 = Place.new(
  name: "Place Royale",
  address: "1 Place des Vosges, 75004 Paris, France",
  description: "La Place Royale, également connue sous le nom de Place des Vosges, est une place historique entourée d'élégants pavillons. Construite au XVIIe siècle, elle est le joyau du Marais.",
  longitude: 2.3667,
  latitude: 48.8553,
  storyline: storyline1
)
place1.save!

place2 = Place.new(
  name: "Palais du Louvre",
  address: "Rue de Rivoli, 75001 Paris, France",
  description: "Le Palais du Louvre, ancienne résidence royale, est aujourd'hui l'un des plus grands musées du monde. Avec ses vastes collections artistiques, il est un incontournable du 1er arrondissement.",
  longitude: 2.3377,
  latitude: 48.8606,
  storyline: storyline1
)
place2.save!

place3 = Place.new(
  name: "Église Saint-Germain-l'Auxerrois",
  address: "2 Place du Louvre, 75001 Paris, France",
  description: "Cette église, située à proximité du Louvre, est connue pour son architecture gothique et son histoire étroitement liée à la royauté française. Un lieu empreint de spiritualité et d'histoire.",
  longitude: 2.3403,
  latitude: 48.8591,
  storyline: storyline1
)
place3.save!

place4 = Place.new(
  name: "Fontaine des Innocents",
  address: "Place Joachim du Bellay, 75001 Paris, France",
  description: "La Fontaine des Innocents est une fontaine Renaissance richement décorée. Construite au XVIe siècle, elle a été déplacée à son emplacement actuel au cœur du 1er arrondissement.",
  longitude: 2.3467,
  latitude: 48.8609,
  storyline: storyline1
)
place4.save!

place5 = Place.new(
  name: "Théâtre du Châtelet",
  address: "1 Place du Châtelet, 75001 Paris, France",
  description: "Le Théâtre du Châtelet est un théâtre historique au style Belle Époque. Il est réputé pour ses productions musicales et sa contribution à la scène artistique parisienne.",
  longitude: 2.3463,
  latitude: 48.8578,
  storyline: storyline1
)
place5.save!

place6 = Place.new(
  name: "Palais Royal",
  address: "8 Rue de Montpensier, 75001 Paris, France",
  description: "Le Palais Royal, résidence autrefois royale, est entouré de jardins élégants. Avec ses colonnes rayées emblématiques et son histoire fascinante, il reste un joyau du 1er arrondissement.",
  longitude: 2.3372,
  latitude: 48.8635,
  storyline: storyline1
)
place6.save!

place7 = Place.new(
  name: "Colonnes de Buren",
  address: "Palais Royal, 75001 Paris, France",
  description: "Les Colonnes de Buren, situées dans la cour du Palais Royal, sont une installation artistique contemporaine. Leurs colonnes rayées offrent un contraste unique avec l'histoire du lieu.",
  longitude: 2.3375,
  latitude: 48.8634,
  storyline: storyline1
)
place7.save!

place8 = Place.new(
  name: "Jardins des Tuileries",
  address: "Rue de Rivoli, 75001 Paris, France",
  description: "Les Jardins des Tuileries, adjacents au Louvre, sont des jardins à la française classiques. Leur conception élégante et leurs statues impressionnantes en font un lieu de promenade incontournable.",
  longitude: 2.3266,
  latitude: 48.8635,
  storyline: storyline1
)
place8.save!

riddle1 = Riddle.new(
  title: 'Énigme 1',
  description: 'riddle 1 : horse color',
  content: 'blanc',
  question: 'Quelle est la couleur du cheval blanc d’Henri 4?',
  place: place2
)
riddle2 = Riddle.new(
  title: 'Énigme 2',
  description: 'riddle 2 : dog color',
  content: 'rouge',
  question: 'Quelle est la couleur de Pif le chien rouge?',
  place: place2
)
riddle3 = Riddle.new(
  title: 'Énigme 3',
  description: 'riddle 3 : cat color',
  content: 'noir',
  question: 'Quelle est la couleur du chat noir de la voisine?',
  place: place2
)
riddle1.save!
riddle2.save!
riddle3.save!
clue = Clue.new(
  content: 'il suffit d’écrire la couleur en fait dummy',
  riddle: riddle1
)
clue.save!

p "created #{Game.all.count} games"
p "created #{User.all.count} users"
p "created #{Storyline.all.count} storylines"
p "created #{Place.all.count} places"
p "created #{Riddle.all.count} riddles"
p "created #{Clue.all.count} clues"
