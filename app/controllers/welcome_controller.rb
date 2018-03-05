class WelcomeController < ApplicationController
  skip_before_action :user_signed_in?, only: :index
  def index
  end
end
