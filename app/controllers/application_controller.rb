class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  before_action :user_signed_in?

end
