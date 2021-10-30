class Admins::UsersController < ApplicationController

  def index
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user.id), notice: "Updated successfully."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :telephone_number, :email, :validation)
  end


end
