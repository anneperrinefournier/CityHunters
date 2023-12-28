namespace :db do
  namespace :seed do
    task reset: :environment do
      puts 'Reset database...'

      require_relative '../../db/seeds_reset'
    end
  end
end
