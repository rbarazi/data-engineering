class Item < ActiveRecord::Base
  attr_accessible :description, :merchant_id, :price

  belongs_to :merchant
  has_many   :orders

  validates :description, :price, presence: true
end
