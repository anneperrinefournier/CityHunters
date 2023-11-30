class RiddlesController < ApplicationController
  def verify
    riddle_id = params[:question][:riddle_id].to_i
    game = Game.find(params[:question][:game_id].to_i)

    user_answer = Answer.new(
      game: game,
      user: current_user,
      riddle_id: riddle_id,
      content: params.dig(:question, :answer)
    )
    riddle = Riddle.find(riddle_id)

    debugger


    place = Place.find(riddle.place_id)
    riddles = Riddle.where(place: place)
    next_riddle_index = riddles.index(riddle) + 1
    next_riddle = Riddle.all[next_riddle_index]


    if next_riddle_index < riddles.count
    end

    # check if the answer is correct
    if user_answer.content == riddle.solution
      user_answer.correct = true

      GameChannel.broadcast_to(
        "game-#{@game.id}",
        render_to_string(partial: "riddles", locals: { riddles: riddles })
      )
      render json: {
        status: :ok,
        next_riddle: render_to_string(partial: 'game_state', formats: [:html], locals: { riddle: next_riddle })
      }

      # render json: {
      #   status: :ok,
      #   next_riddle: render_to_string(partial: 'next_riddle', formats: [:html], locals: { riddle: next_riddle })
      # }
    else
      render json: {
        status: :error,
        message: "Incorrect answer. Please try again."
      }
    end
  end
end
