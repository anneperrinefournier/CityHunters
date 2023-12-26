namespace :db do
  task seed_force_reset: :environment do
    puts 'Reset database...'

    require_relative '../../db/seeds_reset'
  end
end
