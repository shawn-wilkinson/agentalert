require 'twilio-ruby'
require 'net/http'

class InterfaceController < ApplicationController

  def incoming
    from = params[:From].to_s
    body = params[:Body].to_s
    response = Interface.process_text(from,body)
    respond(response)
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

  private

  def respond(message)
      response = Twilio::TwiML::Response.new do |r|
        r.Message message
      end
      render text: response.text
  end

  # def send_alert
  #   @user = User.find(params[:id])
  #   if params[:note]
  #     note = params[:note]
  #   end
  # end

end
