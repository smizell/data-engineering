class Upload < ActiveRecord::Base
  has_many :purchased_items, dependent: :destroy

  def total_gross_revenue
    purchased_items.sum("price * quantity")
  end

  def to_s
    "Upload #{id}"
  end
end
