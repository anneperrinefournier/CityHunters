class LobbyChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find_by(id: params[:id])

    if game
      stream_for "lobby-#{game.id}"

      # If the game is already running, the player is redirected to the game when reconnected to the lobby
      if game.status != 'not_started'
        LobbyChannel.broadcast_to(
          "lobby-#{game.id}",
          {
            data_type: "redirect",
            url: "/games/#{game.id}"
          }
        )
      end
    else
      reject # rejet de la connexion si le jeu n'est pas trouvé
    end
  end
end
