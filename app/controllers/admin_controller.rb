class AdminController < ApplicationController
  before_action :authorize_admin
  def index

  end

  private
  def authorize_admin
    current_user.admin?
  end
end
