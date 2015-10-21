class InterfaceController < ApplicationController

  def process_text
    p params
  end

  def test_user_number
    @user = User.find(params[:id])
    Interface.test_user_number(@user.name,@user.phone_number)
    redirect_to "/users/#{params[:id]}"
  end

  def test_contact_number
    @contact = Contact.find(params[:id])
    Interface.test_contact_number(@contact.name,@contact.phone_number)
    redirect_to "/users/#{@contact.user.id}"
  end

  # def send_alert
  #   @user = User.find(params[:id])
  #   if params[:note]
  #     note = params[:note]
  #   end
  # end

end
