class Public::PostImagesController < ApplicationController
  
  def index
    @post_images = PostImage.all
    @user = current_user
  end

  def new
    @post_images = PostImage.new
  end  

  def create
    @post_image = PostImage.new(post_image_params)
    
    
    
    
    
  end  
  
  def show
    
  end  
  
  def edit
    
  end  
  
  def update
    
  end  
  
  def destroy
    
  end  
  
  def post_image_params
    params.require(:post_image).permit(:user_id, :image_id, :title, :caption, :address, :latitude, :longitude)
  end
  
end