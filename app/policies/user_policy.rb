class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def show?
    return true
  end

  def edit?
    return true
  end

end




