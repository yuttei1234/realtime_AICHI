class Public::RecommendationsController < ApplicationController

  before_action :authenticate_user!

  def index
  end

  def recommendation_params
    params.require(:recommendation).permit(:address, :latitude, :longitude)
  end

end