class Admins::ContactsController < ApplicationController

  before_action :move_to_index

  def index
    @contacts = Contact.all
    @contacts = Contact.page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def move_to_index
    redirect_to new_admin_session_path unless admin_signed_in?
  end

end