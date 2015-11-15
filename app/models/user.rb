class User < ActiveRecord::Base
  after_create :test_number

  validates_presence_of :name
  validates_presence_of :email,:on => :create
  validates_uniqueness_of :email
  validates_presence_of :phone_number
  validates_format_of :phone_number, with: /\d{10}/, message: 'Incorrect Number Format.'
  validates_presence_of :panic_word
  validates_presence_of :clear_word
  validates_presence_of :password,:on => :create

  has_many :contacts
  has_many :notifications

  has_secure_password

  def test_number
    Interface.text_new_user(self.name,self.phone_number)
  end

  def check_back_in
    p 'in User model, check_back_in method called...'
    Interface.check_back_in(self.name,self.phone_number)
  end

  def check_in_follow_up
    p "In user model... check_in_follow_up method called...."
    if self.notifications.last.checked_in? == false && self.notifications.last.alert_sent? == false
      p 'we are alerting the contacts!!'
      Interface.alert_contacts(self)
    end
  end

end
