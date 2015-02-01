class Item < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :storage

  def Item.check_create(params)
    return Item.create(check_params(params))
  end

  def Item.check_params(params)
    params.require(:item).permit(:title, :storage_id)
  end
end
