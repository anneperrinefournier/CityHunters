class RiddlesController < ApplicationController
  def verify
    riddle_id = params[:question][:riddle_id].to_i
    game = Game.find(params[:question][:game_id].to_i)

    user_answer = Answer.new(
      game: game,
      participation: Participation.find_by(user: current_user),
      riddle_id: riddle_id,
      content: params.dig(:question, :answer)
    )
    user_answer.save!
    riddle = Riddle.find(riddle_id)

    # check if the answer is correct
    if user_answer.content == riddle.solution
      # user_answer.update(correct: true)

      GameChannel.broadcast_to(
        "game-#{game.id}",
        render_to_string(partial: "/games/game_state", formats: [:html], locals: { game: game })
      )

    else
      render json: {
        status: :error,
        message: "Incorrect answer. Please try again."
      }
    end
  end
end
