storyline = Storyline.new(
  title: "Spicy girls",
  district: "10ᵉ arr.",
  duration: 90,
  distance: 6,
  theme: "fantastique",
  difficulty: 3,
  starting_point: "32 Rue Bichat, 75010 Paris, France",
  short_description: "Les cinq doigts de la main",
  long_description: "Noël est en danger ! Les cinq fruits magiques que le père Noël donne à ses rennes pour les faire voler dans le ciel, ont été volés par le Grinch. Celui-ci a cependant laissé des indices derrière lui. Suis-les pour sauver Noël !",
  introduction: "Tu es posée au Princesse Café avec les autres Spicy Girls quand soudain, un homme avec une longue barbe blanche et un costume rouge vous aborde : c’est le père Noël !
  Il explique qu’il a besoin l'aide des Spicy Girls. Pour faire voler ses rennes, il a besoin de cinq fruits magiques : le raisin violet, la pastèque rouge, l’orange dorée, la pomme verte et la fraise vermeille. Mais le Grinch, pour gâcher Noël, les a volés et les a éparpillés dans Paris ! Heureusement, il a laissé quelques indices derrière lui… Sauve Noël et aide le père Noël à retrouver les fruits magiques !"
)
file = URI.open("https://i.ibb.co/bbHwnRk/IMG-20231209-225953.jpg")
storyline.photo.attach(io: file, filename: "spicy girls", content_type: "image/jpg")
storyline.save!

place1 = Place.new(
  name: "Princesse Café",
  address: "32 Rue Bichat, 75010 Paris, France",
  description: "Café Princesse est le lieu de rendez-vous ultime de toutes les princesses pour bruncher le dimanche.",
  storyline: storyline
)
file = URI.open("https://i.ibb.co/25CDCGC/Capture-d-e-cran-2023-12-10-a-00-37-10.png")
place1.photo.attach(io: file, filename: "princess-cafe", content_type: "image/jpg")
place1.save!

place2 = Place.new(
  name: "Palais des glaces",
  address: "37 Rue Du Faubourg Du Temple, 75010 Paris, France",
  description: "Le Palais des glaces est une salle de spectacle parisienne édifiée en 1876 au 37 rue du Faubourg-du-Temple, dans le 10ᵉ arrondissement de Paris. Le Théâtre comprend deux salles : la principale de cinq cents places et le Petit Palais des glaces.\n Mais en réalité, c'est une couverture pour le palais des glaces d'Elsa !",
  storyline: storyline
)
file = URI.open("https://i.ibb.co/12Z1R2T/elsapalais.jpg")
place2.photo.attach(io: file, filename: "palais-des-glaces", content_type: "image/jpg")
place2.save!

place3 = Place.new(
  name: "Concorde",
  address: "Place De La Concorde, 75001 Paris, France",
  description: "La place de la Concorde (initialement « place Louis XV »), qui s’étend sur 7,56 hectares, est la plus grande place de Paris. Elle est située dans le 8e arrondissement.",
  storyline: storyline
)
file = URI.open("https://i.ibb.co/qW473sc/concorde.jpg")
place3.photo.attach(io: file, filename: "concorde", content_type: "image/jpg")
place3.save!

place4 = Place.new(
  name: "Fête foraine des tuileries",
  address: "1 Terrasse des Feuillants, 75001 Paris",
  description: "",
  storyline: storyline
)
file = URI.open("https://i.ibb.co/YX18Qrw/feteforaine.jpg")
place4.photo.attach(io: file, filename: "fete-forraine-tuileries", content_type: "image/jpg")
place4.save!

riddle11 = Riddle.new(
  title: 'À la poursuite du Grinch',
  description: "Le Grinch est la seule personne à savoir où sont les fruits magiques, puisque c’est lui qui les a cachés. Alors que tu parles avec le père Noël, la princesse Elsa, la Reine des neiges, vous entend et se joint à la conversation. Sa sœur Anna lui a envoyé un message car apparemment, le Grinch l'attend de pied ferme devant son palais. Il souhaite apparemment convaincre Elsa d’arrêter de faire neiger pour gâcher encore plus Noël.",
  question: "Va au palais d'Elsa pour trouver le Grinch !",
  motion_type: 'shifting',
  solution: "blabla",
  place: place1
)
file = URI.open("https://i.ibb.co/GQp4rfT/grinch.jpg")
riddle11.photo.attach(io: file, filename: "Grinch", content_type: "image/jpg")
riddle11.save!

riddle21 = Riddle.new(
  title: 'La pomme verte',
  description: "En arrivant devant le palais de la Reine des neiges, tu aperçois en effet le Grinch. Il regarde sa montre toute les deux secondes avec impatience et jette des regards agacés vers le ciel, d'où tombent les flocons de neige provoqués par Elsa. Tu t’approches de lui et essaye de le convaincre de te rendre les fruits de Noël. Tu essayes de le convaincre, tu lui parles de famille, d'amitié, de bons sentiments. Mais il refuse, disant que tout ça, ça n'existe pas. Mais quand tu lui proposes de te joindre à toi et tes amis, il hésite. Il accepte de venir mais ne donnera que des indices que si toi et tes amis trouvez les réponses à ses questions, car c'est plus amusant comme ça. Voici son énigme :\n« Dans les plats, je suis la note épicée,\nUn feu qui danse, l'âme bien trempée.\nRouge comme l'amitié, piquant l'instant,\nUne amie ardente, dans chaque repas pimenté. »",
  question: "Qui suis-je ?",
  motion_type: 'static',
  solution: "piment",
  place: place2
)
file = URI.open("https://i.ibb.co/zs0hW04/Capture-d-e-cran-2023-12-10-a-00-56-09.png")
riddle21.photo.attach(io: file, filename: "pomme", content_type: "image/jpg")
riddle21.save!

riddle22 = Riddle.new(
  title: 'La fraise rouge',
  description: "Eh oui, c'était bien le piment. Le Grinch préfère la chaleur au froid. Il aime manger épicé. Quand tu lui dis que votre surnom, c'est les Spicy Girls, et que vous avez d'ailleurs un porte-clé piment sur vous, son intérêt se décuple. Il accepte d'échanger le piment contre la pomme verte qu'il cachait dans sa poche et vous tend celle-ci. C'est le seul fruit qu'il a caché sur lui, car il aimait bien sa couleur – la même que la sienne. Plus que 4 fruits à trouver… Il vous indique une nouvelle énigme pour trouver la fraise rouge :\n« Dans Paris, suivez le goût sucré de la fraise,\nSur une place où règne la justice en liesse.\nLa République vous attend, là où tout s'éclaire,\nTrouvez la fraise, votre prochaine lumière. »",
  question: "Trouve le lieu où tu dois te rendre pour trouver la fraise !",
  motion_type: 'shifting',
  solution: "blabla",
  place: place2
)
file = URI.open("https://i.ibb.co/fYv0WxC/Capture-d-e-cran-2023-12-10-a-01-04-11.png")
riddle22.photo.attach(io: file, filename: "fraise", content_type: "image/jpg")
riddle22.save!

riddle31 = Riddle.new(
  title: 'Le Grinch prend le métro',
  description: "Bravo, vous avez retrouvé la fraise rouge au centre de la place de la république ! Plus que trois fruits à retrouver. Il vous faut à présent prendre le métro, mais jusqu'où ? Le Grinch vous indique la station où aller avec une nouvelle énigme :\n« Dans la cité où l'histoire résonne,\nCherchez la place où la paix fredonne.\nEntre l'aiguille et la roue qui tourne,\nRévélez le lieu où discorde trouve une pause qui étonne,\nNon loin de l’endroit étoilé où a vécu la plus belle des pommes. »",
  question: "Quel est le nom de la station de métro où tu dois te rendre ?",
  motion_type: 'static',
  solution: "Concorde",
  place: place3
)
file = URI.open("https://i.ibb.co/S0mJvXX/Capture-d-e-cran-2023-12-10-a-01-01-25.png")
riddle31.photo.attach(io: file, filename: "chat", content_type: "image/jpg")
riddle31.save!

riddle32 = Riddle.new(
  title: 'L’orange dorée',
  description: "C’est bien Concorde, oui ! Non loin des Champs-Élysées. Prends le métro 8 en direction de Balard, et arrête-toi à Concorde. Le Grinch est cependant déçu en arrivant. La grande roue n'est pas là ! Mais peut-être n'est-elle pas loin… Retrouve-la vite ! Si tu la retrouves, le Grinch te donnera l'orange dorée. Après tout, la roule et l'orange sont tous les deux ronds.",
  question: "Rends-toi auprès de la grande roue.",
  motion_type: 'shifting',
  solution: "blabla",
  place: place3
)
file = URI.open("https://i.ibb.co/nCvT8fp/Capture-d-e-cran-2023-12-10-a-00-51-30.png")
riddle32.photo.attach(io: file, filename: "orange", content_type: "image/jpg")
riddle32.save!

riddle41 = Riddle.new(
  title: 'Le raisin violet',
  description: "Vous avez retrouvé la grande roue ! Elle est en plein milieu du marché de Noël des Tuileries ! Le Grinch y fait un tour et vous tend ensuite l'orange, satisfait. Cela lui a cependant donné un peu soif… Mais il veut que vous deviniez pour lui ce qu'il aimerait boire, à partir d'une énigme :\n« Dans l'hiver froid où le raisin sommeille,\nCherchez ce breuvage qui réchauffe et éveille.\nÉpices et fruits dans une danse audacieuse,\nTrouvez le secret de cette boisson précieuse. »",
  question: "Qu'est-ce que le Grinch aimerait boire ?",
  motion_type: 'static',
  solution: "vin rouge",
  place: place4
)
file = URI.open("https://i.ibb.co/2W4SC3v/Capture-d-e-cran-2023-12-10-a-00-57-24.png")
riddle41.photo.attach(io: file, filename: "raisin", content_type: "image/jpg")
riddle41.save!

riddle42 = Riddle.new(
  title: 'La pastèque rouge (et verte)',
  description: "Voilà notre Grinch satisfait de boire son petit verre de vin chaud. Peut-être commence-t-il presque à aimer Noël ? Oula… Le vin chaud lui monte à la tête… Il avait oublié qu'il ne digérait que les choses vertes ! Il aurait bien besoin de boire un peu d'eau, mais ce n'est pas vert… Vous avez alors une idée : une pastèque, c'est rouge et vert, et ça contient plein d'eau ! Mais où trouver une pastèque en plein hiver ? Il y a bien la pastèque magique, mais pour cela, il faut la retrouver ! Et même en mauvais état, le Grinch trouve la force de donner une énigme :\n« Dans le froid hivernal où la glace se déploie,\nCherchez l'endroit où la danse sur glace étonne.\nLames aux pieds, rires dans l'air,\nOù suis-je, ce lieu de joie éphémère ? »",
  question: "Quel est le nom du lieu ?",
  motion_type: 'static',
  solution: "patinoire",
  place: place4
)
file = URI.open("https://i.ibb.co/pXbM2SM/Capture-d-e-cran-2023-12-10-a-00-49-41.png")
riddle42.photo.attach(io: file, filename: "pastèque", content_type: "image/jpg")
riddle42.save!

riddle43 = Riddle.new(
  title: 'Bravo !',
  description: "Bravo, c’était la dernière énigme ! Grâce aux Spicy Girls, Noël est sauvé ! Les rennes vont pouvoir voler dans le ciel et le père Noël va pouvoir distribuer les cadeaux. Le Grinch a mangé un bout de la pastèque et vole un peu dans l'air, du coup, mais chose étrange, il a un sourire sur le visage ! Ca doit être l'effet du piment, de la grande roue, du vin rouge ou de la patinoire. Ou bien tout ça à la fois.",
  question: "Pour terminer la partie, écrivez 'Spicy Girls !",
  motion_type: 'static',
  solution: "Spicy Girls",
  place: place4
)
file = URI.open("https://i.ibb.co/wrT0L9R/Capture-d-e-cran-2023-12-10-a-00-59-38.png")
riddle43.photo.attach(io: file, filename: "spicy girls", content_type: "image/jpg")
riddle43.save!
