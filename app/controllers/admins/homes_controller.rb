class Admins::HomesController < ApplicationController

  before_action :move_to_index

  def top
    @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  private

  def move_to_index
    redirect_to new_admin_session_path unless admin_signed_in?
  end

end