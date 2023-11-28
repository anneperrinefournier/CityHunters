class Place < ApplicationRecord
  belongs_to :storyline
  has_many :riddles, dependent: :destroy
  validates :name, presence: true
end
