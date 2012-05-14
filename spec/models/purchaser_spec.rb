require 'spec_helper'

describe Purchaser do
  it { should have_many(:orders) }
  it { should validate_presence_of(:name) }
end
