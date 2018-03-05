class StudySessionsController < ApplicationController

  def index
    if params[:user_id]
      @study_sessions = User.find(params[:user_id]).study_sessions
    else
      @study_sessions = StudySession.find_by(grade: current_user.grade)
    end
  end

  def show
    @study_session = StudySession.find(params[:id])
  end

  def new
    @study_session = StudySession.new
    authorize @study_session
  end

  def create
    @study_session = StudySession.new(study_session_params)
    authorize @study_session
    @study_session.teacher = current_user
    binding.pry
    if @study_session.save
      redirect_to user_study_sessions_path(user_id: current_user)
    else
      flash[:alert] = "Study session did not save."
      render "index"
    end
  end

  private
  def study_session_params
    params.require(:study_session).permit(:subject, :content, :date, :time, :grade)
  end
end
