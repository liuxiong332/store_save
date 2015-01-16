class HistoricalRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :storage
  validates :user, :item, :storage, presence: true
end
