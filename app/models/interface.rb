require 'twilio-ruby'
require 'net/http'

class Interface < ActiveRecord::Base
  @@client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  @@from ='+15854818275'

  def self.process_text(from,body)
    number = cleaned_number(from)
    user = User.find_by phone_number: number
    if user == nil
      return "Thanks for texting agent alert #{body} from #{from}"
    elsif self.include_panic_word?(user,body)
      self.alert_contacts(user)
      user.notifications.last.alert_sent? = true
      return "Your contacts have been alerted."
    elsif self.include_clear_word?(user,body)
      user.notifications.last.checked_in? = true
      return "Thanks for checking in, #{user.name}"
    elsif self.notification_formatted?(body)
      self.establish_notification(user,body)
      return "Notification created, #{user.name}."
    else
      return "Thanks for texting Agent Alert, #{user.name}"
    end
  end

  def self.text_new_user(name,phone_number)
    text = "Hello #{name}, thanks for signing up with Agent Alert."
    send_text(phone_number,text)
  end

  def self.test_user_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  def self.test_contact_number(name,phone_number)
    text = "Hello #{name}, this is a test SMS from Agent Alert."
    send_text(phone_number,text)
  end

  def self.establish_notification(user,body)
    time, note = self.extract_time_and_note(body)
    Notification.create_notification(user.id,time,note)
  end

  def self.alert_contacts(user)
    user.contacts.each do |contact|
      send_alert(contact.name,user.name,contact.phone_number)
    end
  end

  def self.send_alert(contact_name,user_name,phone_number,note=nil)
    text = "#{contact_name}, this is an alert from Agent Alert. Your contact #{user_name} may be in trouble."
    if note
      text = text.concat(" Note from them: #{note}")
    end
    send_text(phone_number,text)
  end

  def self.check_back_in(user_name,phone_number)
    text = "#{user_name}, just checking back in..."
    p text
    send_text(phone_number,text)
  end

  private

  def self.notification_formatted?(body)
    matcher = /notify\s*\d+/
    matcher =~ body
  end

  def self.include_panic_word?(user,body)
    body.downcase.include?(user.panic_word.downcase)
  end

  def self.include_clear_word?(user,body)
    body.downcase.include?(user.clear_word.downcase)
  end

  def self.extract_time_and_note(body)
    matcher = /notify\s*\d+/
    matching_command = body.match(matcher)[0]
    isolated_command = body.slice!(matching_command)
    time = isolated_command.slice!(/\d+/).to_i
    note = body.strip
    note = nil if note == ""
    return time, note
  end


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
