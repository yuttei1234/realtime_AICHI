class Public::HomesController < ApplicationController

  def top
    @Post_images = PostImage.all
  end

  def about
  end

end