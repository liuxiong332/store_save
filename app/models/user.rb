class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true
  validates :password, confirmation: true
  validates :name, :password_confirmation, presence: true
end
