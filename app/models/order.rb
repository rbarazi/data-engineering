class Order < ActiveRecord::Base
  attr_accessible :item_id, :purchaser_id, :quantity

  belongs_to :item
  belongs_to :purchaser

  validates :quantity, presence: true
end
