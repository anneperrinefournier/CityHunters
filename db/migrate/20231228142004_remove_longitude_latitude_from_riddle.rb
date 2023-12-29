class RemoveLongitudeLatitudeFromRiddle < ActiveRecord::Migration[7.1]
  def change
    remove_column :riddles, :longitude, :float
    remove_column :riddles, :latitude, :float
  end
end
