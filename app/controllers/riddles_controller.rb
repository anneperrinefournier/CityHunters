class RiddlesController < ApplicationController
  def verify
    riddle_id = params[:question][:riddle_id].to_i
    user_answer = params.dig(:question, :answer)

    # params # DATA form the form

    riddle = Riddle.find(riddle_id)
    riddle_answer = riddle.content

    place = Place.find(riddle.place_id)
    riddles = Riddle.where(place: place)
    next_riddle_index = riddles.index(riddle) + 1
    next_riddle = Riddle.all[next_riddle_index]


    # check if the answer is correct
    if user_answer == riddle_answer
      render json: {
        status: :ok,
        next_riddle: render_to_string(partial: 'next_riddle', formats: [:html], locals: { riddle: next_riddle })
      }

    else
      render json: {
        status: :error,
        message: "Incorrect answer. You can try again!"
      }
    end

    # debugger

    # if next_riddle_index < riddles.size
    #   next_riddle = Riddle.all[next_riddle_index]
    # else
    #   puts "prout"
    # end



    # if correct
     # respond a json object with the html of the next riddle
    # else
      # respond a json object with error message
     # end

    # if user_answer == riddle.content
    #   render json: { status: :ok, next_riddle_html: render_to_string(partial: 'next_riddle', locals: { riddle: next_riddle }) }
    # else
    #   render json: { status: :error, message: "Incorrect answer. Try again." }
    # end
  end
end
