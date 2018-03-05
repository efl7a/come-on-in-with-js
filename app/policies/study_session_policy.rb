class StudySessionPolicy < ApplicationPolicy
  attr_reader :study_session, :user

  def initialize(current_user, study_session)
    @user = current_user
    @object = study_session
  end

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

  def update?
    user.admin? || study_session.try(:user) == user
  end

  def destroy?
    user.admin? || study_session.try(:user) == user
  end
end
