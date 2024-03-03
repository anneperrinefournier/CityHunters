class CreateStateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :state_messages do |t|
      t.text :content
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
