class Merchant < ActiveRecord::Base
  has_many :purchased_items, dependent: :destroy
end
