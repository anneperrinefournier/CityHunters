class Riddle < ApplicationRecord
  belongs_to :place
  has_many :clues, dependent: :destroy
  has_many :answers, dependent: :destroy

  has_one_attached :photo, dependent: :destroy

  def validated?(game)
    !!game.answers.find_by(correct: true)
  end
end
