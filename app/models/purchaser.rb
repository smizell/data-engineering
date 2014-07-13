class Purchaser < ActiveRecord::Base
  has_many :purchased_items, dependent: :destroy
end
