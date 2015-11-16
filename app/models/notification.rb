class Notification < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, through: :user

  def alert_sent_true
    update_attribute(:alert_sent?,true)
  end

  def checked_in_true
    update_attribute(:checked_in?,true)
  end

  def self.create_notification(user_id,minutes,note = nil)
    time = Time.now + (minutes.to_i * 60)
    @user = User.find(user_id)
    Notification.create(user_id:user_id,note:note,contact_time:time)
    Notification.create_worker(user_id,'check in', minutes.to_i)
    delayed_minutes = minutes.to_i + 2
    Notification.create_worker(user_id,'alert needed?', delayed_minutes)
  end

  def self.create_worker(user_id,message_type,minute_delay)
    @user = User.find(user_id)
    if message_type == 'check in'
      p 'checking in...'
      snippet = Snippet.create({code: "
        p 'INSIDE THE SNIPPET TO CHECK IN'
        user = User.find(#{user_id})
        user.check_back_in
      "})
      NotificationWorker.perform_in(minute_delay.minutes,snippet.id)
    elsif message_type == 'alert needed?'
      p 'alert is needed...'
      snippet = Snippet.create({code: "
        p 'INSIDE THE SNIPPET TO ALERT CONTACTS'
        user = User.find(#{user_id})
        user.check_in_follow_up
      "})
      NotificationWorker.perform_in(minute_delay.minutes,snippet.id)
    end
  end



end
