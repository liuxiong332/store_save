class AppController < ApplicationController
  def index
    current_user
  end

  def new_user
    @current_user = User.new(user_params)
    if @current_user.save
      session[:current_user_id] = user.id
    end
    render :index
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

  def current_user
    user_id = session[:current_user_id]
    @current_user ||= user_id && User.find(user_id)
  end
end
