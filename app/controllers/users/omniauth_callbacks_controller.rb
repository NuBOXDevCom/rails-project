module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
      auth = request.env['omniauth.auth']
      if user_signed_in?
        user = current_user
        user.update(facebook_id: auth.uid)
        redirect_to root_path, success: "Votre compte est maintenant relié avec Facebook :)"
      elsif (user = User.find_by_email auth.info.email)
        if user.facebook_id.empty?
          user.update(facebook_id: auth.uid)
          flash[:success] = "Votre compte est maintenant relié avec Facebook :)"
        end
        sign_in_and_redirect user, event: :authentication
      else
        @user = User.from_facebook(request.env['omniauth.auth'])
        if @user.persisted?
          sign_in_and_redirect @user, event: :authentication
        else
          redirect_to new_user_registration_path, warning: 'Erreur lors de la connexion avec Facebook,
               veuillez vous enregistrer manuellement.'
        end
      end
    end
  end
end