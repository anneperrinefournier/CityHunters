p "destroying #{Game.count} games"
p "destroying #{Participation.count} participations"
p "destroying #{User.count} users"
p "destroying #{Storyline.count} storylines"
p "destroying #{Place.count} places"
p "destroying #{Riddle.count} riddles"
p "destroying #{Answer.count} answers"
p "destroying #{Clue.count} clues"

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

# Seeding DB
require_relative 'seeds'


p "created #{Game.count} games"
p "created #{Participation.count} participations"
p "created #{User.count} users"
p "created #{Storyline.count} storylines"
p "created #{Place.count} places"
p "created #{Riddle.count} riddles"
p "created #{Answer.count} answers"
p "created #{Clue.count} clues"
