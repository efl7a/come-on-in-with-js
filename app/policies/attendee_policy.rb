class AttendeePolicy < ApplicationPolicy
  attr_reader :user, :attendee

  def initialize(current_user, attendee)
    @user = current_user
    @attendee = attendee
  end

  def create?
    user.admin? || user.teacher? || attendee.user_id == user.id
  end

  def destroy?
    user.admin? || user.teacher? || attendee.user_id == user.id
  end
end
