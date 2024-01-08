class AddStateToStoryline < ActiveRecord::Migration[7.1]
  def change
    add_column :storylines, :is_ready, :boolean, default: false
  end
end
