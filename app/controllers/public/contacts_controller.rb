class Public::ContactsController < ApplicationController

 before_action :authenticate_user!

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to new_public_contact_path, notice:"Send succuessfully!"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:title, :message)
  end

end
