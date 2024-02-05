class GameChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find_by(id: params[:id])

    if game
      stream_for "lobby-#{game.id}"
    else
      reject # rejet de la connexion si le jeu n'est pas trouvé
    end
  end

  def receive(data)
    participation = Participation.find(data['participation_id'])

    if data['data_type'] == "set_player_position"
      participation.update(latitude: data['latitude'], longitude: data['longitude'])
      game = participation.game

      participation.reload

      GameChannel.broadcast_to("game-#{game.id}", {
        data_type: 'update_position',
        participation_id: participation.id,
        longitude: participation.longitude,
        latitude: participation.latitude
      })
    end
  end
end
