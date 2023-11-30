class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates_uniqueness_of :user, scope: :game
end
