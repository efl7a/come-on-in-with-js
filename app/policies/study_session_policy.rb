class StudySessionPolicy < ApplicationPolicy

  def index?
  end

  def show?
  end

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
