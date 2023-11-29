class AddColumnsToStorylines < ActiveRecord::Migration[7.1]
  def change
    add_column :storylines, :title, :string
    add_column :storylines, :duration, :float
    add_column :storylines, :short_description, :text
    add_column :storylines, :long_description, :text
    add_column :storylines, :starting_point, :text
    add_column :storylines, :introduction, :text
  end
end
