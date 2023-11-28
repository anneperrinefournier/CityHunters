class AddPinToGame < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :pin, :string
  end
end
