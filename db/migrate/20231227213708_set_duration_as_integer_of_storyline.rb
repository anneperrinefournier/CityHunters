class SetDurationAsIntegerOfStoryline < ActiveRecord::Migration[7.1]
  def change
    change_column :storylines, :duration, :integer
  end
end
