class GamesController < ApplicationController
  before_action :set_game, only: %i[lobby show]
  def create
    game = Game.new(
      user: current_user,
      storyline_id: params[:storyline_id],
      status: :not_started,
      pin: 7.times.map { ('A'..'Z').to_a.sample }.join
    )
    game.save!
    redirect_to lobby_game_path(game)
  end

  def lobby
    @storyline_title = Storyline.find(@game.storyline_id).title
  end

  def show
    @game.update(status: :running)
    @storyline = Storyline.find(@game.storyline_id)
    @place = Place.where(storyline_id: @storyline.id)[1]
    @riddle = Riddle.where(place_id: @place.id)[0]
    @clue = Clue.where(riddle_id: @riddle.id)[0]
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
