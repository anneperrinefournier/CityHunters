class Storyline < ApplicationRecord
  belongs_to :user

  has_one_attached :photo, dependent: :destroy
  has_many :places, -> { order(created_at: :asc) }, dependent: :destroy

  accepts_nested_attributes_for :places, allow_destroy: true

  validates :title, :theme, :district, :long_description, presence: true
  validates :theme, inclusion: { in: %w(historique policier nature enquete fantastique artistique technologie urbain) }
  validates :duration,    presence: false,
                          numericality: { only_integer: true, inclusion: [15, 30, 45, 60, 75, 90, 105, 120] },
                          allow_blank: true
  validates :difficulty,  presence: false,
                          numericality: { only_integer: true, in: 1..3 },
                          allow_blank: true
  validates :duration, presence: true, on: :set_storyline_ready

end
