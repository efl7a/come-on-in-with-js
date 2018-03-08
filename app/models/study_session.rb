class StudySession < ApplicationRecord
  belongs_to :teacher, class_name: "User", foreign_key: :user_id
  has_many :attendees
  has_many :students, through: :attendees, foreign_key: :user_id

  SUBJECTS = [
    "ESL", "Honors ESL", "Math", "Honors Math", "Social Studies", "Science", "French", "Spanish", "Band", "Journalism", "Drama", "Art"
  ]

  validates :grade, presence: true
  validates :content, presence: true
  validates :date, presence: true
  validates :time, presence: true

  def self.subjects
    SUBJECTS
  end

  def self.by_grade(grade)
    self.where(grade: grade)
  end

  def self.by_student(student)
    sessions_attending = []
    Attendee.where(user_id: student.id).each do |attendee|
      sessions_attending << attendee.study_session
    end
    self.where(id: sessions_attending)
  end

  def self.by_date(date)
    self.where(date: date)
  end

  def self.search(search)
    self.where(date: search)
  end

  def self.present_or_future
    self.ordered_by_date.where("date > ?", Date.today)
  end

  def self.ordered_by_date
    self.order(:date)
  end
end
