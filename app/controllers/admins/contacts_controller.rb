class Admins::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @cotancts = Contact.page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  end
end