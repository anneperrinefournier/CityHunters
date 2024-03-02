class RiddlesController < ApplicationController
  before_action :set_riddle, only: %i[edit update destroy]
  before_action :set_place, only: %i[new edit update destroy]
  before_action :set_storyline, only: %i[new edit update destroy]

  def new
    @riddle = Riddle.new
    @riddle.place = @place
    if @riddle.save
      redirect_to edit_storyline_place_riddle_path(@storyline, @place, @riddle)
    else
      flash[:error] = "An error occured"
      redirect_to edit_storyline_place_path(place)
    end
  end

  def edit
    if @storyline.user == current_user
      render :edit
    else
      flash[:error] = "Action forbidden"
      redirect_to profile_path, status: :unauthorized
    end
  end

  def update
    if @storyline.user == current_user
      @riddle.update(riddle_params)
      if @riddle.save
        flash[:notice] = "L'énigme a été mise à jour"
        redirect_to edit_storyline_place_riddle_path(@storyline, @place, @riddle)
      else
        redirect_to edit_storyline_place_riddle_path(@storyline, @place, @riddle), status: :unprocessable_entity
      end
    else
      flash[:error] = "Action forbidden"
      redirect_to profile_path, status: :unauthorized
    end
  end

  def destroy
    if @storyline.user == current_user
      @riddle.destroy
      redirect_to edit_storyline_place_path(@storyline, @place)
      flash[:notice] = "Enigme supprimée"
    else
      flash[:error] = "Action forbidden"
      redirect_to profile_path, status: :unauthorized
    end
  end

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
        @user_participation = @game.participations.find_by(user: current_user)

        # Create the next state message in order to broadcast it to disconnected users
        new_riddle_message = StateMessage.create!(game: @game)
        new_riddle_message.index = StateMessage.where(game: @game).count + 1
        new_riddle_message.data_type = "update_riddle"
        new_riddle_message.content = render_to_string(
          partial: "/games/game_state",
          formats: [:html],
          locals: {
            game: @game,
            last_state_id: new_riddle_message.id
          }
        )
        new_riddle_message.save!

        GameChannel.broadcast_to(
          "game-#{@game.id}",
          {
            data_type: new_riddle_message.data_type,
            type: 'html',
            state_message_index: new_riddle_message.index,
            content: new_riddle_message.content
          })

        if riddle.motion_type == 'shifting'
          new_place_message = StateMessage.new(
            game: @game,
            data_type: 'new_marker',
            index: new_riddle_message.index + 1,
            content: create_place_marker(@game.current_place).to_json
          )
          new_place_message.save

          GameChannel.broadcast_to(
            "game-#{@game.id}",
            {
              data_type: new_place_message.data_type,
              type: 'html',
              state_message_index: new_place_message.index,
              content: JSON.parse(new_place_message.content).symbolize_keys
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
    participation = Participation.find_by(game: params['game_id'], user: current_user)

    if riddle.motion_type == 'shifting' &&
       params['answer_type'] == 'new_shifting_answer'

      user_answer = Answer.new(
        game: @game,
        participation: participation,
        riddle: riddle,
        content: "Lat:#{participation.latitude},Lng:#{participation.longitude}"
      )
      user_answer.save!

      default_radius = 1 #0.06
      places_near = Place.near([participation.latitude, participation.longitude], default_radius)
      next_place = @game.upcoming_places[1] # The index 0 is the current place

      user_answer.update(correct: true) unless places_near.count(next_place.id).zero?

      return user_answer
    end

    if riddle.motion_type == 'static' &&
       params['answer_type'] == 'new_static_answer'

      user_answer = Answer.new(
        game: @game,
        participation: participation,
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
    {
      lat: place.latitude,
      lng: place.longitude,
      info_window_html: render_to_string(partial: "games/places_info_window", locals: { place: place }, formats: [:html]),
      marker_html: render_to_string(partial: "games/marker", locals: { marker_class: "marker marker-blue" }, formats: [:html])
    }
  end

  private

  def riddle_params
    params.require(:riddle).permit(:title, :photo, :question, :solution, :description, :motion_type)
  end

  def set_riddle
    @riddle = Riddle.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_storyline
    @storyline = Storyline.find(params[:storyline_id])
  end
end
