class SpotsController < ApplicationController

  before_action :signin_user?

  def new
    @user = @current_user
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @user = @current_user
    @spot.user_id = @user.id
    if @spot.lat ==0 || @spot.lng == 0 #この場合は場所指定忘れの可能性高い為入力不可とする
      redirect_to request.referer
      flash[:alert] = "投稿出来ませんでした。"
    elsif @spot.save
      redirect_to spots_path
    else
      redirect_to request.referer
      flash[:alert] = "投稿出来ませんでした。"
    end
  end

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def edit
    @spot = Spot.find(params[:id])
  end
  
  def update
    @spot = Spot.find(params[:id])
    if @spot.update(spot_params)
      redirect_to spot_path(@spot)
    else
      request.referer
      flash[:alert] = "更新出来ませんでした。"
    end
  end
  
  def destroy
    @spot = Spot.find(params[:id])
    if @spot.destroy
      redirect_to spots_path
    else
      redirect_to request.referer
      flash[:alert] = "削除出来ませんでした。"
    end
  end
  

  private

  def spot_params
    params.required(:spot).permit(:user_id, :title, :body, :lat, :lng, :image_id)
  end

end
