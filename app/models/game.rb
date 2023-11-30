class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline

  has_many :participations, dependent: :destroy

  before_create :set_game_pin

  enum status: {
    not_started: 0,
    running: 1,
    over: 2
  }

  private

  def set_game_pin
    self.pin = 7.times.map { ('A'..'Z').to_a.sample }.join
  end
end
