class AttendeePolicy < ApplicationPolicy

  def create?
    user.admin? || user.teacher? || record.user_id == user.id
  end

  def destroy?
    user.admin? || user.teacher? || record.user_id == user.id
  end
end
