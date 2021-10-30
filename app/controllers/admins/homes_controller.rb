class Admins::HomesController < ApplicationController

  before_action :move_to_index, except: [:top]

  def top
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def move_to_index
    redirect_to new_admin_session_path unless user_signed_in?
  end

end