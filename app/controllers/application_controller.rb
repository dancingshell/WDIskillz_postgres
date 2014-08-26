class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
 
  def new_user
    @user = User.new
  end

  private
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def current_user=(user)
  current_user = user
  end
  def current_user=(user)
  sign_in(user)
end
end
