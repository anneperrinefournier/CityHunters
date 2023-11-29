class StorylinesController < ApplicationController

  def index
    @storylines = Storyline.all
  end

  def show
    @storyline = Storyline.find(params[:id])
  end
end
