class Item < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :storage
end
