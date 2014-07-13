require 'rails_helper'

RSpec.describe Upload, :type => :model do
  describe "#total_gross_revenue" do
    let(:purchaser) { Purchaser.create! name: "John Doe" }
    let(:merchant) { Merchant.create! name: "Fake Store", address: "1234 Main St." }
    let(:upload) { Upload.create! }

    before(:each) do
      PurchasedItem.create! price: 50, quantity: 2, purchaser: purchaser, merchant: merchant, upload: upload
      PurchasedItem.create! price: 20, quantity: 3, purchaser: purchaser, merchant: merchant, upload: upload
      PurchasedItem.create! price: 4, quantity: 2, purchaser: purchaser, merchant: merchant, upload: upload
    end

    it "should return the correct amount" do
      expect(upload.total_gross_revenue).to eq(168)
    end
  end
end
