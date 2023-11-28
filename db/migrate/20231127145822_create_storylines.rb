class CreateStorylines < ActiveRecord::Migration[7.1]
  def change
    create_table :storylines do |t|
      t.string :district
      t.string :theme
      t.integer :difficulty
      t.float :distance

      t.timestamps
    end
  end
end
