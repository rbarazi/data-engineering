require 'spec_helper'

describe Order do
  it { should belong_to(:item) }
  it { should belong_to(:purchaser) }
  it { should validate_presence_of(:quantity) }
end
