require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :description => "MyString",
      :price => 1.5,
      :merchant_id => 1
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_description", :name => "item[description]"
      assert_select "input#item_price", :name => "item[price]"
      assert_select "input#item_merchant_id", :name => "item[merchant_id]"
    end
  end
end
