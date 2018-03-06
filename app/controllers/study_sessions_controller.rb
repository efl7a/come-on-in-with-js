class StudySessionsController < ApplicationController
  before_action :set_study_session, only: [:show, :edit, :update, :destroy]
  def index
    @study_sessions = policy_scope(StudySession)
  end

  def show
  end

  def new
    @study_session = StudySession.new
    authorize @study_session
  end

  def create
    @study_session = StudySession.new(study_session_params)
    authorize @study_session
    @study_session.teacher = current_user
    if @study_session.save
      redirect_to user_study_sessions_path(current_user)
    else
      flash[:alert] = "Study session did not save."
      render "index"
    end
  end

  def edit
    authorize @study_session
  end

  def update
    authorize @study_session
    if @study_session.update(study_session_params)
      redirect_touser_study_sessions_path(current_user)
    else
      flash[:alert] = "Study session did not save."
      render "index"
    end
  end

  def destroy
    authorize @study_session
    @study_session.destroy
    redirect_to user_study_sessions_path(current_user)
  end

  private
  def study_session_params
    params.require(:study_session).permit(:subject, :content, :date, :time, :grade)
  end

  def set_study_session
    @study_session = StudySession.find(params[:id])
  end
end
