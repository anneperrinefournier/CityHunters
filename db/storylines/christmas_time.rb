
storyline = Storyline.new(
  title: "Christmas time",
  district: "10ᵉ arr.",
  duration: 90,
  distance: 6,
  theme: "fantastique",
  difficulty: 3,
  starting_point: "28 Rue De Bel Air, 53960 Bonchamp-lès-Laval, France",
  short_description: "Les cinq doigts de la main",
  long_description: "Noël est en danger ! Les rennes du père Noël ont disparu ! Sans eux, le père Noël ne pourra pas livrer les cadeaux ! Le coupable a cependant laissé des indices derrière lui. Suis-les pour sauver Noël !",
  introduction: "Vous êtes posés au coin du feu quand soudain, un homme avec une longue barbe blanche et un costume rouge sonne à la porte : c’est le père Noël !
  Il explique qu’il a besoin de votre aide pour retrouver ses rennes. Le ou la coupable, pour gâcher Noël, les a volés et les a éparpillés dans Bonchamp ! Heureusement, il a laissé quelques indices derrière lui… Sauvez Noël et aidez le père Noël à retrouver ses rennes magiques !"
)
file = URI.open("https://t3.ftcdn.net/jpg/06/68/12/48/360_F_668124876_LVDek2loS1Bgic9KxfwiiJByZ3ckuLv2.jpg")
storyline.photo.attach(io: file, filename: "rennes", content_type: "image/jpg")
storyline.save!

place1 = Place.new(
  name: "Maison",
  address: "28 Rue De Bel Air, 53960 Bonchamp-lès-Laval, France",
  description: "La maison",
  storyline: storyline
)
file = URI.open("https://i.ibb.co/JjbXND2/Capture-d-e-cran-2023-12-23-a-23-01-28.png")
place1.photo.attach(io: file, filename: "maison", content_type: "image/jpg")
place1.save!

place2 = Place.new(
  name: "La route du renard",
  address: "Chemin du Pont Perret, 53960 Bonchamp-lès-Laval, France",
  description: "Champ avec des chevaux.",
  storyline: storyline
)
file = URI.open("https://www.francebleu.fr/s3/cruiser-production/2020/09/34127edc-4c43-4b0d-9a81-1e44af7c35f5/1200x680_maxnewsfrfour324703.jpg")
place2.photo.attach(io: file, filename: "route du renard", content_type: "image/jpg")
place2.save!

place3 = Place.new(
  name: "Maison abandonnée",
  address: "30 Rue Jean Mermoz, 53960 Bonchamp-lès-Laval, France",
  description: "Maison abandonnée pendant 10 ans, de la lumière semble y être enfin revenue !",
  storyline: storyline
)
file = URI.open("https://i.ibb.co/0fctHZ7/Capture-d-e-cran-2023-12-23-a-23-35-16.png")
place3.photo.attach(io: file, filename: "maison abandonnée", content_type: "image/jpg")
place3.save!

place4 = Place.new(
  name: "Maison Marsollier",
  address: "23 Chemin Du Préfet, 53960 Bonchamp-lès-Laval, France",
  description: "Traiteur en Mayenne près de Laval. La maison Marsollier est spécialisée dans l\'organisation d'événements ; mariage, cocktail, diner d'entreprise.",
  storyline: storyline
)
file = URI.open("https://media-cdn.tripadvisor.com/media/photo-s/17/a9/aa/53/maison-marsolier.jpg")
place4.photo.attach(io: file, filename: "maison marsollier", content_type: "image/jpg")
place4.save!

riddle1 = Riddle.new(
  title: 'Le voleur',
  description: "Suite à la disparition des elfes, le père Noël a fait un appel à témoins. Un elfe a vu le coupable, mais les elfes ne savent parler qu'en énigmes. Voici ce qu'il a dit :\nDans l'obscurité, sous la neige qui brille,\nUn être vert au cœur d'argile.\nQui déteste Noël et tout ce qui étincelle,\nA pris les rennes, farceur rebelle.",
  question: "Qui est le coupable ?",
  motion_type: 'static',
  solution: "Grinch",
  place: place1
)
file = URI.open("https://resize-elle.ladmedia.fr/rcrop/638,,forcex/img/var/plain_site/storage/images/loisirs/cinema/dossiers/films-de-noel-notre-best-of/elfe/91201509-1-fre-FR/Elfe.jpg")
riddle1.photo.attach(io: file, filename: "Grinch", content_type: "image/jpg")
riddle1.save!

riddle2 = Riddle.new(
  title: 'À la poursuite du voleur',
  description: "En effet, c'est bien le Grinch ! Plus connu sous le nom… d'Oliver. Il accepte de te guider au premier renne, si tu lui donnes son mets favori.",
  question: "Quel est son mets favori ?",
  motion_type: 'static',
  solution: "lait",
  place: place1
)
file = URI.open("https://i.ibb.co/S0mJvXX/Capture-d-e-cran-2023-12-10-a-01-01-25.png")
riddle2.photo.attach(io: file, filename: "pomme", content_type: "image/jpg")
riddle2.save!

riddle3 = Riddle.new(
  title: 'À la recherche des rennes',
  description: "Eh oui, c'était bien le lait ! Si le père Noël aime un cookie avec un verre de lait chaud, le Grinch, lui, adore le lait. Il en raffole ! Peut-être est-il en fin de compte jaloux du père Noël ? Et si c'était pour cela qu'il détestait Noël ? Par jalousie ? Toujours est-il qu'il doit maintenant tenir sa promesse. Il saute sur la table de manger et vous montre un bout de papier. Une énigme indique où se trouve les 3 premiers rennes :\n« Là où le renard et le cheval se rencontrent,\nVous trouverez les premiers rennes. »",
  question: "Trouve le lieu où tu dois te rendre pour trouver les premiers rennes !",
  motion_type: 'shifting',
  solution: "blabla",
  place: place1
)
file = URI.open("https://www.zoologiste.com/images/xl/renne-troupeau.jpg")
riddle3.photo.attach(io: file, filename: "fraise", content_type: "image/jpg")
riddle3.save!

riddle4 = Riddle.new(
  title: '4 rennes, plus que 5 à trouver !',
  description: "Bravo, vous avez retrouvé trois rennes au milieu des chevaux dans le champ ! Plus que cinq rennes à retrouver. L'avantage, c'est qu'ils sont toujours par quatre… Alors que tu parcours la rue du renard, le Grinch, qui a décidé de vous accompagner (on ne sait jamais, s'il peut avoir un peu plus de lait), vient vers vous. Il a un petit papier attaché autour du cou. Vous le prenez pour découvrir le prochain lieu : « Dix ans sans vie, dans l'obscurité lointaine,\nUne demeure fantôme, son mystère retient la chaîne.\nPas de pas, pas de rires, seulement des échos,\nQuelle est cette maison où le temps semble figé depuis des années, sans le moindre éclat de renouveau ? »",
  question: "Où se trouve les prochains rennes à trouver ?",
  motion_type: 'shifting',
  solution: "blabla",
  place: place2
)
file = URI.open("https://i0.wp.com/www.frenchkilt.com/wp-content/uploads/2016/01/FullSizeRender-4.jpg")
riddle4.photo.attach(io: file, filename: "grinch", content_type: "image/jpg")
riddle4.save!

riddle5 = Riddle.new(
  title: 'Qui manque à l’appel ?',
  description: "Les rennes sont bien là, en train de brouter l'herbe de la maison fantôme. Vous les comptez… il y en a quatre. Cela fait donc… 5 ! Mais où est le dernier ? Vous les regardez pour savoir lequel est aux abonnés absents. Oliver apporte alors une dernirèe énigme… « Au milieu des rennes qui tirent le traîneau en vol,\nUn nez lumineux brille, comme une lueur d'étoile.\nDans la nuit étoilée, il guide le Père Noël,\nQui est ce renne, au nez si singulier, joyau irréel ? »",
  question: "Quel renne manque-t-il ?",
  motion_type: 'static',
  solution: "Rudolphe",
  place: place3
)
file = URI.open("https://image.over-blog.com/gUw352tALo2uDkzUB3i8_-SGvGc=/filters:no_upscale()/image%2F0932959%2F20211219%2Fob_ffbbed_les-rennes-3.jpg")
riddle5.photo.attach(io: file, filename: "orange", content_type: "image/jpg")
riddle5.save!

riddle6 = Riddle.new(
  title: 'Récupérer le mot',
  description: "C'est bien Rudolphe le renne qui est aux abonnés absents ! Avec son nez rouge lumineux, on le repère d'habitude facilement. C'est lui qui guide les rennes, alors il faut absolument le retrouver ! Mais où peut-il bien être ? Tu remarques soudain un ruban avec un papier autour du cou d'un des rennes. Mais il vole au-dessus du champ. Tu dois l'appeler pour qu'il vienne. Mais quel est son nom ?",
  question: "Quel est le nom du renne qui porte le mot ?",
  motion_type: 'static',
  solution: "Comète",
  place: place3
)
file = URI.open("https://ih1.redbubble.net/image.5222839526.4634/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg")
riddle6.photo.attach(io: file, filename: "raisin", content_type: "image/jpg")
riddle6.save!

riddle7 = Riddle.new(
  title: 'Rudolphe, le renne au nez rouge lumineux',
  description: "Vous appelez le Renne et le voilà qui descend vers vous. Vous récupérez le mot, où se trouve un nouvel indice : « Dans ses murs, les saveurs dansent en harmonie,\nOù les chefs orchestrant une symphonie de gastronomie.\nTables dressées, parfums en effluve subtile,\nQuel lieu magique où l'on savoure chaque morsure délicate ? »",
  question: "Rendez-vous au lieu.",
  motion_type: 'shifting',
  solution: "blabla",
  place: place3
)
file = URI.open("https://fabricamania.fr/wp-content/uploads/2016/12/renne-du-pere-noel.jpg")
riddle7.photo.attach(io: file, filename: "pastèque", content_type: "image/jpg")
riddle7.save!

riddle8 = Riddle.new(
  title: 'Bravo !',
  description: "Bravo, vous avez retrouvé Rudolphe ! Il broutait de l'herbe dans le jardin du restaurant. Grâce à vous, Noël est sauvé ! Le père Noël a retrouvé les rennes et va ainsi pouvoir distribuer les cadeaux.",
  question: "Pour terminer la partie, écrivez 'Joyeux Noël !'",
  motion_type: 'static',
  solution: "Joyeux Noël !",
  place: place4
)
file = URI.open("https://maville.com/photosmvi/2020/12/24/P24328473D4434173G.jpg")
riddle8.photo.attach(io: file, filename: "spicy girls", content_type: "image/jpg")
riddle8.save!
