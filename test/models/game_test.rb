require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "QR code generation should update qr_code field" do
    monica = User.find_by(email: 'monica@gmail.com') # Récupération de l'utilisateur Monica de la DB
    assert_not_nil monica, "User Monica not found in the database"

    storyline = FactoryBot.create(:storyline, title: "Code Rouge")

    game = Game.create!(user: monica, storyline: storyline) # Création d'une partie, ce qui va générer un QR code
    game.generate_qr_code # Générer le QR code

    assert_not_nil game.qr_code, "QR code generation failed: qr_code field not updated"
    # Assurez-vous que le champ qr_code a été mis à jour avec une valeur non nulle
  end
end
