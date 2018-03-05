class Attendee < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: :user_id
  belongs_to :study_session
end
