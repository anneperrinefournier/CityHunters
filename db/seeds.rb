require "open-uri"

p "destroying #{Game.all.count} games"
p "destroying #{Participation.all.count} participations"
p "destroying #{User.all.count} users"
p "destroying #{Storyline.all.count} storylines"
p "destroying #{Place.all.count} places"
p "destroying #{Riddle.all.count} riddles"
p "destroying #{Answer.all.count} answers"
p "destroying #{Clue.all.count} clues"

Participation.destroy_all
Answer.destroy_all
Game.destroy_all

Clue.destroy_all
Riddle.all.each do |riddle|
  riddle.photo.purge
end
Riddle.destroy_all
Place.all.each do |place|
  place.photo.purge
end
Place.destroy_all
Storyline.all.each do |storyline|
  storyline.photo.purge
end
Storyline.destroy_all

User.all.each do |user|
  user.photo.purge
end
User.destroy_all

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

require_relative 'storylines/ruby_cest_fini'
require_relative 'storylines/food_call'
require_relative 'storylines/code_rouge'
require_relative 'storylines/spicy_girls'
# require_relative 'storylines/test_stories'


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
