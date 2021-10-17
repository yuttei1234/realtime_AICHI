class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_public_contact_path, notice:"Send succuessfully!"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:user).permit(:title, :message)
  end

end
