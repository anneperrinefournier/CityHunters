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
  theme: "technologie",
  difficulty: 3,
  starting_point: "68 avenue Parmentier, 75011 Paris, France",
  short_description: "Pars à la recherche du Code Perdu du Wagon !",
  long_description: "Suis les énigmes cryptiques pour retrouver le code perdu du wagon à travers les ruelles du quartier. Une aventure où le mystère et la programmation se rencontrent.",
  introduction: "Tout va pour le mieux au Wagon quand soudain, un cri se fait entendre : le Code Rouge a disparu !\nPierre de rosette des développeurs, le Code Rouge est un vieux manuscrit qui renferme une librairie de langage légendaire : Ruby on Rails ! Découvert par le professeur Hansson, le précieux code avait été mis en sécurité dans un coffre-fort.\nHeureusement, le voleur a laissé des indices… Il n’y a plus qu’à les suivre pour espérer retrouver le Code Rouge !"
)
file = URI.open("https://i.ibb.co/SXNkWx0/re-publique.jpg")
storyline2.photo.attach(io: file, filename: "Code Rouge", content_type: "image/jpg")
storyline2.save!

storyline3 = Storyline.new(
  title: "L’Odyssée du Château",
  district: "19ᵉ arr.",
  duration: 90,
  distance: 5,
  theme: "nature",
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
  title: "Meurtre à Montparnasse",
  district: "14ᵉ arr.",
  duration: 75,
  distance: 4.5,
  theme: "policier",
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
  title: "Le Secret des Batignolles",
  district: "17ᵉ arr.",
  duration: 90,
  distance: 6,
  theme: "nature",
  difficulty: 3,
  starting_point: "Les Batignolles, 17th arrondissement, Paris, France",
  short_description: "Vis une aventure épique dans les Batignolles.",
  long_description: "Entre dans l'aventure au cœur du 17ᵉ arrondissement. Les Batignolles, quartier bohème, regorgent de mystères et de défis audacieux. Résous des énigmes complexes, explore les parcs pittoresques et vis une aventure épique dans ce coin de Paris plein de charme.",
  introduction: "Bienvenue dans 'L'Aventure des Batignolles', une aventure épique dans le 17ᵉ arrondissement de Paris. Les Batignolles, quartier bohème, regorgent de mystères et de défis audacieux. Résous des énigmes complexes, explore les parcs pittoresques et vis une aventure épique dans ce coin de Paris plein de charme."
)
file = URI.open("https://i.ibb.co/cv86qGz/17e.webp")
storyline8.photo.attach(io: file, filename: "L'Aventure des Batignolles", content_type: "image/jpg")
storyline8.save!

# storyline9 = Storyline.new(
#   title: "Piège au Canal Saint-Martin",
#   district: "10ᵉ arr.",
#   duration: 75,
#   distance: 5,
#   theme: "policier",
#   difficulty: 2,
#   starting_point: "Canal Saint-Martin, 10th arrondissement, Paris, France",
#   short_description: "Découvre les secrets du Canal Saint-Martin.",
#   long_description: "Plonge dans les mystères du 10ᵉ arrondissement le long du Canal Saint-Martin. Des énigmes fascinantes te guideront à travers les rives pittoresques de ce quartier branché. Découvre les secrets cachés sous les ponts et dans les cafés qui font la renommée de cet endroit unique.",
#   introduction: "Bienvenue dans 'Les Secrets du Canal Saint-Martin', une aventure mystérieuse dans le 10ᵉ arrondissement de Paris. Des énigmes fascinantes te guideront à travers les rives pittoresques de ce quartier branché. Découvre les secrets cachés sous les ponts et dans les cafés qui font la renommée de cet endroit unique."
# )
# file = URI.open("https://www.pariszigzag.fr/wp-content/uploads/2021/06/shutterstock_247992964-e1624458172598.jpg")
# storyline9.photo.attach(io: file, filename: "Les Secrets du Canal Saint-Martin", content_type: "image/jpg")
# storyline9.save!

storyline10 = Storyline.new(
  title: "L’Évasion de Montorgueil",
  district: "2ᵉ arr.",
  duration: 60,
  distance: 3.5,
  theme: "urbain",
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
  title: "Le Mystère du Marais",
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

# place1 = Place.new(
#   name: "Place Royale",
#   address: "1 Place des Vosges, 75004 Paris, France",
#   description: "La Place Royale, également connue sous le nom de Place des Vosges, est une place historique entourée d'élégants pavillons. Construite au XVIIe siècle, elle est le joyau du Marais.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/zPRMvVy/vosges.jpg")
# place1.photo.attach(io: file, filename: "Vosges", content_type: "image/jpg")
# place1.save!

# place2 = Place.new(
#   name: "Palais du Louvre",
#   address: "Rue de Rivoli, 75001 Paris, France",
#   description: "Le Palais du Louvre, ancienne résidence royale, est aujourd'hui l'un des plus grands musées du monde. Avec ses vastes collections artistiques, il est un incontournable du 1ᵉʳ arrondissement.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
# place2.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
# place2.save!

# place3 = Place.new(
#   name: "Église Saint-Germain-l'Auxerrois",
#   address: "2 Place du Louvre, 75001 Paris, France",
#   description: "Cette église, située à proximité du Louvre, est connue pour son architecture gothique et son histoire étroitement liée à la royauté française. Un lieu empreint de spiritualité et d'histoire.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/H2dR45s/saint-germains.jpg")
# place3.photo.attach(io: file, filename: "St germain", content_type: "image/jpg")
# place3.save!

# place4 = Place.new(
#   name: "Fontaine des Innocents",
#   address: "Place Joachim du Bellay, 75001 Paris, France",
#   description: "La Fontaine des Innocents est une fontaine Renaissance richement décorée. Construite au XVIe siècle, elle a été déplacée à son emplacement actuel au cœur du 1ᵉʳ arrondissement.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
# place4.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
# place4.save!

# place5 = Place.new(
#   name: "Théâtre du Châtelet",
#   address: "1 Place du Châtelet, 75001 Paris, France",
#   description: "Le Théâtre du Châtelet est un théâtre historique au style Belle Époque. Il est réputé pour ses productions musicales et sa contribution à la scène artistique parisienne.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
# place5.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
# place5.save!

# place6 = Place.new(
#   name: "Palais Royal",
#   address: "8 Rue de Montpensier, 75001 Paris, France",
#   description: "Le Palais Royal, résidence autrefois royale, est entouré de jardins élégants. Avec ses colonnes rayées emblématiques et son histoire fascinante, il reste un joyau du 1ᵉʳ arrondissement.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
# place6.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
# place6.save!

# place7 = Place.new(
#   name: "Colonnes de Buren",
#   address: "Palais Royal, 75001 Paris, France",
#   description: "Les Colonnes de Buren, situées dans la cour du Palais Royal, sont une installation artistique contemporaine. Leurs colonnes rayées offrent un contraste unique avec l'histoire du lieu.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
# place7.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
# place7.save!

# place8 = Place.new(
#   name: "Jardins des Tuileries",
#   address: "Rue de Rivoli, 75001 Paris, France",
#   description: "Les Jardins des Tuileries, adjacents au Louvre, sont des jardins à la française classiques. Leur conception élégante et leurs statues impressionnantes en font un lieu de promenade incontournable.",
#   storyline: storyline1
# )
# file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
# place8.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
# place8.save!

place9 = Place.new(
  name: "Le Wagon",
  address: "68 Avenue Parmentier, 75011 Paris, France",
  description: "Le Wagon, refuge de l'art du code, offre un havre d'apprentissage. Dans cet écrin de savoir, découvre des programmes captivants pour tous les niveaux. Un repaire d'élégance pour les passionnés de technologie et d'innovation. Bienvenue dans l'univers du Wagon, où les compétences en programmation prennent vie.",
  storyline: storyline2
)
file = URI.open("https://i.ibb.co/Kmjtv1T/le-wagon.jpg")
place9.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place9.save!

place10 = Place.new(
  name: "Église Saint-Ambroise",
  address: "33 Avenue Parmentier, 75011 Paris",
  description: "Bienvenue à l'Église Saint-Ambroise, un trésor caché au cœur du 11ᵉ arrondissement de Paris ! Cette merveille architecturale au 71 bis Boulevard Voltaire est bien plus qu'un simple édifice religieux. Plongez dans l'histoire captivante de ce lieu chargé de mystères.",
  storyline: storyline2
)
file = URI.open("https://i.ibb.co/y0jQ7f7/saint-ambroise.jpg")
place10.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place10.save!

riddle7 = Riddle.new(
  title: 'Le logo du Wagon',
  description: 'Te voilà arrivé au point de départ, où tout a commencé : Le Wagon. C’est ici que le vol a eu lieu. Le témoin principal, Diane, t’indique que le coffre-fort était caché derrière le logo du Wagon. Tu t’approches, dans l’espoir de trouver un indice.',
  solution: 'un bus',
  question: 'Quel est le logo du Wagon ?',
  motion_type: 'static',
  place: place9
)
file = URI.open("https://i.ibb.co/pbLJw4M/wagon-riddle.png")
riddle7.photo.attach(io: file, filename: "Wagon", content_type: "image/jpg")
riddle7.save!

riddle8 = Riddle.new(
  title: 'À la poursuite du voleur',
  description: "Tu trouves derrière le logo un papier. Une énigme a été écrite dessus :\n« Où l’esprit de Voltaire flirte avec la foi,\nLe voleur du code se cache, prêt à fuir. »",
  solution: 'blablabla',
  question: 'Trouve le lieu où se cache le voleur.',
  motion_type: 'shifting',
  place: place9
)
file = URI.open("https://i.ibb.co/Xj9vkgk/Capture-d-e-cran-2023-12-07-a-16-39-58.png")
riddle8.photo.attach(io: file, filename: "Wagon", content_type: "image/jpg")
riddle8.save!

riddle9 = Riddle.new(
  title: 'Le nom du voleur',
  description: "Quand tu arrives sur place, le voleur a déjà disparu, mais il a laissé le code volé avec un mot dessus :\n« Je suis le gentleman des ombres, né d’une plume habile,\nMes prouesses rayonnent dans la nuit,\nVoleur charistmatique, je voulais le code, je le rends avec flegme. »",
  solution: 'Arsène Lupin',
  question: 'Quel est le nom du voleur ?',
  motion_type: 'static',
  place: place10
)
file = URI.open("https://i.ibb.co/7y22fs2/voleur-code.png")
riddle9.photo.attach(io: file, filename: "Wagon", content_type: "image/jpg")
riddle8.save!

riddle7.save!
riddle8.save!
riddle9.save!

clue = Clue.new(
  content: 'Je suis un moyen de locomotion.',
  riddle: riddle7
)
clue.save!

clue = Clue.new(
  content: 'Je porte le même nom que la station de métro et la rue où je me trouve.',
  riddle: riddle8
)
clue.save!

clue = Clue.new(
  content: 'Mon nom de famille fait écho au loup.',
  riddle: riddle9
)
clue.save!

# Storyline: L'appel de la bouffe
# storyline = Storyline.new(
#   title: "Alerte Estomac !",
#   district: "11ᵉ arr.",
#   duration: 15,
#   distance: 1,
#   theme: "urbain",
#   difficulty: 1,
#   starting_point: "68 avenue Parmentier, 75011 Paris, France",
#   short_description: "Pars à la recherche de ta nouriture !",
#   long_description: "Ca y est, nous y sommes! Il est 13h et l'estomac souffre et agonise, il a besoin de manger. Une seule solution, partir en quête de nourriture! Suivez cette aventure exceptiionnelle à laquelle tout le monde revient satisfait, mais surtout, le ventre plein!",
#   introduction: "Dans une ville grouillante d'activité, où les rues pavées bruissent sous les pas pressés des passants, une quête essentielle vous anime : assouvir votre faim grandissante. Ignorant l'agitation ambiante, votre estomac vous rappelle impérieusement à l'ordre, vous incitant à trouver cette nourriture revigorante qui apaisera votre appétit croissant.

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

storyline13 = Storyline.new(
  title: "Christmas time",
  district: "10ᵉ arr.",
  duration: 90,
  distance: 6,
  theme: "fantastique",
  difficulty: 3,
  starting_point: "28 rue de Bel Air, 53960 Bonchamp-lès-Laval, France",
  short_description: "Les cinq doigts de la main",
  long_description: "Noël est en danger ! Les rennes du père Noël ont disparu ! Sans eux, le père Noël ne pourra pas livrer les cadeaux ! Le coupable a cependant laissé des indices derrière lui. Suis-les pour sauver Noël !",
  introduction: "Vous êtes posés au coin du feu quand soudain, un homme avec une longue barbe blanche et un costume rouge sonne à la porte : c’est le père Noël !
  Il explique qu’il a besoin de votre aide pour retrouver ses rennes. Le ou la coupable, pour gâcher Noël, les a volés et les a éparpillés dans Bonchamp ! Heureusement, il a laissé quelques indices derrière lui… Sauve Noël et aide le père Noël à retrouver ses rennes magiques !"
)
file = URI.open("https://t3.ftcdn.net/jpg/06/68/12/48/360_F_668124876_LVDek2loS1Bgic9KxfwiiJByZ3ckuLv2.jpg")
storyline13.photo.attach(io: file, filename: "rennes", content_type: "image/jpg")
storyline13.save!

place300 = Place.new(
  name: "Maison",
  address: "28 rue de Bel Air, 53960 Bonchamp-lès-Laval, France",
  description: "La maison",
  storyline: storyline13
)
file = URI.open("https://i.ibb.co/JjbXND2/Capture-d-e-cran-2023-12-23-a-23-01-28.png")
place300.photo.attach(io: file, filename: "maison", content_type: "image/jpg")
place300.save!

place301 = Place.new(
  name: "La route du renard",
  address: "Chemin du Pont Perret, 53960 Bonchamp-lès-Laval, France",
  description: "Champ avec des chevaux.",
  storyline: storyline13
)
file = URI.open("https://www.francebleu.fr/s3/cruiser-production/2020/09/34127edc-4c43-4b0d-9a81-1e44af7c35f5/1200x680_maxnewsfrfour324703.jpg")
place301.photo.attach(io: file, filename: "route du renard", content_type: "image/jpg")
place301.save!

place302 = Place.new(
  name: "Maison abandonnée",
  address: "30 Rue Jean Mermoz, 53960 Bonchamp-lès-Laval, France",
  description: "Maison abandonnée pendant 10 ans, de la lumière semble y être enfin revenue !",
  storyline: storyline13
)
file = URI.open("https://i.ibb.co/0fctHZ7/Capture-d-e-cran-2023-12-23-a-23-35-16.png")
place302.photo.attach(io: file, filename: "maison abandonnée", content_type: "image/jpg")
place302.save!

place303 = Place.new(
  name: "Maison Marsollier",
  address: "23 Chemin Du Préfet, 53960 Bonchamp-lès-Laval, France",
  description: "Traiteur en Mayenne près de Laval. La maison Marsollier est spécialisée dans l\'organisation d'événements ; mariage, cocktail, diner d'entreprise.",
  storyline: storyline13
)
file = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/17/a9/aa/53/maison-marsolier.jpg")
place303.photo.attach(io: file, filename: "maison marsollier", content_type: "image/jpg")
place303.save!

riddle300 = Riddle.new(
  title: 'Le voleur',
  description: "Suite à la disparition des elfes, le père Noël a fait un appel à témoins. Un elfe a vu le coupable, mais les elfes ne savent parler qu'en énigmes. Voici ce qu'il a dit :\nDans l'obscurité, sous la neige qui brille,\nUn être vert au cœur d'argile.\nQui déteste Noël et tout ce qui étincelle,\nA pris les rennes, farceur rebelle.",
  question: "Qui et le coupable ?",
  motion_type: 'static',
  solution: "Grinch",
  place: place300
)
file = URI.open("https://resize-elle.ladmedia.fr/rcrop/638,,forcex/img/var/plain_site/storage/images/loisirs/cinema/dossiers/films-de-noel-notre-best-of/elfe/91201509-1-fre-FR/Elfe.jpg")
riddle300.photo.attach(io: file, filename: "Grinch", content_type: "image/jpg")
riddle300.save!

riddle301 = Riddle.new(
  title: 'À la poursuite du voleur',
  description: "En effet, c'est bien le Grinch ! Plus connu sous le nom… d'Oliver. Il accepte de te guider au premier renne, si tu lui donnes son mets favori.",
  question: "Quel est son mets favori ?",
  motion_type: 'static',
  solution: "lait",
  place: place300
)
file = URI.open("https://i.ibb.co/S0mJvXX/Capture-d-e-cran-2023-12-10-a-01-01-25.png")
riddle301.photo.attach(io: file, filename: "pomme", content_type: "image/jpg")
riddle301.save!

riddle302 = Riddle.new(
  title: 'À la recherche des rennes',
  description: "Eh oui, c'était bien le lait ! Si le père Noël aime un cookie avec un verre de lait chaud, le Grinch, lui, adore le lait. Il en raffole ! Peut-être est-il en fin de compte jaloux du père Noël ? Et si c'était pour cela qu'il détestait Noël ? Par jalousie ? Toujours est-il qu'il doit maintenant tenir sa promesse. Il saute sur la table de manger et vous montre un bout de papier. Une énigme indique où se trouve les 3 premiers rennes :\n« Là où le renard et le cheval se rencontrent,\nVous trouverez les premiers rennes. »",
  question: "Trouve le lieu où tu dois te rendre pour trouver les premiers rennes !",
  motion_type: 'shifting',
  solution: "blabla",
  place: place300
)
file = URI.open("https://www.zoologiste.com/images/xl/renne-troupeau.jpg")
riddle302.photo.attach(io: file, filename: "fraise", content_type: "image/jpg")
riddle302.save!

riddle303 = Riddle.new(
  title: '4 rennes, plus que 5 à trouver !',
  description: "Bravo, vous avez retrouvé trois rennes au milieu des chevaux dans le champ ! Plus que cinq rennes à retrouver. L'avantage, c'est qu'ils sont toujours par quatre… Alors que tu parcours la rue du renard, le Grinch, qui a décidé de vous accompagner (on ne sait jamais, s'il peut avoir un peu plus de lait), vient vers vous. Il a un petit papier attaché autour du cou. Vous le prenez pour découvrir le prochain lieu : « Dix ans sans vie, dans l'obscurité lointaine,\nUne demeure fantôme, son mystère retient la chaîne.\nPas de pas, pas de rires, seulement des échos,\nQuelle est cette maison où le temps semble figé depuis des années, sans le moindre éclat de renouveau ? »",
  question: "Où se trouve les prochains rennes à trouver ?",
  motion_type: 'shifting',
  solution: "blabla",
  place: place301
)
file = URI.open("https://i0.wp.com/www.frenchkilt.com/wp-content/uploads/2016/01/FullSizeRender-4.jpg")
riddle303.photo.attach(io: file, filename: "grinch", content_type: "image/jpg")
riddle303.save!

riddle304 = Riddle.new(
  title: 'Qui manque à l’appel ?',
  description: "Les rennes sont bien là, en train de brouter l'herbe de la maison fantôme. Vous les comptez… il y en a quatre. Cela fait donc… 5 ! Mais où est le dernier ? Vous les regardez pour savoir lequel est aux abonnés absents. Oliver apporte alors une dernirèe énigme… « Au milieu des rennes qui tirent le traîneau en vol,\nUn nez lumineux brille, comme une lueur d'étoile.\nDans la nuit étoilée, il guide le Père Noël,\nQui est ce renne, au nez si singulier, joyau irréel ? »",
  question: "Quel renne manque-t-il ?",
  motion_type: 'static',
  solution: "Rudolphe",
  place: place302
)
file = URI.open("https://image.over-blog.com/gUw352tALo2uDkzUB3i8_-SGvGc=/filters:no_upscale()/image%2F0932959%2F20211219%2Fob_ffbbed_les-rennes-3.jpg")
riddle304.photo.attach(io: file, filename: "orange", content_type: "image/jpg")
riddle304.save!

riddle305 = Riddle.new(
  title: 'Récupérer le mot',
  description: "C'est bien Rudolphe le renne qui est aux abonnés absents ! Avec son nez rouge lumineux, on le repère d'habitude facilement. C'est lui qui guide les rennes, alors il faut absolument le retrouver ! Mais où peut-il bien être ? Tu remarques soudain un ruban avec un papier autour du cou d'un des rennes. Mais il vole au-dessus du champ. Tu dois l'appeler pour qu'il vienne. Mais quel est son nom ?",
  question: "Quel est le nom du renne qui porte le mot ?",
  motion_type: 'static',
  solution: "Comète",
  place: place302
)
file = URI.open("https://ih1.redbubble.net/image.5222839526.4634/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg")
riddle305.photo.attach(io: file, filename: "raisin", content_type: "image/jpg")
riddle305.save!

riddle306 = Riddle.new(
  title: 'Rudolphe, le renne au nez rouge lumineux',
  description: "Vous appelez le Renne et le voilà qui descend vers vous. Vous récupérez le mot, où se trouve un nouvel indice : « Dans ses murs, les saveurs dansent en harmonie,\nOù les chefs orchestrant une symphonie de gastronomie.\nTables dressées, parfums en effluve subtile,\nQuel lieu magique où l'on savoure chaque morsure délicate ? »",
  question: "Rendez-vous au lieu.",
  motion_type: 'shifting',
  solution: "blabla",
  place: place302
)
file = URI.open("https://fabricamania.fr/wp-content/uploads/2016/12/renne-du-pere-noel.jpg")
riddle306.photo.attach(io: file, filename: "pastèque", content_type: "image/jpg")
riddle306.save!

riddle307 = Riddle.new(
  title: 'Bravo !',
  description: "Bravo, vous avez retrouvé Rudolphe ! Il broutait de l'herbe dans le jardin du restaurant. Grâce à vous, Noël est sauvé ! Le père Noël a retrouvé les rennes et va ainsi pouvoir distribuer les cadeaux.",
  question: "Pour terminer la partie, écrivez 'Joyeux Noël !'",
  motion_type: 'static',
  solution: "Joyeux Noël !",
  place: place303
)
file = URI.open("https://maville.com/photosmvi/2020/12/24/P24328473D4434173G.jpg")
riddle307.photo.attach(io: file, filename: "spicy girls", content_type: "image/jpg")
riddle307.save!

Place.all.each do |place|
  if place.latitude.nil? || place.longitude.nil?
    p "place #{place.name} has incorrect address"
  end
end


p "created #{Game.all.count} games"
p "created #{Participation.all.count} participations"
p "created #{User.all.count} users"
p "created #{Storyline.all.count} storylines"
p "created #{Place.all.count} places"
p "created #{Riddle.all.count} riddles"
p "created #{Answer.all.count} answers"
p "created #{Clue.all.count} clues"

p storyline_bonus.title
