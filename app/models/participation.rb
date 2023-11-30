class Participation < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates_uniqueness_of :user, scope: :game
end
