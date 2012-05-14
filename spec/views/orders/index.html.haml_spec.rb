require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :purchaser_name => "Purchaser",
        :item_description => "Item Description",
        :item_price => 12,
        :quantity => 2,
        :total => 24,
        :merchant_address => "Merchant Address",
        :merchant_name => "Merchant Name"
      ),
      stub_model(Order,
        :purchaser_name => "Purchaser",
        :item_description => "Item Description",
        :item_price => 12,
        :quantity => 2,
        :total => 24,
        :merchant_address => "Merchant Address",
        :merchant_name => "Merchant Name"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Purchaser".to_s, :count => 2
    assert_select "tr>td", :text => "Item Description".to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 24.to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Address".to_s, :count => 2
    assert_select "tr>td", :text => "Merchant Name".to_s, :count => 2
  end
end
