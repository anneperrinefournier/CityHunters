class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile
    if current_user.email == "monica@gmail.com"
      @storylines = Storyline.where(user: current_user)
    else
      flash[:alert] = "Fonctionnalité à venir !"
      redirect_to root_path
    end
  end
end
