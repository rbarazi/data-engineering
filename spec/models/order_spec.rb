require 'spec_helper'

describe Order do
  it { should belong_to(:item) }
  it { should belong_to(:purchaser) }
  it { should validate_presence_of(:quantity) }

  describe "#total_price" do
    subject { Fabricate(:order) }

    its(:total) { should eq( 5 * 12 ) }
  end
end
