require 'spec_helper'

describe "purchasers/new" do
  before(:each) do
    assign(:purchaser, stub_model(Purchaser,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new purchaser form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchasers_path, :method => "post" do
      assert_select "input#purchaser_name", :name => "purchaser[name]"
    end
  end
end
