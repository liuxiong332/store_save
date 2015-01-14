class User < ActiveRecord::Base
  validates :username, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
