class HomeController < ApplicationController

  require 'rest-client'

  def index
    redirect_to new_user_session_path unless user_signed_in?

    @api_password = current_user.api_password
  end

  def activate_api
    user_api = UserApi.find(current_user.id)
    password_generated = SecureRandom.hex(18)
    user_api.password = password_generated
    user_api.api_password = password_generated
    user_api.save
    redirect_to :root, success: 'Mot de passe API généré avec succès !'
  end

end
