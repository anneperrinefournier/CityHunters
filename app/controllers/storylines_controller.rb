class StorylinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_storyline, only: %i[edit update destroy]

  def index
    @storylines = Storyline.where(is_ready: true)
  end

  def show
    @storyline = Storyline.find(params[:id])
    @starting_point = Storyline.find(params[:id]).places.first

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

  def new
    @empty_place = Place.new
    @storyline = Storyline.new
    @storyline.place.build
  end

  def create
    @storyline = Storyline.new(storyline_params)
    if @storyline.save
      redirect_to profile_path
    else
      @empty_place = Place.new
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if @storyline.user == current_user
      @empty_place = Place.new
      render :edit
    else
      flash[:error] = 'You cannot edit this storyline'
      redirect_to profile_path, status: :forbidden
    end
  end

  def update
    if @storyline.user == current_user
      @storyline.update(storyline_params)
      if @storyline.save
        redirect_to profile_path
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @storyline.destroy
    flash[:notice] = "Scenario \"#{@storyline.title}\" supprimé"
    redirect_to profile_path
  end

  def toggle_ready
    @storyline = Storyline.find(params[:storyline_id])
    if current_user == @storyline.user
      if @storyline.is_ready == false

        if @storyline.places.count > 0
          if !@storyline.photo.attached?
            render json: {
              isReady: false,
              message: "L'aventure doit contenir au moins une photo"
            }
            return
          elsif @storyline.difficulty.nil? ||
            @storyline.duration.nil? ||
            @storyline.introduction.nil?

            render json: {
              isReady: false,
              message: "Les informations de l'aventure sont incomplètes"
            }
            return
          end

          @storyline.places.each do |place|
            if !place.photo.attached?
              render json: {
                isReady: false,
                message: "Le lieu #{place.name} doit contenir au moins une énigme"
              }
              return
            elsif place.longitude.nil? ||
                  place.latitude.nil? ||
                  place.address.nil?

              render json: {
                isReady: false,
                message: "L'addresse du lieu #{place.name}, n'est pas valide"
              }
              return
            elsif place.description.nil?
              render json: {
                isReady: false,
                message: "La description du lieu #{place.name} est vide"
              }
              return
            elsif place.riddles.count == 0
              render json: {
                isReady: false,
                message: "Le lieu #{place.name} doit contenir au moins une énigme"
              }
              return
            else
              place.riddles.each do |riddle|
                if riddle.description.nil? ||
                    riddle.solution.nil? ||
                    riddle.question.nil? ||
                    riddle.motion_type.nil?

                  render json: {
                    isReady: false,
                    message: "L'énigme #{riddle.title}, du lieu #{place.name} est incomplète"
                  }
                  return
                end
              end
            end
          end
        else #storyline.places.count == 0
          render json: {
            isReady: false,
            message: "L'aventure doit contenir au moins un lieu"
          }
          return
        end

        @storyline.update(is_ready: true)
        render json:{
          isReady: true,
          message: "L'aventure est publiée!"
        }
        return

      else #storyline.is_ready == true
        @storyline.update(is_ready: false)
        render json: {
          isReady: false,
          message: "L'aventure a été retirée"
        }
        return
      end
    else #storyline.user != current_user
      flash[:error] = "Vous ne pouvez pas éditer cette storyline"
      redirect_to profile_path, status: :forbidden
    end
  end

  private

  def set_storyline
    @storyline = Storyline.find(params[:id])
  end

  def storyline_params
    params[:storyline][:theme].downcase! # = params[:storyline][:theme].downcase
    params
      .require(:storyline)
      .permit(:title,
              :theme,
              :photo,
              :difficulty,
              :duration,
              :district,
              :short_description,
              :long_description,
              :introduction,
              places_attributes: [:id, :name, :photo, :address, :description, :_destroy])
  end
end
