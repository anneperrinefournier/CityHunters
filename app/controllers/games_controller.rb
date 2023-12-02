class GamesController < ApplicationController
  before_action :set_game, only: %i[lobby show start]
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
    if @game.status == "not_started" && current_user == @game.user
      @game.running!
    end

    raise unless @game.status == "running"

    @storyline = Storyline.find(@game.storyline_id)

    @places = Place.where(storyline: @storyline)
    @participations = Participation.where(game: @game)
    @starting_point = Storyline.find(@game.storyline_id)

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
      {
        type: "html",
        html: render_to_string(partial: "player", locals: { user: current_user })
      }
    )
    @storyline_title = Storyline.find(@game.storyline_id).title
  end

  def stats
    @storyline = Storyline.find(@game.storyline)
  end

  def start
    @game.running!
    LobbyChannel.broadcast_to(
      "lobby-#{@game.id}",
      {
        type: "redirect",
        url: game_path(@game)
      }
    )
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

# # pseudocode
# fin de jeu
# stats
# geoloc
# systeme d experience
# chrono
# carte jolie sans geoloc
# websocket pour:
# - carte
# - enigme
# - fin de jeu

# + seeder avec l enigme
