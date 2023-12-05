class RiddlesController < ApplicationController
  def verify
    @game = Game.find(params[:game_id].to_i)

    user_answer = create_answer(params)

    raise if user_answer.nil?

    # check if the answer is correct
    if user_answer.correct
      user_answer.update(correct: true)

      render json: {
        status: :ok,
        message: "Correct answer!"
      }

      GameChannel.broadcast_to(
        "game-#{@game.id}",
        {
          action: 'toast',
          type: 'html',
          text: "#{current_user.name} a résolu l’énigme!"
        }
      )

      if @game.current_place.nil?
        @game.update(status: :ended)

        GameChannel.broadcast_to(
          "game-#{@game.id}",
          {
            action: 'update_game_content',
            type: 'html',
            game_status: @game.status,
            content: render_to_string(partial: "/games/end_game", formats: [:html])
          }
        )

        GameChannel.broadcast_to(
          "game-#{@game.id}",
          {
            action: 'toast',
            type: 'html',
            text: "Vous avez gagné la partie!"
          }
        )
      else
        GameChannel.broadcast_to(
          "game-#{@game.id}",
          {
            action: 'update_riddle',
            type: 'html',
            game_status: @game.status,
            content: render_to_string(partial: "/games/game_state", formats: [:html], locals: { game: @game })
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

  def create_answer(params)
    riddle = Riddle.find(params[:riddle_id].to_i)
    participation = Participation.find_by(user: current_user)

    if riddle.motion_type == 'shifting'
      user_answer = Answer.new(
        game: @game,
        participation: Participation.find_by(user: current_user),
        riddle: riddle,
        content: "Lat:#{params['latitude']},Lng:#{params['longitude']}" #params.dig(:question, :answer)
      )
      user_answer.save!

      # Compute the answer proximity to the place
      # distance_degree_equator = 111_319.0 # Distance in meters per latitude/longitude degree at equator
      # distance_degree_lat = distance_degree_equator
      # distance_degree_lng = Math.cos(riddle.place.latitude) * distance_degree_equator

      # # Hypothèse de proximité circulaire et non elipsoïdal
      # default_radius = 500.0
      # delta_angle_lat = default_radius / distance_degree_lat
      # delta_angle_lng = default_radius / distance_degree_lng

      # debugger

      # if (participation.latitude - riddle.place.latitude).abs <= delta_angle_lat &&
      #    (participation.longitude - riddle.place.longitude).abs <= delta_angle_lng

      places_near = Place.near([participation.latitude, participation.longitude], 0.5)

      user_answer.update(correct: true) unless places_near.count(riddle.place.id).zero?

      return user_answer
    end

    if riddle.motion_type == 'static'
      user_answer = Answer.new(
        game: @game,
        participation: Participation.find_by(user: current_user),
        riddle: riddle,
        content: params.dig(:question, :answer)
      )
      user_answer.save!

      user_answer.update(correct: true) if user_answer.content == riddle.solution

      return user_answer
    end
  end
end
