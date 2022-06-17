class UsersController < ApplicationController

  before_action :signin_user? , except: [:new, :create]

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
      flash[:alert] = "登録出来ません。もう一度お願い致します。"
    end
  end

  def index
    @users = User.all
  end

  def edit
    editer?
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user)
      flash[:alert] = "更新しました。"
    else
      redirect_to request.referer
      flash[:alert] = "更新出来ませんでした。"
    end
  end

  private
  
  def editer?
    @user = User.find(params[:id])
    unless @current_user.id == @user.id || @current_user.name == "admin"
      redirect_to root_path
      flash[:alert] = "権限がありません。"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
