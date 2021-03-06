class User < ApplicationRecord
  validates_presence_of :username
  validates_uniqueness_of :username

  #Active Storage not yet implemented
  has_one_attached :avatar

  has_secure_password
end
