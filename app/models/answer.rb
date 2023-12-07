class Answer < ApplicationRecord
  belongs_to :participation
  belongs_to :riddle
  belongs_to :game

  def solver
    participation.user
  end
end
