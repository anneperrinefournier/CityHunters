class ParticipationsController < ApplicationController
  def update
    Participation.find(params[:participation_id].to_i).update(latitude: params[:latitude], longitude: params[:longitude])
  end
end
