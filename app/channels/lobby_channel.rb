class LobbyChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find_by(id: params[:id])

    if game
      stream_for "lobby-#{game.id}"
    else
      reject # rejet de la connexion si le jeu n'est pas trouvé
    end
  end
end
