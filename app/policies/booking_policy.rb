class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user != record.game.user
  end

  def show?
    true
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end

  def accept?
    user == record.game.user
  end

  def decline?
    accept?
  end
end
