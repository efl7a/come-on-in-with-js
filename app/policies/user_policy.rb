class UserPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(current_user, user)
    @user = current_user
    @object = user
  end

  def index?
    user.admin?
  end

  def show?
    user.admin? || @object == user
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin? 
  end
end
