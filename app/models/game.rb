require "rqrcode"

class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline
  has_many :places, -> { order(created_at: :asc) }, through: :storyline
  has_many :riddles, through: :places
  has_many :answers, dependent: :destroy
  has_many :participations, dependent: :destroy

  before_create :set_game_pin, :generate_qr_code

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
    qrcode = RQRCode::QRCode.new("https://www.cityhunters.site/games/#{id}/lobby")

    # convertir le code QR en une chaîne SVG + options
    svg = qrcode.as_svg(
      offset: 0, #Padding around the QR Code in pixels
      fill: :currentColor, #background-color
      color: "000", #Foreground color
      module_size: 11,
      shape_rendering: "crispEdges",
      # standalone: true,
      # use_path: true
    )
    # # Télécharger la chaîne SVG sur Cloudinary
    # cloudinary_response = Cloudinary::Uploader.upload(svg, options = {})

    # # Stocker l'URL de l'image Cloudinary dans le champ qr_code
    # self.qr_code = cloudinary_response["secure_url"]
  end
end
