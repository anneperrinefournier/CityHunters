class StorylinesController < ApplicationController

  def index
    @storylines = Storyline.all
  end
end
