class AddQrCodeToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :qr_code, :string
  end
end
