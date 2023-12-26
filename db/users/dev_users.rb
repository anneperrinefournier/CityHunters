monica = create_or_update(
  User.new(
    email: 'monica@gmail.com',
    password: 'password',
    name: 'Monica',
    level: 3,
    xp: 310
  ), {
    filename: "monica-photo",
    url: "https://img.freepik.com/photos-gratuite/portrait-belle-jeune-femme-maquillage-yeux-charbonneux-jolie-jeune-fille-adulte-posant-au-studio-gros-plan-visage-feminin-attrayant_186202-4439.jpg",
    content_type: "image/jpg"
  }
)

joey = create_or_update(
  User.new(
    email: 'joey@gmail.com',
    password: 'password',
    name: 'joey',
    level: 2,
    xp: 230
  ), {
    filename: "joey-photo",
    url: 'https://curiosmos.com/wp-content/uploads/2023/08/Homo-sapiens-new-lineage.jpeg',
    content_type: 'image/jpeg'
  }
)
