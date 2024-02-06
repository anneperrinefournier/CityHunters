require "test_helper"

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "QR code generation should update qr_code field" do
    game = Game.create! # création d'une partie, ce qui va générer un QR code
    game.generate_qr_code # méthode qui génère le QR code
    assert_not_nil game.qr_code, "QR code generation failed: qr_code field not updated"
    # Assurez-vous que le champ qr_code a été mis à jour avec une valeur non nulle
  end
end
