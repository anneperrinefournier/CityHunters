class AddCoordinatesToStorylines < ActiveRecord::Migration[7.1]
  def change
    add_column :storylines, :latitude, :float
    add_column :storylines, :longitude, :float
  end
end
