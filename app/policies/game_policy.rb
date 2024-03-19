class GamePolicy < ApplicationPolicy
  class Scope < Scope

    def show?
      true
    end

    def create?
      true
    end

    def join?
      true
    end

    def access?
      true
    end

    def lobby?
      true
    end

    def stats?
      true
    end

    def start?
      true
    end

    def end_game?
      true
    end
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
