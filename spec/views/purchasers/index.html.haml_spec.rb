require 'spec_helper'

describe "purchasers/index" do
  before(:each) do
    assign(:purchasers, [
      stub_model(Purchaser,
        :name => "Name"
      ),
      stub_model(Purchaser,
        :name => "Name"
      )
    ])
  end

  it "renders a list of purchasers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
