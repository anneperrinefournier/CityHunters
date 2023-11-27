class CreateRiddles < ActiveRecord::Migration[7.1]
  def change
    create_table :riddles do |t|
      t.string :description
      t.string :picture
      t.string :content
      t.string :question
      t.float :longitude
      t.float :latitude
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
