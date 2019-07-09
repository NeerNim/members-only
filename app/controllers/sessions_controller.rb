class SessionsController < ApplicationController

  def new
    @user = User.new
    session[:current_user_id] = @user.id
  end
  
  def create  
  end

  def destroy    
  end
end
