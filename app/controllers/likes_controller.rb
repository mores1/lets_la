class LikesController < ApplicationController
  
  def create
    spot = Spot.find(params[:spot_id])
    like = @current_user.likes.new(spot_id: spot.id)
    if like.save
      redirect_to spot_path(spot)
    else
      redirect_to request.referer
      flash[:alert] = "良いね出来ませんでした!"
    end
  end
  
  def destroy
    spot = Spot.find(params[:spot_id])
    like = @current_user.likes.find_by(spot_id: spot.id)
    if like.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
      flash[:alert] = "良いねが消せません!"
    end
  end
  
end
