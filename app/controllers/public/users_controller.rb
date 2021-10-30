class Public::UsersController < ApplicationController

 before_action :authenticate_user!, except: :top

 def create
  @user = User.new(user_params)
    if @user.save
      ThanxMailer.complete_registration(@user).deliver
    end
 end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
      if @user == current_user
        render "edit"
      else
        redirect_to public_user_path(current_user.id)
      end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to public_user_path(@user.id), notice:"Update profile!"
    else
      render "users/edit"
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(validation: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :telephone_number, :introduction)
  end

end