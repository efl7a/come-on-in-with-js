class StudySessionsController < ApplicationController
  before_action :set_study_session, only: [:show, :edit, :update, :destroy]
  def index
    @study_session = StudySession.new
    if params[:search]
      @study_sessions = StudySession.search(params[:search])
    else
      @study_sessions = policy_scope(StudySession)
    end
  end

  def show
    render json: @study_session
  end

  def new
    @study_session = StudySession.new
    authorize @study_session
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @study_session = current_user.study_sessions.build(study_session_params)
    authorize @study_session
    if @study_session.save
      # redirect_to user_study_sessions_path(current_user)
      render json: @study_session, status:201
    else
      flash[:alert] = "Study session did not save."
      render "index"
    end
  end

  def edit
    authorize @study_session
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
    render json: @study_session, status:201
  end

  def update
    authorize @study_session
    if @study_session.update(study_session_params)
      render json: @study_session, status:201
    else
      flash[:alert] = "Study session did not save."
      render "index"
    end
  end

  def destroy
    authorize @study_session
    @study_session.destroy
    # redirect_to user_study_sessions_path(current_user)
  end

  private
  def study_session_params
    params.require(:study_session).permit(:subject, :content, :date, :time, :grade)
    # params.permit(study_session: {})
  end

  def set_study_session
    @study_session = StudySession.find(params[:id])
  end
end
