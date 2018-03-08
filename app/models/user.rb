class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :trackable, :validatable,
  #:confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :omniauthable, omniauth_providers: [:google_oauth2]

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

  def self.attending_by_date(date)
    students_attending = []
    StudySession.by_date(date).each do |study_session|
      students_attending += study_session.students
    end
    self.where(id: students_attending)
  end

  def self.from_omniauth(auth)
    self.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
