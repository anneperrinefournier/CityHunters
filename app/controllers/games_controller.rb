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
    @game = Game.last
    @storyline = Storyline.find(@game.storyline_id)
    @storyline_title = @storyline.title
  end

  def show
    @game.update(status: :running)
    @storyline = Storyline.find(@game.storyline_id)
    @places = Place.where(storyline: @storyline)
    @riddle = Riddle.where(place: @places[1])[0]
    @participations = Participation.where(game: @game)

    @place_markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "places_info_window", locals: { place: place })
      }
    end


    @participations_markers = @participations.geocoded.map do |participation|
      {
        lat: participation.latitude,
        lng: participation.longitude,
        user: participation.user,
        info_window_html: render_to_string(partial: "participations_info_window", locals: { participation: participation })
      }
    end

    @markers = @places_markers + @participations_markers
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
