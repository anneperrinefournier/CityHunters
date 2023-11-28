class Riddle < ApplicationRecord
  belongs_to :place
  has_many :clues, dependent: :destroy
end
