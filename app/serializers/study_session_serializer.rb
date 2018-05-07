class StudySessionSerializer < ActiveModel::Serializer
  attributes :id, :grade, :subject, :date, :time, :content
  belongs_to :teacher, class_name: "User", foreign_key: :user_id
  has_many :attendees
  has_many :students, through: :attendees, foreign_key: :user_id
end
