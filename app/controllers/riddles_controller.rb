class RiddlesController < ApplicationController
  def verify
    game = Game.find(params[:game_id].to_i)
    @game = game

    user_answer = generate_answer(params)

    # check if the answer is correct
    if user_answer.correct
      user_answer.update(correct: true)

      render json: {
        status: :ok,
        message: "Correct answer!"
      }

      GameChannel.broadcast_to(
        "game-#{game.id}",
        {
          action: 'toast',
          type: 'html',
          text: "#{current_user.name} a résolu l’énigme!"
        }
      )

      if game.current_place.nil?
        game.update(status: :ended)

        GameChannel.broadcast_to(
          "game-#{game.id}",
          {
            action: 'update_game_content',
            type: 'html',
            game_status: game.status,
            content: render_to_string(partial: "/games/end_game", formats: [:html])
          }
        )

        GameChannel.broadcast_to(
          "game-#{game.id}",
          {
            action: 'toast',
            type: 'html',
            text: "Vous avez gagné la partie!"
          }
        )
      else
        GameChannel.broadcast_to(
          "game-#{game.id}",
          {
            action: 'update_riddle',
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

  private

  def generate_answer(params)
    riddle = Riddle.find(params[:riddle_id].to_i)

    debugger

    if params['action'] == 'new_shifting_answer'
      user_answer = Answer.new(
        game: game,
        participation: Participation.find_by(user: current_user),
        riddle: riddle,
        content: "Lat:#{params[latitude]},Lng:#{params[longitude]}" #params.dig(:question, :answer)
      )
      user_answer.save!

      # Compute the answer proximity to the place
      distance_degree_equator = 111.319
      distance_degree_lat = distance_degree_equator
      distance_degree_lng = Math.cos(riddle.place.latitude) * distance_degree_equator

      # Hypothèse de proximité sphérique et non elipsoïdal
      place_radius_lat = riddle.place.radius / distance_degree_lat
      place_radius_lng = riddle.place.radius / distance_degree_lng

      if abs(participation.latitude - riddle.place.latitude) <= place_radius_lat &&
         abs(participation.longitude - riddle.place.longitude) <= place_radius_lng

        user_answer.udpate(correct: true)
      end

      return user_answer
    end

    if params['action'] == 'new_static_answer'
      user_answer = Answer.new(
        game: game,
        participation: Participation.find_by(user: current_user),
        riddle: riddle,
        content: params.dig(:question, :answer)
      )
      user_answer.save!

      if user_answer.content == riddle.solution
        user_answer.udpate(correct: true)
      end

      return user_answer
    end
  end
end
