class StudySession < ApplicationRecord
  belongs_to :user
  has_many :attendees
end
