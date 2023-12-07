class ChangeGameTimeColumnsToDatetime < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :start_time, :datetime
    change_column :games, :end_time, :datetime
  end
end
