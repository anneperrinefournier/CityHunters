class Place < ApplicationRecord
  belongs_to :storyline
  has_many :riddles, dependent: :destroy
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
