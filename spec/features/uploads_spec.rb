require 'rails_helper'

RSpec.describe "Uploads", :type => :feature do
  describe "Uploading Data Files" do
    it "should upload a file" do
      visit uploads_path
      attach_file "upload_file", "spec/fixtures/files/example_input.tab"
      click_button "Upload"
      expect(page).to have_content("Items were successfully uploaded")
      expect(page).to have_content("$95.00")
    end
  end
end
