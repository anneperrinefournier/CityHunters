class CreatePlaces < ActiveRecord::Migration[7.1]
  def change
    create_table :places do |t|
      t.string :address
      t.string :description
      t.string :picture
      t.references :storyline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
