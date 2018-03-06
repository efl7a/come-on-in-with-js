class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :trackable, :validatable,
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

  enum role: [:student, :teacher, :admin]
  has_many :study_sessions
  has_many :students, through: :study_sessions
  has_many :attendees

  def attending?(study_session)
    Attendee.where(user_id: self.id, study_session_id: study_session.id).exists?
  end

  def attendance_record(study_session)
    Attendee.find_by(user_id: self.id, study_session_id: study_session.id)
  end
end
