require 'spec_helper'

describe Parser do
  subject { described_class.new("spec/files/example_input.tab") }

  context "loads file on initialize" do
    its(:table) { should be_an_instance_of(CSV::Table) }
  end

  context "importing orders" do
    it "imports orders" do
      expect { subject.import_orders! }.to change{ Order.count }.by(4)
    end

    it "imports merchants" do
      expect { subject.import_orders! }.to change{ Merchant.count }.by(3)
    end

    it "imports items" do
      expect { subject.import_orders! }.to change{ Item.count }.by(3)
    end

    it "imports purchasers" do
      expect { subject.import_orders! }.to change{ Purchaser.count }.by(3)
    end
  end
end