class Participation < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :users, dependent: :destroy
end
