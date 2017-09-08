class SessionsController < ApplicationController
  include SessionsHelper

  def create
    # Receive data from auth provider
    user_info = request.env['omniauth.auth']

    user_name = user_info['info']['name']
    user_email = user_info['info']['email'].downcase

    provider_uid = user_info['uid']
    provider_column = :google_id if params[:provider] == 'google_oauth2'
    provider_column = :github_id if params[:provider] == 'github'
    raise SanityError.new("Unknown Oauth provider") unless provider_column

    @user = User.find_by(email: user_email)

    if @user
      check_stored_uid provider_column, provider_uid
      if @user.save && create_cookies_and_session
        redirect_to @user, success: "Logged in"
      else
        redirect_to :root, warning: "Failed to log in"
      end
    else
      @user = User.new(name: user_name, email: user_email, provider_column => provider_uid)
      if @user.save && create_cookies_and_session
        redirect_to @user, success: "Account created succesfully"
      else
        redirect_to :root, warning: "We were unable to create an account"
      end
    end
  end

  def destroy
    log_out
    redirect_to :root, success: "You have logged out"
  end
end