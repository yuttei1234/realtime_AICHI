class Public::PostImagesController < ApplicationController

  before_action :move_to_index, except: [:top, :about]

  def index
    @post_images = PostImage.all
  end

  def new
    @post_images = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @user = current_user
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to public_post_images_path, notice: "You have created successfully."
    else
      render :new
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user != current_user
      redirect_to public_post_image_path
    end
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to public_post_image_path(@post_image.id), notice: "You have uploaded successfully."
    else
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to public_post_images_path
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def post_image_params
    params.require(:post_image).permit(:user_id, :image_id, :title, :caption, :address, :latitude, :longitude)
  end

end