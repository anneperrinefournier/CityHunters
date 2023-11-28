class CreateClues < ActiveRecord::Migration[7.1]
  def change
    create_table :clues do |t|
      t.string :content
      t.references :riddle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
