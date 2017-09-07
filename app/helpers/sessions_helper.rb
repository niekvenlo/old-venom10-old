module SessionsHelper

  def current_user
    if session[:id]
      @current_user ||= User.find_by(id: session[:id])

    elsif token = cookies.encrypted[:session_token]
      session = Session.find_by(token: token)
      # return nil if session.created_at < Time.current - 1.day

      @current_user = session.user
      session[:id] = @current_user.id
      @current_user
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete :id
    session.delete :id_created_at
    cookies.delete :session_token
    @current_user = nil
  end

  private
  def create_token
    SecureRandom.urlsafe_base64
  end

  def check_stored_uid provider_column, provider_uid
    if @user[provider_column]
      raise SanityError.new("Cannot match uid") unless @user[provider_column] == provider_uid
    else
      @user[provider_column] = provider_uid
    end
  end

  def create_cookies_and_session
    token = create_token
    session[:id] = @user.id
    session[:id_created_at] = Time.current
    cookies.encrypted[:session_token] = [token, Time.current]
    @session = Session.new(user: @user, token: token)
    @session.save
  end
end
