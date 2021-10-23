class Public::RecommendationsController < ApplicationController
  
  def index
  end
  
  def recommendation_params
    params.require(:recommendation).permit(:address, :latitude, :longitude)
  end
  
end