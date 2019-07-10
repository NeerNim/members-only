class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def sign_out
    cookies.delete(:remember_token)
    cookies.delete(:user_id)
  end
end
