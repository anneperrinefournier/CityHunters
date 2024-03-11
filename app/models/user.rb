class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :storylines

  has_one_attached :photo, dependent: :destroy

  # validates :name, presence: true
  validates :email, presence: true

  def find_participation_for(game)
    Participation.find_by(game: game, user: self)
  end
end
