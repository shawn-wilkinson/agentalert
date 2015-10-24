class User < ActiveRecord::Base
  after_create :test_number

  validates_presence_of :name
  validates_presence_of :email,:on => :create
  validates_presence_of :phone_number
  validates_presence_of :panic_word
  validates_presence_of :password,:on => :create

  has_many :contacts
  has_many :notifications

  has_secure_password

  private

  def test_number
    Interface.text_new_user(@name,@phone_number)
  end

end
