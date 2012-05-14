require 'spec_helper'

describe Merchant do
  it { should have_many(:items) }
  it { should have_many(:orders).through(:items) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
end
