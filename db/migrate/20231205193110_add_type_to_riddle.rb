class AddTypeToRiddle < ActiveRecord::Migration[7.1]
  def change
    add_column :riddles, :motion_type, :string
  end
end
