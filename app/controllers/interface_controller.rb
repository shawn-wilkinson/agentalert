require 'twilio-ruby'

class InterfaceController < ApplicationController

  def receive_text
    response = Twilio::TwiML::Response.new do |r|
      r.Message "Hey there! I got a text from you."
    end
    puts response.text
  end

  def sms_quickstart
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Hello, there friend.... Thanks for the message."
    end
    twiml.text
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

  def user_signup
    @user = User.find(params[:id])
    Interface.user_signup(@user.name,@user.phone_number)

  end

  def send_alert
    @contact = Contact.find(params[:id])
    Interface.send_alert(@contact.name,@contact.user.name,@contact.phone_number)
  end

  # def send_alert
  #   @user = User.find(params[:id])
  #   if params[:note]
  #     note = params[:note]
  #   end
  # end

end
