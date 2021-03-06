class User < ActiveRecord::Base
  has_secure_password
  has_many :destinations
  has_many :activities, through: :destinations
end
