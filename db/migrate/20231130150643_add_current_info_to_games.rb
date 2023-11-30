class AddCurrentInfoToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :current_place_id, :integer
    add_column :games, :current_riddle_id, :integer
  end
end
