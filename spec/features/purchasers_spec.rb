require 'rails_helper'

RSpec.describe "Purchasers", :type => :request do
  describe "GET /purchasers" do
    it "works! (now write some real specs)" do
      get purchasers_path
      expect(response.status).to be(200)
    end
  end
end
