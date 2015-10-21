require 'twilio-ruby'

class InterfaceController < ApplicationController

  @@client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
  @@from ='+15854818275'

  def process_text
    p params
  end

  def test_user_number
    @user = User.find(params[:id])
    text = "Hello #{@user.name}, this is a test SMS from Agent Alert."
    send_text(@user.phone_number,text)
  end

  private

  def send_text(number,text)
    message = client.account.messages.create({
              :from => @@from,
              :to => number,
              :body => text
    })
    puts "message sent to #{name} at #{number}"
  end


end
