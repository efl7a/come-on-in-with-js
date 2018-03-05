class StudySessionsController < ApplicationController
  def index
    if params[:user_id]
      @study_sessions = User.find(params[:user_id]).study_sessions
    else
      @study_sessions = StudySession.find_by(grade: current_user.grade)
    end
  end
end
