class GamesController < ApplicationController
  def create
    game = Game.new
    game.storyline_id = params[:id]
    redirect_to lobby_path(game)
  end

  def lobby(game)
    @game = game
    @storyline_title = Storyline.where(id: game.storyline_id).title
    @game.pin = 6.times.rand('A'..'Z').sample
    
  end
end
