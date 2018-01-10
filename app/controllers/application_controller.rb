class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_parameters, if: :devise_controller?
  add_flash_types :success, :danger, :primary, :secondary, :warning, :info, :light, :dark
  before_action :authenticate_user!

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :gender, :height, :birthday)}
  end

  rescue_from CanCan::AccessDenied do
    redirect_to root_path, warning: "Vous n'avez pas l'autorisation d'accéder à la page demandée"
  end
end
