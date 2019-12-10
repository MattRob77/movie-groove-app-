class CallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"].provider, request.env["omniauth.auth"].uid, request.env["omniauth.auth"].extra.raw_info.name, request.env["omniauth.auth"].info.email)
    if @user.persisted? #Active Record Method, Returns true if the record is persisted, i.e. it’s not a new record and it was not destroyed, otherwise returns false.
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].uid # Removing extra as it can overflow some session stores/CookieOverflow
      redirect_to new_user_registration_url
    end
  end
end

#DeviseCallBacksTutorial
