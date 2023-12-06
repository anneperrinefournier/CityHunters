class StorylinesController < ApplicationController
  def index
    @storylines = Storyline.all
  end

  def show
    @storyline = Storyline.find(params[:id])
    @starting_point = Storyline.find(params[:id])

    game_id = params[:game_id].to_i
    @game = Game.find_by(id: game_id)

    @starting_point.geocode
      @starting_point_marker = {
        lat: @starting_point.latitude,
        lng: @starting_point.longitude,
        info_window_html: render_to_string(partial: "games/starting_point_info_window", locals: { starting_point: @starting_point }),
        marker_html: render_to_string(partial: "games/marker", locals: { marker_class: "marker marker-red" })
      }

      @markers = [@starting_point_marker]

  end

end
