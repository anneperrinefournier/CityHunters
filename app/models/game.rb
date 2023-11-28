class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline

  enum status: {
    not_started: 0,
    started: 1,
    finished: 2
  }
end
