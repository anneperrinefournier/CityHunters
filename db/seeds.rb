# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


User.create!(email: "john@example.com", password: "password")

Storyline.create!(
  title: "Le fantôme de l'Opéra",
  address: "1er arrondissement",
  duration: 60,
  theme: "historique",
  difficulty: "normal",
  short_description: "Plongez dans l'histoire du célèbre Opéra Garnier et découvrez les mystères qui entourent le légendaire Fantôme de l'Opéra. Résolvez des énigmes historiques pour lever le voile sur les secrets cachés.",
  long_description: "Le Fantôme de l'Opéra est une aventure immersive qui vous transporte dans le 1er arrondissement de Paris. Explorez les coulisses du magnifique Opéra Garnier, un lieu riche en histoire et en mystères. Au cours de cette expérience d'une heure, vous suivrez les traces du Fantôme de l'Opéra à travers des énigmes captivantes. Découvrez les détails fascinants de la construction de l'opéra, les légendes qui l'entourent, et dévoilez les secrets bien gardés. Cette aventure est adaptée à tous les nive
)

Storyline.create!(
  address: "1er arrondissement",
  theme: "historique",
  difficulty: "normal"
)

Storyline.create!(
  address: "1er arrondissement",
  theme: "historique",
  difficulty: "normal"
)

Storyline.create!(
  address: "1er arrondissement",
  theme: "historique",
  difficulty: "normal"
)

Storyline.create!(
  address: "1er arrondissement",
  theme: "historique",
  difficulty: "normal"
)

Place.create!(
  address: "",
  description: "",
  longitude: "",
  latitude: ""
)

Riddle.create!(
  description: "",
  content: "",
  question: "",
  longitude: "",
  latitude: ""
)
