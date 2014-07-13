require 'rails_helper'

RSpec.describe "PurchasedItems", :type => :request do
  describe "GET /purchased_items" do
    it "works! (now write some real specs)" do
      get purchased_items_path
      expect(response.status).to be(200)
    end
  end
end
