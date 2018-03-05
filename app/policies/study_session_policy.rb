class StudySessionPolicy < ApplicationPolicy
  attr_reader :study_session

  def initialize(current_user, study_session)
    @user = current_user
    @object = study_session
  end

  def index?
  end

  def show?
  end

  def create
    user.admin? || user.teacher?
  end

  def update?
    user.admin? || study_session.try(:user) == user
  end

  def destroy?
    user.admin? || study_session.try(:user) == user
  end
end
