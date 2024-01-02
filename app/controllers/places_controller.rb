class PlacesController < ApplicationController
  before_action :set_place, only: [:edit, :update, :destroy]
  before_action :set_storyline

  def new
    @place = Place.new
    @storyline = Storyline.find(params[:storyline_id])
  end

  def create
    @place = Place.new(place_params)
    @place.storyline = @storyline
    if @place.save
      redirect_to edit_storyline_path(@storyline)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    unless @place.storyline.user == current_user
      redirect_to profile_path, status: :unauthorized
    end
  end

  def update
    if @storyline.user == current_user
      @place.update(place_params)
      if @place.save
        redirect_to edit_storyline_path(@storyline)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to profile_path, status: :unauthorized
    end
  end

  def destroy
    if @place.storyline.user == current_user
      @place.destroy
      redirect_to edit_storyline_path(@storyline)
    else
      redirect_to profile_path, status: :unauthorized
    end
  end

  private

  def set_storyline
    @storyline = Storyline.find(params[:storyline_id])
  end

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :photo, :address, :description)
  end

      # riddles_attributes: [:id,
      #                     :title,
      #                     :picture,
      #                     :question,
      #                     :solution,
      #                     :description,
      #                     :motion_type,
      #                     :_destroy]
end
