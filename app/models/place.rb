class Place < ApplicationRecord
  belongs_to :storyline
  has_one_attached :photo, dependent: :destroy
  
  has_many :riddles, -> { order(created_at: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :riddles, allow_destroy: true

  validates :name, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def validated?(game)
    riddles.all? do |riddle|
      riddle.validated?(game)
    end
  end

  def validated_riddles(game)
    riddles.select do |riddle|
      riddle.validated?(game)
    end
  end

  def current_riddle(game)
    riddles.find do |riddle|
      !riddle.validated?(game)
    end
  end

  def upcoming_riddles(game)
    riddles.reject do |riddle|
      riddle.validated?(game)
    end
  end
end
