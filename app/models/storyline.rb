class Storyline < ApplicationRecord
  has_many :places, dependent: :destroy
  validates :title, presence: true
end
