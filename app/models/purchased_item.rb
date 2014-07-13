class PurchasedItem < ActiveRecord::Base
  belongs_to :purchaser
  belongs_to :merchant
  belongs_to :upload
end
