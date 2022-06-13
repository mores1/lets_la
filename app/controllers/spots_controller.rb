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
    if @spot.lat ==0 || @spot.lng == 0 #この場合場所指定忘れの可能性大
      redirect_to request.referer
    elsif @spot.save
      redirect_to spots_path
    else
      redirect_to request.referer
    end
  end

  def index
    @spots = Spot.all
  end

  def show
  end

  def edit
  end

  private

  def spot_params
    params.required(:spot).permit(:user_id, :title, :body, :lat, :lng, :image_id)
  end

end
