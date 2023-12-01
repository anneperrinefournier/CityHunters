class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :participation, null: false, foreign_key: true
      t.references :riddle, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.text :content, default: ""
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
