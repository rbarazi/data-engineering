require 'spec_helper'

describe "purchasers/edit" do
  before(:each) do
    @purchaser = assign(:purchaser, stub_model(Purchaser,
      :name => "MyString"
    ))
  end

  it "renders the edit purchaser form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => purchasers_path(@purchaser), :method => "post" do
      assert_select "input#purchaser_name", :name => "purchaser[name]"
    end
  end
end
