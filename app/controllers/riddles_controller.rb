class RiddlesController < ApplicationController
  def verify
    riddle = Riddle.find(params[:riddle_id].to_i)
    game = Game.find(params[:game_id].to_i)

    user_answer = Answer.new(
      game: game,
      participation: Participation.find_by(user: current_user),
      riddle: riddle,
      content: params.dig(:question, :answer)
    )
    user_answer.save!

    # check if the answer is correct
    if user_answer.content == riddle.solution
      user_answer.update(correct: true)

      render json: {
        status: :ok,
        message: "Correct answer!"
      }

      if game.current_place.nil?
        game.update(status: :ended)

        GameChannel.broadcast_to(
          "game-#{game.id}",
          {
            type: 'html',
            game_status: game.status,
            content: render_to_string(partial: "/games/game_review", formats: [:html], locals: { game: game })
          }
        )
      else
        GameChannel.broadcast_to(
          "game-#{game.id}",
          {
            type: 'html',
            game_status: game.status,
            content: render_to_string(partial: "/games/game_state", formats: [:html], locals: { game: game })
          }
        )
      end

    else
      render json: {
        status: :error,
        message: "Incorrect answer. You can try again!"
      }
    end
  end
end
