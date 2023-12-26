class DeleteStartingPointFromStoryline < ActiveRecord::Migration[7.1]
  def change
    remove_column :storylines, :starting_point, :string
    remove_column :storylines, :longitude, :float
    remove_column :storylines, :latitude, :float
  end
end
