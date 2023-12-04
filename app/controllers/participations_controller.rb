class ParticipationsController < ApplicationController
  def update
    Participation.find(params[:participation_id].to_i).update(latitude: params[:latitude], longitude: params[:longitude])
  end

  # def qr_code_download
  #   send_data RQRCode::QRCode.new(params[:content].to_s).as_png(size: 300), type: 'image/png', disposition: 'attachment'
  # end
end
