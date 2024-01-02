class RemovePictureFromPlaceAndRiddle < ActiveRecord::Migration[7.1]
  def change
    remove_column :places, :picture, :string
    remove_column :riddles, :picture, :string
  end
end
