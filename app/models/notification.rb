class Notification < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, through: :user

  def alert_contacts
    contacts.each do |contact|
      puts "Alerting #{contact.name}"
    end
  end


end
