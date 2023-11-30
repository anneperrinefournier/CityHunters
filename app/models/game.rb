class Game < ApplicationRecord
  belongs_to :user
  belongs_to :storyline
  has_many :places, -> { order(created_at: :asc) }, through: :storyline
  has_many :riddles, through: :places

  has_many :participations, dependent: :destroy

  before_create :set_game_pin
  after_create :set_current_place_id
  after_create :set_current_riddle_id

  enum status: {
    not_started: 0,
    running: 1,
    over: 2
  }

  def validated_places(game)
    places.select do |place|
      place.validated?(game)
    end
  end

  def current_place(game)
    places.find do |place|
      !place.validated?(game)
    end
  end

  def upcoming_places(game)
    places.reject do |place|
      place.validated?(game)
    end
  end

  def next_place!
    place_index = storyline.places.order(created_at: :asc).index { |place| place.id == current_place_id }
    self.current_place_id = storyline.places[place_index + 1].id
    save
  end

  def next_riddle!
    riddle_index = storyline.places.find(current_place_id).riddles.order(created_at: :asc).index { |riddle| riddle.id == current_riddle_id }

    if riddle_index < storyline.places[current_place_id].riddles.count
      self.current_riddle_id = storyline.places.find(current_place_id).riddles.order(created_at: :asc)[riddle_index + 1].id
    else
      next_place!
      place_index = storyline.places.order(created_at: :asc).index { |place| place.id == current_place_id }
      self.current_riddle_id = storyline.places.order(created_at: :asc)[place_index + 1].riddles.order(created_at: :asc).first
    end
  end

  private

  def set_game_pin
    self.pin = 7.times.map { ('A'..'Z').to_a.sample }.join
  end

  def set_current_place_id
    self.current_place_id = storyline.places.order(created_at: :asc).first.id
    save
  end

  def set_current_riddle_id
    self.current_riddle_id = storyline.places.find(current_place_id).riddles.order(created_at: :asc).first
    save
  end
end
