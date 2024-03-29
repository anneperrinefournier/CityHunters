# Storyline: L'appel de la bouffe
storyline = Storyline.new(
  title: "Alerte Estomac!",
  district: "11e arr.",
  duration: 15,
  distance: 1,
  theme: "aventure alimentaire",
  difficulty: 1,
  starting_point: "Le Wagon, 68 Ave Parmentier, 75011 Paris, France",
  short_description: "Pars à la recherche de ta nouriture !",
  long_description: "Ca y est, nous y sommes ! Il est 13 h et l'estomac souffre et agonise, il a besoin de manger. Une seule solution, partir à la quête de nourriture! Suivez cette aventure exceptiionnelle à laquelle tout le monde reviens satisfait, mais surtout, le ventre plein!",
  introduction: "Dans une ville grouillante d'activité, où les rues pavées bruissaient sous les pas pressés des passants, une quête essentielle vous animait : assouvir votre faim grandissante. Ignorant l'agitation ambiante, votre estomac vous rappelait impérieusement à l'ordre, vous incitant à trouver cette nourriture revigorante qui apaiserait votre appétit croissant.

  Les senteurs alléchantes émanaient des cuisines dissimulées derrière les devantures des restaurants, des échoppes et des étals de marché. Chaque recoin de cette ville vous attirait, vous offrant des promesses gastronomiques et l'espoir de combler votre faim insatiable.

  Entre les badauds affairés et les passants pressés, vous poursuiviez votre quête, scrutant les enseignes alléchantes, à la recherche du festin parfait. Chaque boulangerie, chaque café et chaque stand coloré éveillait votre appétit et faisait frémir vos sens. Vous étiez déterminé à découvrir ce met délicieux, à dénicher ce plat réconfortant capable de satisfaire vos désirs les plus profonds."
)
file = URI.open("https://www.sofoodmag.fr/wp-content/uploads/2013/02/wpid-3161-avoir-faim.jpg")
storyline.photo.attach(io: file, filename: "Alerte_Estomac", content_type: "image/jpg")
storyline.save!
place1 = Place.new(
  name: "Le Wagon",
  address: "68 Ave Parmentier, 75011 Paris, France",
  description: "On y pleur, on y rit, mais surtout, on s'y sent bien!",
  storyline: storyline
)
file = URI.open("https://studysmarter-mediafiles.s3.amazonaws.com/media/uploads/froala_editor/images/fa7583826ca3-Paris_Campus_3__3_.png")
place1.photo.attach(io: file, filename: "lewagon", content_type: "image/jpg")
place1.save!
place2 = Place.new(
  name: "Metro Parmentier",
  address: "86 avenue Parmentier, 75004 Paris, France",
  description: "Cette bouche de metro... que dire dessus si non que je ne l'ai jamais prise!",
  storyline: storyline
)
file = URI.open("https://p.monumentum.fr/galerie/maxi/00446/446476-francais-entree-de-la-station-de-metro-parmentier-avenue-parmentier-paris.jpg")
place2.photo.attach(io: file, filename: "metro parmentier", content_type: "image/jpg")
place2.save!
place3 = Place.new(
  name: "Boulangerie Oberkampf",
  address: "54 rue Oberkampf, 75001 Paris, France",
  description: "Cette boulangerie me surprendra toujours, non pas par sa quantité des portion, mais par sa qualité de service et son prix!",
  storyline: storyline
)
file = URI.open("https://st.hzcdn.com/simgs/32d1769f03edfebf_16-1634/home-design.jpg")
place3.photo.attach(io: file, filename: "boulangerie graine", content_type: "image/jpg")
place3.save!
place4 = Place.new(
  name: place1.name,
  address: place1.address,
  description: place1.description,
  storyline: storyline
)
file = URI.open("https://studysmarter-mediafiles.s3.amazonaws.com/media/uploads/froala_editor/images/fa7583826ca3-Paris_Campus_3__3_.png")
place4.photo.attach(io: file, filename: "lewagon", content_type: "image/jpg")
place4.save!

riddle1 = Riddle.new(
  title: "Ce que je préfère à 13h",
  description: 'Find the next place',
  question: "S'il y a bien une chose que je préfère quand l'heure de la souppe arrive, c'est...?",
  solution: "manger",
  motion_type: 'static',
  place: place1
)
file = URI.open('https://fondationolo.ca/wp-content/uploads/2017/07/fondation-olo-bebe-a-faim.jpg')
riddle1.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
riddle1.save!
riddle2 = Riddle.new(
  title: "Trouvez le prochain lieu",
  description: 'Find the next place',
  question: "Notre premier enigme est une bifurcation, l'intercection de tous les chemins de notre aventure, l'origine des séparations mais aussi parfois un point de rencontres...",
  solution: "Lat:XXX, Lng:YYY",
  motion_type: 'shifting',
  place: place1
)
file = URI.open('https://www.unmondedaventures.fr/wp-content/uploads/2015/01/281530234-Copier.jpg')
riddle2.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
riddle2.save!
riddle3 = Riddle.new(
  title: 'Find next place',
  description: 'Find the next place',
  question: "Bravo! Mais cet endroit n'est que le point de passage, d'un lieu plus important encore!\nOn dit qu'on y fait les meilleurs gateaux mais mon dieu que c'est chère!",
  solution: "Lat:XXX, Lng:YYY",
  motion_type: 'shifting',
  place: place2
)
file = URI.open('https://www.podcastfrancaisfacile.com/wp-content/uploads/2013/05/demander-son-chemin.jpg')
riddle3.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
riddle3.save!
riddle4 = Riddle.new(
  title: 'What a cake!',
  description: 'Find cake price',
  question: "Félicitation! Vous avez trouvé le lieux exacte de notre aventure! Parmis les gateaux que je préfère, il y en a un particulièrement que je préfère et que je prends presque à chaque fois, saurez vous trouver lequel? Seuls les vrais savent!",
  solution: "citron pavot",
  motion_type: 'static',
  place: place3
)
file = URI.open('https://cdn.pratico-pratiques.com/app/uploads/sites/2/2022/05/02113329/gateau-au-citron-et-huile-d-olive.jpg')
riddle4.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
riddle4.save!
riddle5 = Riddle.new(
  title: 'What a cake!',
  description: 'Find cake price',
  question: "Et oui, j'adore ce gateau! Pourriez vous notez le prix du sandwish au poulet pour moi s'il vous plaît? (A l'euro près)",
  solution: "6€",
  motion_type: 'static',
  place: place3
)
file = URI.open('https://static.750g.com/images/600-600/0fa217fa9300b4fbea5919f9f7f38bdf/adobestock-430086029.jpg')
riddle5.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
riddle5.save!
riddle6 = Riddle.new(
  title: 'Rentrer manger',
  description: 'Find cake price',
  question: "Bon, je pense que l'on a tout ce qu'il nous faut pour s'assoir autour d'une table pour manger tous ensemble! Il va falloir en trouver une...",
  solution: "LatLng",
  motion_type: 'shifting',
  place: place3
)
file = URI.open('https://images.ricardocuisine.com/services/articles/1200x630_manger-ensemble-1400.jpg')
riddle6.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
riddle6.save!
riddle7 = Riddle.new(
  title: 'Conclusion',
  description: 'Conclusion aventure',
  question: "Félicitation! Votre expédition s'arrête ici, il est temps maintenant de savourer votre précieux butin! Bon appétit!\nEnvoyer 'thanks' pour terminer l'aventure :D",
  solution: "thanks",
  motion_type: 'static',
  place: place4
)
file = URI.open('https://images.ricardocuisine.com/services/articles/1200x630_manger-ensemble-1400.jpg')
riddle7.photo.attach(io: file, filename: "eat_together", content_type: "image/jpg")
riddle7.save!
