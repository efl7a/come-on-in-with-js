class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :rememberable, :trackable, :validatable,
  #:confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable

  enum role: [:student, :teacher, :admin]
  has_many :study_sessions
  has_many :attendees, through: :study_sessions

end
