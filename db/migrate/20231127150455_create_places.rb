class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :picture
      t.float :longitude
      t.float :latitude
      t.references :storyline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
