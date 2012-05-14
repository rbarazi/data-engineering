class Merchant < ActiveRecord::Base
  attr_accessible :address, :name

  has_many :items
  has_many :orders, through: :items

  validates :address, :name, presence: true
end
