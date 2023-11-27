class AddParametersToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :photo, :string
    add_column :users, :level, :integer
    add_column :users, :xp, :integer
  end
end
