class User < ActiveRecord::Base
  has_many :contacts
  has_many :notifications

  has_secure_password
end
