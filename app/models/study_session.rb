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

end
