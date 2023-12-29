class AddOwnerToStoryline < ActiveRecord::Migration[7.1]
  def change
    add_reference :storylines, :user, foreign_key: true
  end
end
