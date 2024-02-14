require "rqrcode"
require 'chunky_png'

class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline
  has_many :places, -> { order(created_at: :asc) }, through: :storyline
  has_many :riddles, through: :places
  has_many :answers, dependent: :destroy
  has_many :participations, dependent: :destroy

  before_create :set_game_pin
  after_create :generate_qr_code

  enum status: {
    not_started: 0,
    running: 1,
    ended: 2
  }

  def validated_places
    places.select do |place|
      place.validated?(self)
    end
  end

  def current_place
    places.find do |place|
      !place.validated?(self)
    end
  end

  def upcoming_places
    places.reject do |place|
      place.validated?(self)
    end
  end

  def format_duration(duration)
    hours = (duration / 3600).to_i
    minutes = ((duration % 3600) / 60).to_i
    seconds = (duration % 60).to_i
    duration_string = ""
    duration_string += "#{hours} #{'heure'.pluralize(hours)} " if hours > 0
    duration_string += "#{minutes} #{'minute'.pluralize(minutes)} " if minutes > 0
    duration_string += "#{seconds} #{'seconde'.pluralize(seconds)}" if seconds > 0
    duration_string.strip
  end

  def duration
    end_time - start_time
  end

  def ended!
    update(end_time: Time.now)
    super
  end

  private

  def set_game_pin
    self.pin = 4.times.map { ('A'..'Z').to_a.sample }.join
  end

  def generate_qr_code
    return if qr_code.present?

    qr_code_url = Rails.application.routes.url_helpers.access_game_qr_code_url(game: { pin: })

    # qr_code_url = "https://www.cityhunters.site/games/#{id}/lobby"
    # qr_code_url = "https://9eee-77-132-153-212.ngrok-free.app/games/access_qr_code?id=#{self.id}"

    qrcode = RQRCode::QRCode.new(qr_code_url)


    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      color_mode: ChunkyPNG::COLOR_TRUECOLOR_ALPHA,
      fill: ChunkyPNG::Color::TRANSPARENT,
      color: 'black',
      size: 200,
      border_modules: 4,
      module_px_size: 11,
      file: nil # Don't generate file
    )

    # Envoyer les données de l'image PNG directement vers Cloudinary
    cloudinary_response = Cloudinary::Uploader.upload(
      "data:image/png;base64,#{Base64.strict_encode64(png.to_s)}"
    )

    # Stocker l'URL de l'image Cloudinary dans le champ qr_code
    self.qr_code = cloudinary_response["secure_url"]
    save
  end
end
