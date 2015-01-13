class AppController < ApplicationController
  def index
    current_user
  end

  private
  def current_user
    user_id = session[:current_user_id]
    @_current_user ||= user_id && User.find(user_id)
  end
end
