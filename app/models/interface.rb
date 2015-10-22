require 'twilio-ruby'

class Interface < ActiveRecord::Base
  @@client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  @@from ='+15854818275'


  def self.process_text(from,body)
    return "Thanks for texting agent alert #{body} from #{from}"
  end

  def self.receive_text(params)
     response = Twilio::TwiML::Response.new do |r|
      r.Message "Hey there! I got a text from you."
    end
    render_twiml response
  end

  def self.test_user_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  def self.test_contact_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  def self.send_alert(contact_name,user_name,phone_number,note=nil)
    @user = User.find(params[:id])
    text = "#{contact_name}, this is an alert from Agent Alert. Your contact #{user_name} may be in trouble."
    if note
      text = text.concat(" Note from them: #{note}")
    end
    send_text(phone_number,text)
  end

  private

  def self.send_text(number,text)
    message = @@client.account.messages.create({
              :from => @@from,
              :to => number,
              :body => text
    })
  end

end
