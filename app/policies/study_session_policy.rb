class StudySessionPolicy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError unless user
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.present_or_future
      elsif user.teacher?
        scope.present_or_future.where(user_id: user.id)
      else
        scope.present_or_future.where(grade: user.current_grade)
      end
    end
  end
  # def index?
  # end
  #
  # def show?
  # end

  def new?
    user.admin? || user.teacher?
  end

  def create?
    user.admin? || user.teacher?
  end

  def edit?
    user.admin? || user.teacher?
  end

  def update?
    user.admin? || record.teacher == user
  end

  def destroy?
    user.admin? || record.teacher == user
  end
end
