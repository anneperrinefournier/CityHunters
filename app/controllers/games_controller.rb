class GamesController < ApplicationController
  before_action :set_game, only: %i[lobby show start end_game]
  before_action :set_game_users, only: %i[lobby stats end_game]

  def create
    game = Game.new(
      user: current_user,
      storyline_id: params[:storyline_id],
      status: :not_started
    )
    game.save!
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

    if @game.status == "running"
      if @game.current_place.nil?
        @game.update(status: :ended)
        redirect_to game_path(@game), status: :internal_server_error
      end

      @storyline = Storyline.find(@game.storyline_id)

      @places = Place.where(storyline: @storyline)
      @participations = Participation.where(game: @game)
      @starting_point = Storyline.find(@game.storyline_id).places.first

      @places_to_mark = @places.select do |place|
        place == @game.current_place || place.validated?(@game)
      end

      @places = Place.where(id: @places_to_mark.map(&:id))

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
          participation_id: participation.id,
          info_window_html: render_to_string(partial: "participations_info_window", locals: { participation: participation }),
          participation_marker_html: render_to_string(partial: "participation_marker", locals: { participation_user: participation.user })
        }
      end

      @starting_point.geocode
      @starting_point_marker = {
        lat: @starting_point.latitude,
        lng: @starting_point.longitude,
        info_window_html: render_to_string(partial: "starting_point_info_window", locals: { starting_point: @starting_point }),
        marker_html: render_to_string(partial: "marker", locals: { marker_class: "marker marker-red" })
      }

      @markers = @places_markers + [@starting_point_marker]

    elsif @game.status == 'ended'
      render 'games/_end_game', locals: { game: @game }
    end
  end

  def join
  end

  def access
    game_identifier = params[:game][:identifier].delete(" \t\r\n").upcase
    game = find_game_by_identifier(game_identifier)

    if game
      participation = Participation.new(
        game: game,
        user: current_user
      )
      participation.save
      redirect_to lobby_game_path(game)
    else
      flash[:alert] = "Aucune partie trouvée avec ce PIN ou QR code : #{game_identifier}"
      redirect_to join_game_path
    end
  end

  def lobby
    redirect_to game_path(@game) unless @game.status == 'not_started'

    LobbyChannel.broadcast_to(
      "lobby-#{@game.id}",
      {
        data_type: 'add_player',
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
    @game.update(start_time: Time.now)
    LobbyChannel.broadcast_to(
      "lobby-#{@game.id}",
      {
        data_type: "redirect",
        url: game_path(@game)
      }
    )
  end

  def end_game
    @game.ended!

    @participations = Participation.where(game: @game)

    GameChannel.broadcast_to(
      "game-#{@game.id}",
      {
        data_type: "update_game_content",
        type: 'html',
        game_status: @game.status,
        content: render_to_string(partial: "/games/end_game", formats: [:html], locals: { game: @game })
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

  private

  def find_game_by_identifier(identifier)
    # Vérifier si l'identifiant est un PIN
    game_by_pin = Game.find_by(pin: identifier)
    return game_by_pin if game_by_pin

    # Vérifier si l'identifiant est un ID extrait du QR code
    game_by_qr_code = find_game_by_qr_code(identifier)
    return game_by_qr_code if game_by_qr_code

    # Si aucun jeu n'est trouvé, retourner nil
    nil
  end

  def find_game_by_qr_code(qr_code)
    # Vérifier si l'identifiant est un PIN
    match_data = qr_code.match(/games\/(\d+)\/lobby/)
    return nil unless match_data

    game_id = match_data[1].to_i

    # Rechercher le jeu correspondant dans la base de données en utilisant l'ID extrait
    Game.find_by(id: game_id)
  end
end
