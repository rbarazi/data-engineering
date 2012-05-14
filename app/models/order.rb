class Order < ActiveRecord::Base
  attr_accessible :item_id, :purchaser_id, :quantity
end
