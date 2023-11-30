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
      user: current_user,
      latitude: 48.8641,
      longitude: 2.3753
    )
    redirect_to lobby_game_path(game)
  end

  def show
    @game.update(status: :running)
    @storyline = Storyline.find(@game.storyline_id)
    # @place = Place.where(storyline_id: @storyline.id)[1]
    # @riddle = Riddle.where(place_id: @place.id)[0]
    # @clue = Clue.where(riddle_id: @riddle.id)[0]

    @places = Place.where(storyline: @storyline).order(created_at: :asc)
    # @riddles = [Riddle.where(place: @places[1]).order(created_at: :asc)[0]]
    @participations = Participation.where(game: @game)
    @starting_point = Storyline.find(@game.storyline_id)

    @game_current_place_index = @game.storyline.places.order(created_at: :asc).index { |place| place.id == @game.current_place_id }
    @game_current_riddle_index = @game.storyline.places.find(@game.current_place_id).riddles.order(created_at: :asc).index { |riddle| riddle.id == @game.current_riddle_id }


    if @game_current_riddle_index.nil?
      @game_current_riddle_index = 0
    end

    @game_current_place_index = 1
    @game_current_riddle_index = 0



    @places_markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "places_info_window", locals: { place: place }),
        marker_html: render_to_string(partial: "marker", locals: { marker_class: "marker marker-blue" })
      }
    end


    @participations_markers = @participations.map do |participation|
      {
        lat: participation.latitude,
        lng: participation.longitude,
        info_window_html: render_to_string(partial: "participations_info_window", locals: { participation: participation }),
        marker_html: render_to_string(partial: "marker", locals: { marker_class: "marker marker-gold" })
      }
    end

    @starting_point.geocode
    @starting_point_marker = {
      lat: @starting_point.latitude,
      lng: @starting_point.longitude,
      info_window_html: render_to_string(partial: "starting_point_info_window", locals: { starting_point: @starting_point }),
      marker_html: render_to_string(partial: "marker", locals: { marker_class: "marker marker-red" })
    }

    @markers = @places_markers + @participations_markers + [@starting_point_marker]
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
