class GamesController < ApplicationController
  before_action :set_game, only: %i[lobby show]
  before_action :set_game_users, only: %i[lobby stats]

  def create
    game = Game.create!(
      user: current_user,
      storyline_id: params[:storyline_id],
      status: :not_started
    )
    Participation.create!(
      game: game,
      user: current_user
    )
    redirect_to lobby_game_path(game)
  end

  def show
    @game.update(status: :running)
    @storyline = Storyline.find(@game.storyline_id)
    @place = Place.where(storyline_id: @storyline.id)[1]
    @riddle = Riddle.where(place_id: @place.id)[0]
    @clue = Clue.where(riddle_id: @riddle.id)[0]
  end

  def join
  end

  def access
    game = Game.find_by(pin: params[:game][:pin].upcase)
    participation = Participation.new(
      game: game,
      user: current_user
    )
    participation.save
    redirect_to lobby_game_path(game)
  end

  def lobby
    LobbyChannel.broadcast_to(
      "lobby-#{@game.id}",
      render_to_string(partial: "player", locals: { user: current_user })
    )
    @storyline_title = Storyline.find(@game.storyline_id).title
  end

  def stats
    @storyline = Storyline.find(@game.storyline)
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def set_game_users
    participations = Participation.where(game: @game)
    users_id = participations.map(&:user_id)
    @users = User.where(id: users_id)
  end
end
