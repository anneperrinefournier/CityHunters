class Riddle < ApplicationRecord
  belongs_to :place
  has_many :clues, dependent: :destroy

  has_one_attached :photo, dependent: :destroy
end
