class AttendeePolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError unless user
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      elsif user.teacher?
        scope.where(study_session_id: user.study_sessions)
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def create?
    user.admin? || user.teacher? || record.user_id == user.id
  end

  def destroy?
    user.admin? || user.teacher? || record.user_id == user.id
  end
end
