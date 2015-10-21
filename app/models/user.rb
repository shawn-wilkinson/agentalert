class User < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :panic_word
  validates_presence_of :password

  has_many :contacts
  has_many :notifications

  has_secure_password
end
