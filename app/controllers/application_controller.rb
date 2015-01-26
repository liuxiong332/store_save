class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  protected
  def current_user
    @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end

  def current_user=(user)
    @current_user = user
    session[:current_user_id] = user.id
  end
end
