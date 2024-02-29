class StorylinesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_storyline, only: %i[edit update destroy]

  def index
    @storylines = Storyline.where(is_ready: true)
  end

  def show
    @storyline = Storyline.find(params[:id])
    @starting_point = @storyline.places.first


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
    @storyline = Storyline.new
    @storyline.user = current_user
    if @storyline.save
      redirect_to edit_storyline_path(@storyline)
    else
      flash[:alert] = "Erreur, veuillez recommencer"
      redirect_to profile_path
    end
  end

  def edit
    if @storyline.user == current_user
      @empty_place = Place.new
      render :edit
    else
      flash[:error] = 'Vous ne pouvez pas éditer ce scénario'
      redirect_to profile_path, status: :unauthorized
    end
  end

  def update
    if @storyline.user == current_user
      @storyline.update(storyline_params)
      if @storyline.save
        flash[:notice] = "L’histoire a été mise à jour"
        redirect_to edit_storyline_path(@storyline)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @storyline.destroy
    flash[:notice] = "Scénario \"#{@storyline.title}\" supprimé"
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
              message: "L’aventure doit contenir au moins une photo"
            }
            return
          elsif @storyline.duration.nil? ||
                @storyline.introduction.empty? ||
                @storyline.title.empty? ||
                @storyline.theme.empty? ||
                @storyline.district.empty? ||
                @storyline.long_description.empty?
            render json: {
              isReady: false,
              message: "Les informations de l’aventure sont incomplètes"
            }
            return
          end

          # Validate the duration only if the storyline is ready
          if @storyline.set_storyline_ready? && !@storyline.valid?(:set_storyline_ready)
            render json: {
              isReady: false,
              message: "La durée de l’aventure doit être présente et valide"
            }
            return
          end

          # Continue with other validations for places and riddles...
        else
          render json: {
            isReady: false,
            message: "L’aventure doit contenir au moins un lieu"
          }
          return
        end

        @storyline.update(is_ready: true)
        render json:{
          isReady: true,
          message: "L’aventure est publiée !"
        }
        return

      else
        @storyline.update(is_ready: false)
        render json: {
          isReady: false,
          message: "L’aventure a été retirée"
        }
        return
      end
    else
      flash[:error] = "Vous ne pouvez pas éditer cette storyline"
      redirect_to profile_path, status: :unauthorized
    end
  end

  private

  def set_storyline
    @storyline = Storyline.find(params[:id])
  end

  def storyline_params
    params[:storyline][:theme].downcase!
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
              :introduction)
  end
end
