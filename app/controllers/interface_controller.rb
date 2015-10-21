require 'twilio-ruby'

class InterfaceController < ApplicationController

  @@client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  @@from ='+15854818275'

  def process_text
    p params
  end

  def test_user_number
    @user = User.find(params[:id])
    text = "Hello #{@user.name}, this is a test SMS from Agent Alert."
    send_text(@user.phone_number,text)
    redirect_to "/users/#{params[:id]}"
  end

  def test_contact_number
    @contact = Contact.find(params[:id])
    text = "Hello #{@contact.name}, this is a test SMS from Agent Alert."
    send_text(@contact.phone_number,text)
    redirect_to "/users/#{@contact.user.id}"
  end

  # def send_alert
  #   @user = User.find(params[:id])
  #   if params[:note]
  #     note = params[:note]
  #   end
  # end

  private

  def send_text(number,text)
    message = @@client.account.messages.create({
              :from => @@from,
              :to => number,
              :body => text
    })

  end


end
