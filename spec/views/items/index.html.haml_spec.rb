require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :description => "Description",
        :price => 1.5,
        :merchant_name => "Merchant"
      ),
      stub_model(Item,
        :description => "Description",
        :price => 1.5,
        :merchant_name => "Merchant"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Merchant".to_s, :count => 2
  end
end
