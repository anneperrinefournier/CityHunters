class CluesController < ApplicationController
  def access
    if current_user
      @clue = Clue.find(params[:id])
    else
      redirect_to new_user_session_path
    end
end
