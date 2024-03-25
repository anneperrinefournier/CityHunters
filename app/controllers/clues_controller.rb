class CluesController < ApplicationController
  def unblock
    if current_user
      @clue = Clue.find(params[:id])
      # riddle = Riddle.find(params[:riddle_id].to_i)
      # @game = Game.find(params[:game_id].to_i)
      @clue.update(unlocked: true)
      ActionCable.server.broadcast "game-#{@clue.game_id}", data_type: 'new_clue', clue_id: @clue.id

      flash[:notice] = 'Indice débloqué'
    else
      redirect_to new_user_session_path
    end
end
