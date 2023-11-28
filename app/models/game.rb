class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline
  belongs_to :participation

  enum status: {
    not_started: 0,
    started: 1,
    finished: 2
  }
end
