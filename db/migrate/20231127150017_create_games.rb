class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.integer :status
      t.date :start_time
      t.date :end_time
      t.references :user, null: false, foreign_key: true
      t.references :storyline, null: false, foreign_key: true

      t.timestamps
    end
  end
end
