class GameChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find(params[:id])
    stream_for "game-#{game.id}"
  end

  def receive(data)
    participation = Participation.find(data['participation_id'])

    if data['data_type'] == "set_player_position"
      participation.update(latitude: data['latitude'], longitude: data['longitude'])
      participation.reload
      game = participation.game

      GameChannel.broadcast_to("game-#{game.id}", {
        data_type: 'update_position',
        participation_id: participation.id,
        longitude: participation.longitude,
        latitude: participation.latitude
      })
    end

    if data['data_type'] == "fetch_missed_messages"
      game = Game.find(data['game_id'])
      missed_messages = StateMessage.where(game: game).select do |message|
        message.data_type == 'new_marker' && message.index > data['state_message_index']
      end
      missed_riddles = StateMessage.where(game: game).select do |message|
        message.data_type == 'update_riddle' && message.index > data['state_message_index']
      end

      missed_messages.push(missed_riddles.last) unless missed_riddles.empty?

      missed_messages.each do |message|
        GameChannel.broadcast_to("game-#{game.id}", {
          data_type: message.data_type,
          type: 'html',
          game_status: game.status,
          state_message_index: message.index,
          content: message.content
        })
      end
    end
  end
end
