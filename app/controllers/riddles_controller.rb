class RiddlesController < ApplicationController
  def verify
    riddle = Riddle.find(params[:riddle_id].to_i)
    @game = Game.find(params[:game_id].to_i)

    user_answer = create_answer(params)

    # check if the answer is correct
    if user_answer&.correct
      user_answer.update(correct: true)

      render json: {
        status: :ok,
        message: "Correct answer!"
      }

      GameChannel.broadcast_to(
        "game-#{@game.id}",
        {
          data_type: 'toast',
          type: 'html',
          text: "#{current_user.name} a résolu l’énigme!"
        }
      )

      if @game.current_place.nil?
        # @game.update(status: :ended, end_time: Time.now)
        @game.ended!

        GameChannel.broadcast_to(
          "game-#{@game.id}",
          {
            data_type: 'update_game_content',
            type: 'html',
            game_status: @game.status,
            content: render_to_string(partial: "/games/end_game", formats: [:html])
          }
        )

        GameChannel.broadcast_to(
          "game-#{@game.id}",
          {
            data_type: 'toast',
            type: 'html',
            text: "Vous avez gagné la partie!"
          }
        )
      else
        if riddle.motion_type == 'shifting'
          GameChannel.broadcast_to(
            "game-#{@game.id}",
            {
              data_type: 'update_riddle',
              type: 'html',
              game_status: @game.status,
              content: render_to_string(partial: "/games/game_state", formats: [:html], locals: { game: @game }),
              place_marker: create_place_marker(@game.current_place)
            })
        else
          GameChannel.broadcast_to(
            "game-#{@game.id}",
            {
              data_type: 'update_riddle',
              type: 'html',
              game_status: @game.status,
              content: render_to_string(partial: "/games/game_state", formats: [:html], locals: { game: @game })
            })
        end
      end

    else
      titles = ["Sapristi !", "Fichtre !", "Pardi !", "Saperlipopette !", "Saperlotte !", "Tonnerre de brest !"]
      texts = ["La bonne réponse n'est certainement pas loin", "Je suis sûr que tu l'as sur le bout de la langue"]
      button_text = ["Je ne laisse pas tomber", "Je cherche, je cherche...", "Hum..."]
      render json: {
        status: :error,
        title: titles.sample,
        message: texts.sample,
        button_text: button_text.sample
      }
    end
  end

  private

  def create_answer(params)
    riddle = Riddle.find(params[:riddle_id].to_i)
    participation = Participation.find_by(user: current_user)

    if riddle.motion_type == 'shifting' &&
       params['answer_type'] == 'new_shifting_answer'

      user_answer = Answer.new(
        game: @game,
        participation: Participation.find_by(user: current_user),
        riddle: riddle,
        content: "Lat:#{params['latitude']},Lng:#{params['longitude']}"
      )
      user_answer.save!

      default_radius = 1 #km
      places_near = Place.near([participation.latitude, participation.longitude], default_radius)
      next_place = @game.upcoming_places[1] # The index 0 is the current place

      user_answer.update(correct: true) unless places_near.count(next_place.id).zero?

      return user_answer
    end

    if riddle.motion_type == 'static' &&
       params['answer_type'] == 'new_static_answer'

      user_answer = Answer.new(
        game: @game,
        participation: Participation.find_by(user: current_user),
        riddle: riddle,
        content: params.dig(:question, :answer)
      )
      user_answer.save!

      solutions_words = riddle.solution.downcase.split
      if riddle.solution.empty? || user_answer.content.downcase.split.any? { |word| solutions_words.include?(word) }
        user_answer.update(correct: true)
      end

      return user_answer
    end
  end

  def create_place_marker(place)
    place.geocoded({
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "games/places_info_window", locals: { place: place }),
        marker_html: render_to_string(partial: "games/marker", locals: { marker_class: "marker marker-blue" })
      })
  end
end
