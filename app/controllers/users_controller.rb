class UsersController < ApplicationController
  
  before_action :signin_user, except: [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to spots_path
    else
      redirect_to request.referer
    end
  end

  def index
  end

  def edit
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
