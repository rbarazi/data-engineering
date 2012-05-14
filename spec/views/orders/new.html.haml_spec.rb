require 'spec_helper'

describe "orders/new" do
  before(:each) do
    assign(:order, stub_model(Order,
      :item_id => 1,
      :purchaser_id => 1,
      :quantity => 1
    ).as_new_record)
  end

  it "renders new order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => orders_path, :method => "post" do
      assert_select "input#order_item_id", :name => "order[item_id]"
      assert_select "input#order_purchaser_id", :name => "order[purchaser_id]"
      assert_select "input#order_quantity", :name => "order[quantity]"
    end
  end
end
