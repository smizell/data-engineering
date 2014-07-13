class HomeController < ApplicationController
  def index
    @purchasers = Purchaser.all
    @merchants = Merchant.all
    @uploads = Upload.all
  end
end