class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit
  before_action :user_signed_in?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    if current_user.provider == 'google_oauth2'
      edit_user_registration_path
    else
      request.env['omniauth.origin'] || study_sessions_path
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
