class ApplicationController < ActionController::Base

  before_action :current_user
  helper_method :signin_user?
  helper_method :admin?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) #自己代入
  end

  def signin_user?
    if @current_user == nil
      redirect_to root_path
    end
  end

  def admin?
    if @current_user.admin == false
      redirect_to request.referer
    end
  end

end
