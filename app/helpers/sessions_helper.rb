module SessionsHelper
  def log_in(user)
    cookies.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    current_user
  end
  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])  
  end
  def logged_in?
    !current_user.nil?
  end
  
end
