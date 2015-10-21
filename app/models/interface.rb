require 'twilio-ruby'

class Interface < ActiveRecord::Base
  @@client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  @@from ='+15854818275'

  def self.process_text
    p params
  end

  def self.test_user_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  def self.test_contact_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  # def self.send_alert
  #   @user = User.find(params[:id])
  #   if params[:note]
  #     note = params[:note]
  #   end
  # end

  private

  def self.send_text(number,text)
    message = @@client.account.messages.create({
              :from => @@from,
              :to => number,
              :body => text
    })
  end

end
