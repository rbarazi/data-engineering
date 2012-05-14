class RowParser
  attr_accessor :row, :order

  def initialize(row)
    @row = row
  end

  def merchant_attributes
    {
      name: row['merchant name'],
      address: row['merchant address']
    }
  end

  def item_attributes
    {
      description: row['item description'],
      price: row['item price'].to_f
    }
  end

  def purchaser_attributes
    {
      name: row['purchaser name']
    }
  end

  def order_attributes
    {
      quantity: row['purchase count'].to_i
    }
  end

  def parse!
    merchant = Merchant.find_or_create_by_name(merchant_attributes)
    item = merchant.items.find_or_create_by_description(item_attributes)
    purchaser = Purchaser.find_or_create_by_name(purchaser_attributes)
    self.order = Order.create(
      order_attributes.merge(item_id: item.id, purchaser_id: purchaser.id)
    )
    self.order
  end
end