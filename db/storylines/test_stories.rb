
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

storyline9 = Storyline.new(
  title: "Piège au Canal Saint-Martin",
  district: "10ᵉ arr.",
  duration: 75,
  distance: 5,
  theme: "policier",
  difficulty: 2,
  starting_point: "Canal Saint-Martin, 10th arrondissement, Paris, France",
  short_description: "Découvre les secrets du Canal Saint-Martin.",
  long_description: "Plonge dans les mystères du 10ᵉ arrondissement le long du Canal Saint-Martin. Des énigmes fascinantes te guideront à travers les rives pittoresques de ce quartier branché. Découvre les secrets cachés sous les ponts et dans les cafés qui font la renommée de cet endroit unique.",
  introduction: "Bienvenue dans 'Les Secrets du Canal Saint-Martin', une aventure mystérieuse dans le 10ᵉ arrondissement de Paris. Des énigmes fascinantes te guideront à travers les rives pittoresques de ce quartier branché. Découvre les secrets cachés sous les ponts et dans les cafés qui font la renommée de cet endroit unique."
)
file = URI.open("https://www.pariszigzag.fr/wp-content/uploads/2021/06/shutterstock_247992964-e1624458172598.jpg")
storyline9.photo.attach(io: file, filename: "Les Secrets du Canal Saint-Martin", content_type: "image/jpg")
storyline9.save!

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
place2.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place2.save!

place3 = Place.new(
  name: "Église Saint-Germain-l'Auxerrois",
  address: "2 Place du Louvre, 75001 Paris, France",
  description: "Cette église, située à proximité du Louvre, est connue pour son architecture gothique et son histoire étroitement liée à la royauté française. Un lieu empreint de spiritualité et d'histoire.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/H2dR45s/saint-germains.jpg")
place3.photo.attach(io: file, filename: "St germain", content_type: "image/jpg")
place3.save!

place4 = Place.new(
  name: "Fontaine des Innocents",
  address: "Place Joachim du Bellay, 75001 Paris, France",
  description: "La Fontaine des Innocents est une fontaine Renaissance richement décorée. Construite au XVIe siècle, elle a été déplacée à son emplacement actuel au cœur du 1ᵉʳ arrondissement.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place4.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place4.save!

place5 = Place.new(
  name: "Théâtre du Châtelet",
  address: "1 Place du Châtelet, 75001 Paris, France",
  description: "Le Théâtre du Châtelet est un théâtre historique au style Belle Époque. Il est réputé pour ses productions musicales et sa contribution à la scène artistique parisienne.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place5.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place5.save!

place6 = Place.new(
  name: "Palais Royal",
  address: "8 Rue de Montpensier, 75001 Paris, France",
  description: "Le Palais Royal, résidence autrefois royale, est entouré de jardins élégants. Avec ses colonnes rayées emblématiques et son histoire fascinante, il reste un joyau du 1ᵉʳ arrondissement.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place6.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place6.save!

place7 = Place.new(
  name: "Colonnes de Buren",
  address: "Palais Royal, 75001 Paris, France",
  description: "Les Colonnes de Buren, situées dans la cour du Palais Royal, sont une installation artistique contemporaine. Leurs colonnes rayées offrent un contraste unique avec l'histoire du lieu.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place7.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place7.save!

place8 = Place.new(
  name: "Jardins des Tuileries",
  address: "Rue de Rivoli, 75001 Paris, France",
  description: "Les Jardins des Tuileries, adjacents au Louvre, sont des jardins à la française classiques. Leur conception élégante et leurs statues impressionnantes en font un lieu de promenade incontournable.",
  storyline: storyline1
)
file = URI.open("https://i.ibb.co/3rF3pnK/louvre.webp")
place8.photo.attach(io: file, filename: "Louvre", content_type: "image/jpg")
place8.save!
