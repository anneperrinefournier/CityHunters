class AddIndexToStateMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :state_messages, :index, :integer
    add_column :state_messages, :data_type, :string
  end
end
