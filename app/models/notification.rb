class Notification < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, through: :user

  def alert_contacts
    contacts.each do |contact|
      puts "Alerting #{contact.name}"
    end
  end

  def self.create_notification(user_id,minutes,note = nil)
    time = Time.now + (minutes.to_i * 60)
    p "Time is: #{Time.now}, notification for #{time}"
    new_notificaiton = Notification.create(user_id:user_id,note:note,contact_time:time)
    p new_notificaiton
  end


end
