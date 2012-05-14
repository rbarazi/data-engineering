class Order < ActiveRecord::Base
  attr_accessible :item_id, :purchaser_id, :quantity

  belongs_to :item
  belongs_to :purchaser

  validates :quantity, presence: true

  delegate :name, to: :purchaser, prefix: true
  delegate :price, :description, to: :item, prefix: true
  delegate :merchant_name, :merchant_address, to: :item

  def total
    @total ||= item_price * quantity
  end
end
