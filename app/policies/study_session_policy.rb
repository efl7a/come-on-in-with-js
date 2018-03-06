class StudySessionPolicy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      elsif user.teacher?
        scope.where(user_id: user.id)
      else
        scope.where(grade: user.current_grade)
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
