class LobbyChannel < ApplicationCable::Channel
  def subscribed
    game = Game.find(params[:id])
    stream_for "lobby-#{game.id}"
  end
end
