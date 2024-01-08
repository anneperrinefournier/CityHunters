require "open-uri"
require_relative "create_or_update"

# Creating users
require_relative 'users/dev_users'

# Importing storylines
require_relative 'storylines/ruby_cest_fini'
require_relative 'storylines/code_rouge'
require_relative 'storylines/food_call'
# require_relative 'storylines/test_stories'

# Checking that all places have address
Place.all.each do |place|
  if place.latitude.nil? || place.longitude.nil?
    p "place #{place.name} has incorrect address"
  end
end
