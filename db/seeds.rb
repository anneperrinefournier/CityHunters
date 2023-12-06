# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

p "destroying #{Game.all.count} games"
p "destroying #{Participation.all.count} participations"
p "destroying #{User.all.count} users"
p "destroying #{Storyline.all.count} storylines"
p "destroying #{Place.all.count} places"
p "destroying #{Riddle.all.count} riddles"
p "destroying #{Answer.all.count} answers"
p "destroying #{Clue.all.count} clues"

Game.destroy_all
Participation.destroy_all
User.destroy_all
User.all.each do |user|
  user.photo.purge
end
Storyline.destroy_all
Storyline.all.each do |storyline|
  storyline.photo.purge
end
Place.destroy_all
Place.all.each do |place|
  place.photo.purge
end
Riddle.destroy_all
Riddle.all.each do |riddle|
  riddle.photo.purge
end
Answer.destroy_all
Clue.destroy_all

monica = User.new(
  email: 'monica@gmail.com',
  password: 'password',
  name: 'Monica',
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
photo = URI.open('https://img.freepik.com/photos-gratuite/portrait-belle-jeune-femme-maquillage-yeux-charbonneux-jolie-jeune-fille-adulte-posant-au-studio-gros-plan-visage-feminin-attrayant_186202-4439.jpg')
monica.photo.attach(io: photo, filename: "monica-photo", content_type: 'image/jpg')
monica.save!
photo = URI.open('https://curiosmos.com/wp-content/uploads/2023/08/Homo-sapiens-new-lineage.jpeg')
joey.photo.attach(io: photo, filename: "joey-photo", content_type: 'image/jpeg')
joey.save!


storyline1 = Storyline.new(
  title: "Le Secret du Louvre",
  district: "1ᵉʳ arr.",
  duration: 60,
  distance: 2,
  theme: "historique",
  difficulty: 2,
  starting_point: "Rue de Rivoli, 75001 Paris, France",
  short_description: "Plonge au cœur de l'histoire du Louvre !",
  long_description: "Plonge dans l'histoire fascinante du 1ᵉʳ arrondissement de Paris, aux abords du célèbre Louvre. Pars à la découverte des ruelles pittoresques, des places historiques, et des mystères cachés entre les imposants bâtiments. À travers ce jeu de piste captivant, explore l'art urbain, déchiffre des énigmes architecturales, et perce le secret qui relie chaque coin de ce quartier empreint d'histoire et de culture.",
  introduction: "Bienvenue dans 'Le Mystère du 1ᵉʳ arrondissement', une aventure captivante qui te plongera au cœur du quartier entourant le Louvre. Loin des galeries du musée, ce jeu de piste vous invite à dévoiler les trésors cachés de l'architecture, à décoder les messages artistiques dissimulés dans les rues pavées, et à percer les mystères enfouis au sein de ce quartier emblématique de Paris. Que cette quête urbaine commence !"
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
storyline1.photo.attach(io: file, filename: "Le Secret du Louvre", content_type: "image/jpg")
storyline1.save!

storyline2 = Storyline.new(
  title: "Code Rouge",
  district: "11ᵉ arr.",
  duration: 90,
  distance: 6,
  theme: "aventure numérique",
  difficulty: 3,
  starting_point: "Le Wagon, 68 Ave Parmentier, 75011 Paris, France",
  short_description: "Pars à la recherche du Code Perdu du Wagon !",
  long_description: "Plonge dans l'univers numérique du 11ᵉ arrondissement avec 'Le Code Perdu du Wagon'. Suis les énigmes cryptiques laissées par un professeur passionné de Ruby on Rails et explore les ruelles du quartier pour dévoiler le trésor caché. Une aventure où le mystère et la programmation se rencontrent.",
  introduction: "Le Wagon, école renommée de programmation à Paris, est en émoi. Un professeur passionné a découvert un vieux manuscrit renfermant un code Ruby on Rails légendaire, mais a mystérieusement disparu. Les participants doivent décoder ses indices dispersés dans le 11ᵉ arrondissement pour révéler le trésor caché et démasquer les forces adverses cherchant à s'emparer du précieux code. La course pour le ‘Code Rouge’ commence maintenant !"
)
file = URI.open("https://i.ibb.co/SXNkWx0/re-publique.jpg")
storyline2.photo.attach(io: file, filename: "Code Rouge", content_type: "image/jpg")
storyline2.save!

storyline3 = Storyline.new(
  title: "L'Odyssée du Château",
  district: "19ᵉ arr.",
  duration: 90,
  distance: 5,
  theme: "aventure",
  difficulty: 3,
  starting_point: "Parc des Buttes-Chaumont, 1 Rue Botzaris, 75019 Paris, France",
  short_description: "Pars à l'aventure dans ce parc exceptionnel !",
  long_description: "Embarque pour une odyssée inoubliable dans le 19ᵉ arrondissement. Le Parc des Buttes-Chaumont te réserve des défis épiques. Résous des énigmes, explore des recoins cachés et découvre les mystères qui se cachent au cœur de ce parc exceptionnel.",
  introduction: "Bienvenue dans 'L'Odyssée du Château', une aventure épique dans le 19ᵉ arrondissement de Paris. Le Parc des Buttes-Chaumont te réserve des défis épiques. Résous des énigmes, explore des recoins cachés et découvre les mystères qui se cachent au cœur de ce parc exceptionnel."
)
file = URI.open("https://i.ibb.co/qgnn6Dk/buttes-chaumont.webp")
storyline3.photo.attach(io: file, filename: "L'Odyssée du Château", content_type: "image/jpg")
storyline3.save!

storyline4 = Storyline.new(
  title: "Les Légendes de Belleville",
  district: "20ᵉ arr.",
  duration: 75,
  distance: 4,
  theme: "fantastique",
  difficulty: 2,
  starting_point: "Belleville, 20th arrondissement, Paris, France",
  short_description: "Chasse les créatures fantastiques !",
  long_description: "Plonge dans un monde fantastique au cœur du 20ᵉ arrondissement. Belleville, quartier vibrant, abrite des créatures enchantées et des mystères féériques. Suis les énigmes enchantées, explore les rues animées et découvre les légendes qui peuplent ce quartier hors du commun.",
  introduction: "Bienvenue dans 'Les Légendes de Belleville', une aventure fantastique au cœur du 20ᵉ arrondissement. Belleville, quartier vibrant, abrite des créatures enchantées et des mystères féériques. Suis les énigmes enchantées, explore les rues animées et découvre les légendes qui peuplent ce quartier hors du commun."
)
file = URI.open("https://i.ibb.co/kJFHMQZ/belleville.webp")
storyline4.photo.attach(io: file, filename: "Les Légendes de Belleville", content_type: "image/jpg")
storyline4.save!

storyline5 = Storyline.new(
  title: "Le Trésor du Panthéon",
  district: "5ᵉ arr.",
  duration: 60,
  distance: 3,
  theme: "historique",
  difficulty: 2,
  starting_point: "Panthéon, 75005 Paris, France",
  short_description: "Trouve le trésor légendaire du quartier latin !",
  long_description: "Explore l'histoire du 5ᵉ arrondissement à la recherche d'un trésor légendaire. Près du Panthéon, des énigmes historiques te guideront à travers le Quartier Latin. Plonge dans le passé glorieux de ce quartier emblématique et dévoile le trésor qui y est caché depuis des siècles.",
  introduction: "Bienvenue dans 'Le Trésor du Panthéon', une quête historique au cœur du 5ᵉ arrondissement de Paris. Près du Panthéon, des énigmes historiques te guideront à travers le Quartier Latin. Plonge dans le passé glorieux de ce quartier emblématique et dévoile le trésor qui y est caché depuis des siècles."
)
file = URI.open("https://i.ibb.co/fng8pFd/pantheon.jpg")
storyline5.photo.attach(io: file, filename: "Le Trésor du Panthéon", content_type: "image/jpg")
storyline5.save!

storyline6 = Storyline.new(
  title: "L'Énigme de Montparnasse",
  district: "14ᵉ arr.",
  duration: 75,
  distance: 4.5,
  theme: "mystère",
  difficulty: 2,
  starting_point: "Montparnasse, 14th arrondissement, Paris, France",
  short_description: "Explore les ruelles pour découvrir les secrets cachés.",
  long_description: "Plonge dans l'atmosphère mystérieuse du 14ᵉ arrondissement. Montparnasse, quartier bohème, cache une énigme intrigante. Parcours les cafés emblématiques, explore les ruelles cachées et dévoile les secrets qui se cachent dans les coins méconnus de ce quartier unique.",
  introduction: "Bienvenue dans 'L'Énigme de Montparnasse', une aventure mystérieuse dans le 14ᵉ arrondissement de Paris. Montparnasse, quartier bohème, cache une énigme intrigante. Parcours les cafés emblématiques, explore les ruelles cachées et dévoile les secrets qui se cachent dans les coins méconnus de ce quartier unique."
)
file = URI.open("https://i.ibb.co/0YDtK2d/montparnasse.webp")
storyline6.photo.attach(io: file, filename: "L'Énigme de Montparnasse", content_type: "image/jpg")
storyline6.save!

storyline7 = Storyline.new(
  title: "Le Mystère des Invalides",
  district: "7ᵉ arr.",
  duration: 60,
  distance: 3.5,
  theme: "historique",
  difficulty: 2,
  starting_point: "Les Invalides, 75007 Paris, France",
  short_description: "Explore le mystère des Invalides et son histoire.",
  long_description: "Découvre le mystère caché derrière les murs des Invalides, au cœur du 7ᵉ arrondissement. Des énigmes historiques te guideront à travers ce quartier empreint d'histoire militaire. Plonge dans le passé et dévoile les secrets qui ont forgé la destinée de ce lieu emblématique.",
  introduction: "Bienvenue dans 'Le Mystère des Invalides', une aventure historique au cœur du 7ᵉ arrondissement de Paris. Des énigmes historiques te guideront à travers ce quartier empreint d'histoire militaire. Plonge dans le passé et dévoile les secrets qui ont forgé la destinée de ce lieu emblématique."
)
file = URI.open("https://i.ibb.co/1q2Cdg7/paris-2775393-1280.jpg")
storyline7.photo.attach(io: file, filename: "Le Mystère des Invalides", content_type: "image/jpg")
storyline7.save!

storyline8 = Storyline.new(
  title: "L'Aventure des Batignolles",
  district: "17ᵉ arr.",
  duration: 90,
  distance: 6,
  theme: "aventure",
  difficulty: 3,
  starting_point: "Les Batignolles, 17th arrondissement, Paris, France",
  short_description: "Vis une aventure épique dans les Batignolles.",
  long_description: "Entre dans l'aventure au cœur du 17ᵉ arrondissement. Les Batignolles, quartier bohème, regorgent de mystères et de défis audacieux. Résous des énigmes complexes, explore les parcs pittoresques et vis une aventure épique dans ce coin de Paris plein de charme.",
  introduction: "Bienvenue dans 'L'Aventure des Batignolles', une aventure épique dans le 17ᵉ arrondissement de Paris. Les Batignolles, quartier bohème, regorgent de mystères et de défis audacieux. Résous des énigmes complexes, explore les parcs pittoresques et vis une aventure épique dans ce coin de Paris plein de charme."
)
file = URI.open("https://i.ibb.co/cv86qGz/17e.webp")
storyline8.photo.attach(io: file, filename: "L'Aventure des Batignolles", content_type: "image/jpg")
storyline8.save!
#
storyline9 = Storyline.new(
  title: "Les Secrets du Canal Saint-Martin",
  district: "10ᵉ arr.",
  duration: 75,
  distance: 5,
  theme: "mystère",
  difficulty: 2,
  starting_point: "Canal Saint-Martin, 10th arrondissement, Paris, France",
  short_description: "Découvre les secrets du Canal Saint-Martin.",
  long_description: "Plonge dans les mystères du 10ᵉ arrondissement le long du Canal Saint-Martin. Des énigmes fascinantes te guideront à travers les rives pittoresques de ce quartier branché. Découvre les secrets cachés sous les ponts et dans les cafés qui font la renommée de cet endroit unique.",
  introduction: "Bienvenue dans 'Les Secrets du Canal Saint-Martin', une aventure mystérieuse dans le 10ᵉ arrondissement de Paris. Des énigmes fascinantes te guideront à travers les rives pittoresques de ce quartier branché. Découvre les secrets cachés sous les ponts et dans les cafés qui font la renommée de cet endroit unique."
)
file = URI.open("https://www.pariszigzag.fr/wp-content/uploads/2021/06/shutterstock_247992964-e1624458172598.jpg")
storyline9.photo.attach(io: file, filename: "Les Secrets du Canal Saint-Martin", content_type: "image/jpg")
storyline9.save!
#
storyline10 = Storyline.new(
  title: "L'Évasion de Montorgueil",
  district: "2ᵉ arr.",
  duration: 60,
  distance: 3.5,
  theme: "aventure",
  difficulty: 2,
  starting_point: "Montorgueil Street, 75002 Paris, France",
  short_description: "Découvre les passages secrets de Montorgueil !",
  long_description: "Vis l'évasion au cœur du 2ᵉ arrondissement. Montorgueil, quartier dynamique, recèle des énigmes captivantes et des passages secrets à découvrir. Parcours les rues animées, résous des défis intriguants et plonge dans une aventure inoubliable au cœur de ce quartier emblématique de Paris.",
  introduction: "Bienvenue dans 'L'Évasion de Montorgueil', une aventure captivante dans le 2ᵉ arrondissement de Paris. Montorgueil, quartier dynamique, recèle des énigmes captivantes et des passages secrets à découvrir. Parcours les rues animées, résous des défis intriguants et plonge dans une aventure inoubliable au cœur de ce quartier emblématique de Paris."
)
file = URI.open("https://i.ibb.co/VCdBMg3/montorgueil.webp")
storyline10.photo.attach(io: file, filename: "L'Évasion de Montorgueil", content_type: "image/jpg")
storyline10.save!

storyline11 = Storyline.new(
  title: "Les Énigmes du Marais",
  district: "4ᵉ arr.",
  duration: 75,
  distance: 3,
  theme: "historique",
  difficulty: 2,
  starting_point: "Place des Vosges, 75004 Paris, France",
  short_description: "Explore l'histoire médiévale du Marais !",
  long_description: "Explore le charme médiéval du 4ᵉ arrondissement. Le Marais, témoin de l'histoire de Paris, recèle des secrets à chaque coin de rue. Suis les énigmes historiques, parcours les ruelles pavées et dévoile les mystères cachés de ce quartier emblématique.",
  introduction: "Bienvenue dans 'Les Énigmes du Marais', une aventure historique dans le 4ᵉ arrondissement de Paris. Les ruelles pavées du Marais cachent des secrets médiévaux à découvrir. Résous les énigmes historiques et plonge-toi dans l'atmosphère envoûtante de ce quartier emblématique."
)
file = URI.open("https://i.ibb.co/kcDr0vf/marais.jpg")
storyline11.photo.attach(io: file, filename: "Les Énigmes du Marais", content_type: "image/jpg")
storyline11.save!


place1 = Place.new(
  name: "Place Royale",
  address: "1 Place des Vosges, 75004 Paris, France",
  description: "La Place Royale, également connue sous le nom de Place des Vosges, est une place historique entourée d'élégants pavillons. Construite au XVIIe siècle, elle est le joyau du Marais.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/zPRMvVy/vosges.jpg")
place1.photo.attach(io: file, filename: "Vosges", content_type: "image/jpg")
place1.save!

place2 = Place.new(
  name: "Palais du Louvre",
  address: "Rue de Rivoli, 75001 Paris, France",
  description: "Le Palais du Louvre, ancienne résidence royale, est aujourd'hui l'un des plus grands musées du monde. Avec ses vastes collections artistiques, il est un incontournable du 1ᵉʳ arrondissement.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place2.photo.attach(io: file, filename: "Louvres", content_type: "image/jpg")
place2.save!

place3 = Place.new(
  name: "Église Saint-Germain-l'Auxerrois",
  address: "2 Place du Louvre, 75001 Paris, France",
  description: "Cette église, située à proximité du Louvre, est connue pour son architecture gothique et son histoire étroitement liée à la royauté française. Un lieu empreint de spiritualité et d'histoire.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/KhjR0L8/saint-germains.jpg")
place3.photo.attach(io: file, filename: "St germain", content_type: "image/jpg")
place3.save!

place4 = Place.new(
  name: "Fontaine des Innocents",
  address: "Place Joachim du Bellay, 75001 Paris, France",
  description: "La Fontaine des Innocents est une fontaine Renaissance richement décorée. Construite au XVIe siècle, elle a été déplacée à son emplacement actuel au cœur du 1ᵉʳ arrondissement.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place4.photo.attach(io: file, filename: "Louvres", content_type: "image/jpg")
place4.save!

place5 = Place.new(
  name: "Théâtre du Châtelet",
  address: "1 Place du Châtelet, 75001 Paris, France",
  description: "Le Théâtre du Châtelet est un théâtre historique au style Belle Époque. Il est réputé pour ses productions musicales et sa contribution à la scène artistique parisienne.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place5.photo.attach(io: file, filename: "Louvres", content_type: "image/jpg")
place5.save!

place6 = Place.new(
  name: "Palais Royal",
  address: "8 Rue de Montpensier, 75001 Paris, France",
  description: "Le Palais Royal, résidence autrefois royale, est entouré de jardins élégants. Avec ses colonnes rayées emblématiques et son histoire fascinante, il reste un joyau du 1ᵉʳ arrondissement.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place6.photo.attach(io: file, filename: "Louvres", content_type: "image/jpg")
place6.save!

place7 = Place.new(
  name: "Colonnes de Buren",
  address: "Palais Royal, 75001 Paris, France",
  description: "Les Colonnes de Buren, situées dans la cour du Palais Royal, sont une installation artistique contemporaine. Leurs colonnes rayées offrent un contraste unique avec l'histoire du lieu.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place7.photo.attach(io: file, filename: "Louvres", content_type: "image/jpg")
place7.save!

place8 = Place.new(
  name: "Jardins des Tuileries",
  address: "Rue de Rivoli, 75001 Paris, France",
  description: "Les Jardins des Tuileries, adjacents au Louvre, sont des jardins à la française classiques. Leur conception élégante et leurs statues impressionnantes en font un lieu de promenade incontournable.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place8.photo.attach(io: file, filename: "Louvres", content_type: "image/jpg")
place8.save!


riddle1 = Riddle.new(
  title: 'Horse color',
  description: 'riddle 1 : horse color',
  solution: 'blanc',
  question: 'Quelle est la couleur du cheval blanc d’Henri 4?',
  place: place1
)
riddle2 = Riddle.new(
  title: 'Dog color',
  description: 'riddle 2 : dog color',
  solution: 'rouge',
  question: 'Quelle est la couleur de Pif le chien rouge?',
  place: place1
)
riddle3 = Riddle.new(
  title: 'Cat color',
  description: 'riddle 3 : neighbor cat color',
  solution: 'noir',
  question: 'Quelle est la couleur du chat noir de la voisine?',
  place: place1
)

riddle4 = Riddle.new(
  title: 'Horse color',
  description: 'riddle 1 : alexis cat color',
  solution: 'crème',
  question: 'Quelle est la couleur du chat d’Alexis ?',
  place: place2
)

riddle5 = Riddle.new(
  title: 'Horse color',
  description: 'riddle 1 : ap cat color',
  solution: 'brun',
  question: 'Quelle est la couleur du chat d’AP ?',
  place: place2
)

riddle6 = Riddle.new(
  title: 'Horse color',
  description: 'riddle 1 : horse color',
  solution: 'snow',
  question: 'Comment s’appelle le chat de Diane ?',
  place: place2
)
riddle1.save!
riddle2.save!
riddle3.save!
riddle4.save!
riddle5.save!
riddle6.save!

clue = Clue.new(
  content: 'il suffit d’écrire la couleur en fait dummy',
  riddle: riddle1
)
clue.save!

game1 = Game.new(
  status: 0,
  start_time: DateTime.now,
  end_time: DateTime.now + 1.hour,
  user: monica,
  storyline: storyline1
)
game1.save!
game1.pin = "AZER"
game1.save

participation = Participation.new(
  latitude: 48.8641,
  longitude: 2.3753,
  user: monica,
  game: Game.last
)
participation.save!

answer1 = Answer.new(
  content: "Blablabla",
  correct: true,
  game: game1,
  riddle: riddle1,
  participation: participation
)
answer1.save!

answer2 = Answer.new(
  content: "Blablabla",
  correct: true,
  game: game1,
  riddle: riddle2,
  participation: participation
)
answer2.save!

answer3 = Answer.new(
  content: "Blablabla",
  correct: true,
  game: game1,
  riddle: riddle3,
  participation: participation
)
answer3.save!

answer4 = Answer.new(
  content: "Blablabla",
  correct: true,
  game: game1,
  riddle: riddle4,
  participation: participation
)
answer4.save!

answer5 = Answer.new(
  content: "Blablabla",
  correct: false,
  game: game1,
  riddle: riddle5,
  participation: participation
)
answer5.save!

answer6 = Answer.new(
  content: "Blablabla",
  correct: false,
  game: game1,
  riddle: riddle6,
  participation: participation
)
answer6.save!



p "created #{Game.all.count} games"
p "created #{Participation.all.count} participations"
p "created #{User.all.count} users"
p "created #{Storyline.all.count} storylines"
p "created #{Place.all.count} places"
p "created #{Riddle.all.count} riddles"
p "created #{Answer.all.count} answers"
p "created #{Clue.all.count} clues"
