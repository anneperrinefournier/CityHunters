class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline

  has_many :participations, dependent: :destroy

  enum status: {
    not_started: 0,
    running: 1,
    over: 2
  }
end
