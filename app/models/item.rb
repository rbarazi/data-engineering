class Item < ActiveRecord::Base
  attr_accessible :description, :merchant_id, :price

  belongs_to :merchant
  has_many   :orders

  validates :description, :price, presence: true

  delegate :name, :address, to: :merchant, prefix: true
end
