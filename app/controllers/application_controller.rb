class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def log_in(user)
    cookies.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    current_user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])  
  end
  helper_method :current_user


  def logged_in?
    !current_user.nil?
  end

  def log_out
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
    @current_user = nil
  end
  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end

  
end
