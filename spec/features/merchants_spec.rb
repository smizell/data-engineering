require 'rails_helper'

RSpec.describe "Merchants", :type => :request do
  describe "GET /merchants" do
    it "works! (now write some real specs)" do
      get merchants_path
      expect(response.status).to be(200)
    end
  end
end
