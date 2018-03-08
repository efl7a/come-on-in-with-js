class Users::RegistrationsController < Devise::RegistrationsController
  private

  def update_resource(resource, params)
    if current_user.provider == "google_oauth2"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :current_grade, :role, :email, :password, :password_confirmation)
  end

  def account_update_without_password_params
    params.require(:user).permit(:name, :current_grade, :role, :email)
  end

  def account_update_params
    params.require(:user).permit(:name, :current_grade, :role, :email, :password, :password_confirmation, :current_password)
  end
end
