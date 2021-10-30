class Admins::UsersController < ApplicationController

  before_action :move_to_index

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

  def move_to_index
    redirect_to new_admin_session_path unless admin_signed_in?
  end

  def user_params
    params.require(:user).permit(:name, :telephone_number, :email, :validation)
  end


end
