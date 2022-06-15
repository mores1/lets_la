class LikesController < ApplicationController
  
  def create
    spot = Spot.find(params[:spot_id])
    like = @current_user.likes.new(spot_id: spot.id)
    like.save
    redirect_to spot_path(spot)
  end
  
  def destroy
    spot = Spot.find(params[:spot_id])
    like = @current_user.likes.find_by(spot_id: spot.id)
    like.destroy
    redirect_to request.referer
  end
  
end
