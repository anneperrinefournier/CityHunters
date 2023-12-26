# Storyline: L'appel de la bouffe
storyline = create_or_update(
  Storyline.new(
    title: "Alerte Estomac !",
    district: "11ᵉ arr.",
    duration: 15,
    distance: 1,
    theme: "urbain",
    difficulty: 1,
    short_description: "Pars à la recherche de ta nouriture !",
    long_description: "Ca y est, nous y sommes! Il est 13h et l'estomac souffre et agonise, il a besoin de manger. Une seule solution, partir en quête de nourriture! Suivez cette aventure exceptiionnelle à laquelle tout le monde revient satisfait, mais surtout, le ventre plein!",
    introduction: "Dans une ville grouillante d'activité, où les rues pavées bruissent sous les pas pressés des passants, une quête essentielle vous anime : assouvir votre faim grandissante. Ignorant l'agitation ambiante, votre estomac vous rappelle impérieusement à l'ordre, vous incitant à trouver cette nourriture revigorante qui apaisera votre appétit croissant.

    Des senteurs alléchantes émanent des cuisines dissimulées derrière les devantures de restaurant, des échoppes et des étals de marché. Chaque recoin de cette ville vous attire et vous offre des promesses gastronomiques, avec l'espoir de combler votre faim insatiable.

    Entre les badauds affairés et les passants pressés, vous poursuivez votre quête, scrutant les enseignes alléchantes, à la recherche du festin parfait. Chaque boulangerie, chaque café et chaque stand coloré éveille votre appétit et fait frémir vos sens. Vous êtes déterminé à découvrir ce met délicieux, à dénicher ce plat réconfortant capable de satisfaire vos désirs les plus profonds."
  ), {
    filename: "Alerte_Estomac",
    url: "https://www.sofoodmag.fr/wp-content/uploads/2013/02/wpid-3161-avoir-faim.jpg",
    content_type: "image/jpg"
  }
)

place1 = create_or_update(
  Place.new(
    name: "Le Wagon",
    address: "68 avenue Parmentier, 75011 Paris, France",
    description: "On y pleure, on y rit, mais surtout, on s'y sent bien!",
    storyline: storyline
  ), {
    filename: "lewagon",
    url: "https://studysmarter-mediafiles.s3.amazonaws.com/media/uploads/froala_editor/images/fa7583826ca3-Paris_Campus_3__3_.png",
    content_type: "image/jpg"
  }
)
place2 = create_or_update(
  Place.new(
    name: "Metro Parmentier",
    address: "86 avenue Parmentier, 75004 Paris, France",
    description: "Cette bouche de metro... que dire dessus si non que je ne l'ai jamais prise!",
    storyline: storyline
  ), {
    filename: "metro parmentier",
    url: "https://p.monumentum.fr/galerie/maxi/00446/446476-francais-entree-de-la-station-de-metro-parmentier-avenue-parmentier-paris.jpg",
    content_type: "image/jpg"
  }
)
place3 = create_or_update(
  Place.new(
    name: "Boulangerie Oberkampf",
    address: "54 rue Oberkampf, 75001 Paris, France",
    description: "Cette boulangerie me surprendra toujours, non pas tant par la quantité de ses portions, mais par sa qualité de service et son prix!",
    storyline: storyline
  ), {
    filename: "metro parmentier",
    url: "https://st.hzcdn.com/simgs/32d1769f03edfebf_16-1634/home-design.jpg",
    content_type: "image/jpg"
  }
)
place4 = create_or_update(
  Place.new(
    name: place1.name,
    address: place1.address,
    description: place1.description,
    storyline: storyline
  ), {
    filename: "lewagon",
    url: "https://studysmarter-mediafiles.s3.amazonaws.com/media/uploads/froala_editor/images/fa7583826ca3-Paris_Campus_3__3_.png",
    content_type: "image/png"
  }
)

riddle1 = create_or_update(
  Riddle.new(
    title: "Ce que je préfère à 13h",
    description: 'Find the next place',
    question: "S'il y a bien une chose que je préfère quand l'heure de la soupe arrive, c'est...?",
    solution: "manger",
    motion_type: 'static',
    place: place1
  ), {
    filename: "eat_together",
    url: "https://fondationolo.ca/wp-content/uploads/2017/07/fondation-olo-bebe-a-faim.jpg",
    content_type: "image/jpg"
  }
)
riddle2 = create_or_update(
  Riddle.new(
    title: "Trouvez le prochain lieu",
    description: 'Find the next place',
    question: "Notre première enigme est une bifurcation, l'intersection de tous les chemins de notre aventure, l'origine des séparations mais aussi parfois un point de rencontre...",
    solution: "Lat:XXX, Lng:YYY",
    motion_type: 'shifting',
    place: place1
  ), {
    filename: "eat_together",
    url: "https://www.unmondedaventures.fr/wp-content/uploads/2015/01/281530234-Copier.jpg",
    content_type: "image/jpg"
  }
)
riddle3 = create_or_update(
  Riddle.new(
    title: 'Find next place',
    description: 'Find the next place',
    question: "Bravo! Mais cet endroit n'est que le point de passage, d'un lieu plus important encore!\nOn dit qu'on y fait les meilleurs gateaux mais mon dieu que c'est cher!",
    solution: "Lat:XXX, Lng:YYY",
    motion_type: 'shifting',
    place: place2
  ), {
    filename: "eat_together",
    url: "https://www.podcastfrancaisfacile.com/wp-content/uploads/2013/05/demander-son-chemin.jpg",
    content_type: "image/jpg"
  }
)
riddle4 = create_or_update(
  Riddle.new(
    title: 'What a cake!',
    description: 'Find cake price',
    question: "Félicitation! Vous avez trouvé le lieux exact de notre aventure! Parmi les gateaux que je préfère, il y en a un particulièrement que je prends presque à chaque fois, saurez-vous trouver lequel? Seuls les vrais savent!",
    solution: "citron pavot",
    motion_type: 'static',
    place: place3
  ), {
    filename: "eat_together",
    url: "https://cdn.pratico-pratiques.com/app/uploads/sites/2/2022/05/02113329/gateau-au-citron-et-huile-d-olive.jpg",
    content_type: "image/jpg"
  }
)
riddle5 = create_or_update(
  Riddle.new(
    title: 'What a cake!',
    description: 'Find cake price',
    question: "Et oui, j'adore ce gateau! Pourriez-vous noter le prix du sandwich au poulet pour moi s'il vous plaît? (A l'euro près)",
    solution: "6€",
    motion_type: 'static',
    place: place3
  ), {
    filename: "eat_together",
    url: "https://static.750g.com/images/600-600/0fa217fa9300b4fbea5919f9f7f38bdf/adobestock-430086029.jpg",
    content_type: "image/jpg"
  }
)
riddle6 = create_or_update(
  Riddle.new(
    title: 'Rentrer manger',
    description: 'Find cake price',
    question: "Bon, je pense que l’on a tout ce qu’il faut pour s’assoir autour d’une table et manger tous ensemble ! Il va falloir en trouver une…",
    solution: "LatLng",
    motion_type: 'shifting',
    place: place3
  ), {
    filename: "eat_together",
    url: "https://images.ricardocuisine.com/services/articles/1200x630_manger-ensemble-1400.jpg",
    content_type: "image/jpg"
  }
)
riddle7 = create_or_update(
  Riddle.new(
    title: 'Conclusion',
    description: 'Conclusion aventure',
    question: "Félicitation ! Votre expédition s'arrête ici, il est temps maintenant de savourer votre précieux butin! Bon appétit!\nEnvoyer 'thanks' pour terminer l'aventure :D",
    solution: "thanks",
    motion_type: 'static',
    place: place4
  ), {
    filename: "eat_together",
    url: "https://images.ricardocuisine.com/services/articles/1200x630_manger-ensemble-1400.jpg",
    content_type: "image/jpg"
  }
)
