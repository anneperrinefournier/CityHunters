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
