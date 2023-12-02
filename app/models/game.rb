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

  private

  def set_game_pin
    self.pin = 4.times.map { ('A'..'Z').to_a.sample }.join
  end
end
