require 'spec_helper'

describe "purchasers/show" do
  before(:each) do
    @purchaser = assign(:purchaser, stub_model(Purchaser,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
