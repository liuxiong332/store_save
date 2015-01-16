class Storage < ActiveRecord::Base
  validates :title, presence: true
  has_many :items
  has_many :historical_records
end
