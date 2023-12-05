class GameChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find(params[:id])
    stream_for "game-#{game.id}"
  end

  def receive(data)
    participation = Participation.find(data['participation_id'])

    if data['action'] == "set_player_position"
      participation.update(latitude: data['latitude'], longitude: data['longitude'])
      game = participation.game

      participation.reload

      GameChannel.broadcast_to("game-#{game.id}", {
        action: 'update_position',
        participation_id: participation.id,
        longitude: participation.longitude,
        latitude: participation.latitude
      })
      return
    end
  end
end
