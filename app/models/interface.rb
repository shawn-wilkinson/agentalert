require 'twilio-ruby'

class Interface < ActiveRecord::Base
  @@client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  @@from ='+15854818275'

  def self.process_text(from,body)
    number = cleaned_number(from)
    if user = User.find_by phone_number: number
      if body.downcase.include?(user.panic_word)
        alert_contacts(user)
        return "Your contacts have been alerted."
      else
        return "Thanks for texting Agent Alert, #{@user.name}"
      end
    else
      return "Thanks for texting agent alert #{body} from #{from}"
    end

  end

  def self.test_user_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  def self.test_contact_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  def self.alert_contacts(user)
    user.contacts.each do |contact|
      send_alert(contact.name,user.name,contact.phone_number)
    end
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

  def self.cleaned_number(number)
    number[2..-1]
  end

end
