class Storyline < ApplicationRecord
  has_many :places, dependent: :destroy
  validates :title, presence: true

  has_one_attached :photo, dependent: :destroy
end
