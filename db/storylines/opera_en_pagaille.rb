#storyline

storyline = create_or_update(
  Storyline.new(
    title: "Opéra en pagaille",
    user: User.find_by(email: 'monica@gmail.com'),
    district: "9ᵉ arr.",
    duration: 60,
    distance: 2,
    theme: "historique",
    difficulty: 2,
    short_description: "Un personnage emblématique de l’Opéra Garnier a disparu, retrouve-le !",
    long_description: "Un personnage emblématique de l’Opéra a mystérieusement disparu ! Sans lui, l'Opéra a perdu son âme et plus rien ne va : les chanteurs ont perdu leur voix, les danseurs ne font que tomber… Il faut vite le retrouver !\nPartez sur la trace de cet énigmatique personnage. Suivez les indices laissées à travers les ruelles du quartier, déchiffrez les mystères, et découvrez ce qui lui est arrivé ! Une enquête palpitante où le mystère et l’intrigue vous guideront dans une traque passionnante à la recherche de ce personnage perdu.",
    introduction: "Le rideau se lève sur l’Opéra, mais le silence règne. Une étrange malédiction semble s’être abattue sur les artistes… Les chanteurs ont perdu leur voix, les danseurs trébuchent sans grâce et les comédiens ne parviennent plus à mémoriser leurs textes. C’est une catastrophe ! Comment assurer la présentation à venir dans ces conditions ? Le cri d’un jeune homme résonne dans ce lugubre silence. Il vous explique qu’il a vu un fantôme avec un visage affreux sortir de l’Opéra. « Mon masque, mon masque ! » criait-il. « Qu’on me rende mon masque ! » Un fantôme avec un masque… Cela vous évoque une légende bien ancienne…",
    is_ready: true
  ),
  {
    filename: "Opéra en pagaille",
    url: "https://i.ibb.co/f1cKxRg/paris-opera-492493-1280.jpg",
    content_type: "image/jpg"
  }
)

# Places
place1 = create_or_update(
  Place.new(
    name: "Opéra Garnier",
    address: "Place de l’Opéra, 75009 Paris, France",
    description: "L’Opéra Garnier, joyau architectural au cœur de Paris, est bien plus qu’une scène prestigieuse. C’est un lieu empreint d’histoire, de mystère et de passion artistique. Explorez ses salles somptueuses, découvrez les secrets de ses coulisses et plongez dans l’atmosphère envoûtante où la musique et la danse fusionnent. C’est ici, au sein de l’Opéra Garnier, que débute votre quête pour retrouver le personnage énigmatique disparu.",
    storyline: storyline
  ),
  {
    filename: "Opéra Garnier",
    url: "https://i.ibb.co/s5H5ksS/pexels-masood-aslami-14960325.jpg",
    content_type: "image/jpg"
  }
)

place2 = create_or_update(
  Place.new(
    name: "Comédie-Française",
    address: "1 Place Colette, 75001 Paris, France",
    description: "Bienvenue à la Comédie-Française, un véritable joyau culturel situé en plein cœur de Paris. Cette institution théâtrale prestigieuse, fondée en 1680, a été le berceau de nombreuses œuvres emblématiques. Plongez dans l'histoire captivante de ce lieu chargé de mystères, où le théâtre classique et contemporain se rencontrent pour créer une expérience artistique inoubliable.",
    storyline: storyline
  ),
  {
    filename: "Comédie-Française",
    url: "https://i.ibb.co/Dw82QNH/Come-die-Franc-aise-colonnes.jpg",
    content_type: "image/jpg"
  }
)

place3 = create_or_update(
  Place.new(
    name: "Colonnes de Buren",
    address: "8 Rue De Montpensier, 75001 Paris, France",
    description: "Bienvenue aux Colonnes de Buren, une installation artistique emblématique située au cœur du Palais Royal à Paris. Ces colonnes rayées en noir et blanc, conçues par l'artiste Daniel Buren, offrent un spectacle visuel unique. Plongez dans l'atmosphère artistique de ce lieu singulier, où l'art contemporain se mêle à l'histoire royale du Palais. Une étape incontournable dans votre quête pour retrouver le personnage énigmatique disparu.",
    storyline: storyline
  ),
  {
    filename: "Colonnes de Buren",
    url: "https://i.ibb.co/DzSHvLy/Come-die-Franc-aise-colonnes.jpg",
    content_type: "image/jpg"
  }
)

place4 = create_or_update(
  Place.new(
    name: "Maison de Colette",
    address: "9 Rue de Beaujolais, Paris",
    description: "Bienvenue à la Maison de Colette, un lieu empreint de l’esprit de l’écrivaine française Sidonie-Gabrielle Colette. Située au cœur de Paris, cette demeure évoque l’histoire littéraire captivante de Colette. Contemplez cette maison unique, témoin des pages qui ont façonné l’écrivaine.",
    storyline: storyline
  ),
  {
    filename: "Maison de Colette",
    url: "https://i.ibb.co/nwwfz5q/colette.jpg",
    content_type: "image/jpg"
  }
)

place5 = create_or_update(
  Place.new(
    name: "Théâtre du Palais-Royal",
    address: "38 Rue de Montpensier, 75001 Paris",
    description: "Bienvenue au Théâtre du Palais-Royal, un lieu emblématique au cœur de Paris. Ce théâtre a une longue histoire riche en représentations théâtrales mémorables.",
    storyline: storyline
  ),
  {
    filename: "Theatre_du_Palais_Royal",
    url: "https://i.ibb.co/9qZbvsY/theatre-palais-royal.jpg",
    content_type: "image/jpg"
  }
)

#riddles

riddle1 = create_or_update(
  Riddle.new(
    title: 'Un personnage emblématique',
    description: 'Ton intuition te souffle qu’il y a un rapport entre la malédiction sur les artistes et ce mystérieux fantôme décrit par le jeune homme. Tu ne crois pas aux coïncidences… Et puis, cette histoire de fantôme avec un masque n’est pas sans t’évoquer une célèbre histoire. Et si le fantôme de l’Opéra existait véritablement ?',
    solution: 'Erik',
    question: 'Quel est le nom du fantôme de l’Opéra ?',
    motion_type: 'static',
    place: place1
  ),
  {
    filename: "fantôme",
    url: "https://i.ibb.co/gR8mXc6/Capture-d-e-cran-2024-01-09-a-00-24-56.png",
    content_type: "image/png"
  }
)

riddle2 = create_or_update(
  Riddle.new(
    title: 'Sur les traces du fantôme',
    description: "Erik, le fantôme de l’Opéra… Et si c’était lui ? À l'évocation de ce nom, les lumières de l’Opéra Garnier se mettent à trembler. C’est sûr, ce fantôme et la malédiction des artistes sont liés ! Si plus rien ne va, c’est parce que le fantôme de l’Opéra a quitté les lieux ! Sans lui, l’Opéra a perdu son âme. Il faut à tout prix le retrouver et le convaincre de revenir ! Tu questionnes le garçon pour savoir où il est allé. Il te montre alors un papier qui est apparu quand le fantôme est sorti de l’opéra.\n« Dans la maison de Molière, en quête de son masque,\nLe fantôme erre et cherche sans relâche,\nParmi les costumes et autres accessoires,\nDans ce lieu de comédies et de tragédies,\nSe joue maintenant son drame. »",
    solution: 'lieu à trouver',
    question: 'Trouve le lieu où est allé le fantôme de l’Opéra.',
    motion_type: 'shifting',
    place: place1
  ),
  {
    filename: "mot parchemin",
    url: "https://i.ibb.co/cYnshrj/pexels-pixabay-51159.jpg",
    content_type: "image/png"
  }
)

riddle3 = create_or_update(
  Riddle.new(
    title: 'L’inauguration du théâtre',
    description: "La maison de Molière, c’est bien entendu la Comédie-Française ! Tu t’y rends rapidement, espérant ne pas manqeur le fantôme. Il doit sûrement être à la recherche de son masque, là où les costumes sont rangés… Il est logique qu’il soit venu ici, vu la collection importante de masques que la Comédie-Française doit avoir ! Tu t’apprêtes à rentrer, quand le fantôme apparaît soudain devant toi.\n« Erik ? »\nIl se retourne quand tu l’appelles, mais mets les mains sur son visage pour le cacher. « Ne me regardez pas ! J’ai perdu mon masque… Je pensais le trouver ici, mais il n’est pas là… ».\n Tu essayes de le consoler, puis lui explique la situation à l’Opéra : tu lui demandes de revenir.\n« Je ne peux pas, pas sans mon masque… C’est grâce à lui que je me cache. Il efface ma laideur. »\n Tu insistes, mais il refuse de revenir tant qu’il n'aura pas retrouvé son masque. Tu lui proposes de l’aider à le retrouver et lui demandes s’il a vu le voleur. Il t’explique que non, mais qu’il a laissé un mot avec des indices. Le premier est la date de l’inauguration de la Comédie-Française.",
    solution: '1680',
    question: 'Quel est la date d’inauguration de la Comédie-Française ?',
    motion_type: 'static',
    place: place2
  ),
  {
    filename: "Intérieur de la Comédie-Française en 1790.",
    url: "https://i.ibb.co/DYYsnL0/1920px-Paris-Comedie-Francaise.jpg",
    content_type: "image/png"
  }
)

riddle4 = create_or_update(
  Riddle.new(
    title: 'En blanc et noir',
    description: "Tu comprends que le voleur a laissé un jeu de piste pour vous. Si le premier indice menait au Palais-Royal, il fallait déjà comprendre le deuxième indice : « Dans la cour du roi, une forêt verticale s’érige,\nDes troncs en noir et blanc, un tableau qui intrigue,\nUne symphonie graphique, une énigme éternelle,\nOù l’art se dévoile, mystère en résonance. »",
    solution: 'Colonnes de Buren',
    question: 'Quel est le nom de cette forêt ?',
    motion_type: 'static',
    place: place2
  ),
  {
    filename: "forêt en noir et blanc",
    url: "https://i.ibb.co/Byw9Y1f/woods-6487408-1280.jpg",
    content_type: "image/png"
  }
)

riddle5 = create_or_update(
  Riddle.new(
    title: 'La forêt de pierre',
    description: "Il s’agit bien de l’œuvre de Daniel Buren : les colonnes de Buren, aussi appelées « Les Deux Plateaux » ! Le fantôme te passe devant pour se rendre dans cette forêt d’arbres en marbre : suis-le !",
    solution: '9 Rue de Beaujolais',
    question: 'Rends-toi aux colonnes de Buren.',
    motion_type: 'shifting',
    place: place2
  ),
  {
    filename: "Colonnes de Buren",
    url: "https://i.ibb.co/7KNtd5C/Palais-Royal-et-les-Colonnes-de-Buren.jpg",
    content_type: "image/png"
  }
)

riddle5 = create_or_update(
  Riddle.new(
    title: 'Co & co',
    description: "Le fantôme te lit l’indice suivant :\n« Ce n’est ni la place, ni l’allée, mais la demeure où Cosette avec un l a vécu ses dernières années. ».",
    solution: '9 Rue de Beaujolais',
    question: 'Rends-toi en ce lieu.',
    motion_type: 'shifting',
    place: place3
  ),
  {
    filename: "Colonnes de Buren",
    url: "https://i.ibb.co/7KNtd5C/Palais-Royal-et-les-Colonnes-de-Buren.jpg",
    content_type: "image/png"
  }
)

riddle6 = create_or_update(
  Riddle.new(
    title: 'Les planches royales',
    description: "Le dernier indice est : « Dans la rue où Cocteau à vécu, se trouve les planches que Molière partagea avec des italiens. ».",
    solution: 'Théâtre du Palais-Royal',
    question: 'Rends-toi en ce lieu.',
    motion_type: 'shifting',
    place: place4
  ),
  {
    filename: "Portrait de Molière. Molière interprétant César dans La Mort de Pompée, portrait attribué à Nicolas Mignard (1658)",
    url: "https://i.ibb.co/7X1S30n/Molie-re-Nicolas-Mignard-1658.jpg",
    content_type: "image/png"
  }
)

riddle7 = create_or_update(
  Riddle.new(
    title: 'Le masque',
    description: "C’est donc au théâtre du Palais-Royal que vous a mené le dernier indice ! Vous y entrez et découvrez, sur le comptoir, un masque. Celui du fantôme de l’Opéra… Ce dernier le remet, soulagé et accepte de retourner à l’Opéra Garnier. Comme par miracle, son retour lève la malédiction des artistes, qui peuvent enfin chanter, danser et jouer ! Grâce à toi, la représentation peut avoir lieu ! Pour terminer l’intrigue, écris le nom de l’auteur de la plume duquel le fantôme est né.",
    solution: 'Gaston Leroux',
    question: 'Quel est son nom ?',
    motion_type: 'static',
    place: place5
  ),
  {
    filename: "encre et parchemin.",
    url: "https://i.ibb.co/RP0gs6D/desk-1869579-1280.jpg",
    content_type: "image/png"
  }
)
