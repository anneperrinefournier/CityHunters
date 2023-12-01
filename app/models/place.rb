class Place < ApplicationRecord
  belongs_to :storyline
  has_many :riddles, -> { order(created_at: :asc) }, dependent: :destroy
  validates :name, :address, presence: true

  has_one_attached :photo

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
