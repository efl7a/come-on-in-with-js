class AdminController < ApplicationController
  before_action :authorize_admin

  def index
    if params[:search]
      @study_sessions = StudySession.by_date(params[:search])
    end
  end

  def show
  end

  private
  def authorize_admin
    current_user.admin?
  end
end
