class AddCodeTypeToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :code_type, :integer, default: 0
  end
end
