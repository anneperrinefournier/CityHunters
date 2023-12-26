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

# Seeding DB
require_relative 'seeds'


p "created #{Game.all.count} games"
p "created #{Participation.all.count} participations"
p "created #{User.all.count} users"
p "created #{Storyline.all.count} storylines"
p "created #{Place.all.count} places"
p "created #{Riddle.all.count} riddles"
p "created #{Answer.all.count} answers"
p "created #{Clue.all.count} clues"
