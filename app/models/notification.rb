class Notification < ActiveRecord::Base
  belongs_to :user
  has_many :contacts, through: :user
end
