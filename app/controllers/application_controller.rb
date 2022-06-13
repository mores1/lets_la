class ApplicationController < ActionController::Base

  before_action :current_user
  helper_method :signin_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) #自己代入
  end
  
  def signin_user?
  if @current_user == nil
    redirect_to root_path
  end
end

end
