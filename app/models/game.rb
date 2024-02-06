class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline
  has_many :places, -> { order(created_at: :asc) }, through: :storyline
  has_many :riddles, through: :places
  has_many :answers, dependent: :destroy
  has_many :participations, dependent: :destroy

  before_create :set_game_pin

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
    # delete_qr_code
    super
  end

  private

  def set_game_pin
    self.pin = 4.times.map { ('A'..'Z').to_a.sample }.join
    generate_qr_code
  end

  def generate_qr_code
    return if ended? # Ne génère pas le QR code si la partie est terminée
    qr_code_data = "https://www.cityhunters.site/games/#{self.pin}/lobby"
    qrcode = RQRCode::QRCode.new(qr_code_data)
    image = qrcode.as_png(size: 120)

    # Télécharger l'image dans Cloudinary
    cloudinary_upload = Cloudinary::Uploader.upload(image.to_blob, public_id: "#{self.pin}_qr_code")

    # Récupérer l'URL de l'image téléchargée depuis Cloudinary et la sauvegarder dans self.qr_code
    self.qr_code = cloudinary_upload['secure_url']
  end

  # def delete_qr_code
  #   return unless qr_code.present?

  #   # Supprimer le fichier du répertoire des assets
  #   file_path = Rails.root.join('app', 'assets', 'images', qr_code)
  #   File.delete(file_path) if File.exist?(file_path)

  #   # Supprimer la référence au fichier dans la base de données
  #   self.qr_code = nil
  # end
end
