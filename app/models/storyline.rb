class Storyline < ApplicationRecord
  has_many :places, dependent: :destroy
  validates :title, presence: true

  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?
end
