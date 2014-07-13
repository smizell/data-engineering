require 'rails_helper'
require 'upload_parser'

RSpec.describe UploadParser do
  let(:tsv_string) { File.open('spec/fixtures/files/example_input.tab').read }

  describe "#parse" do
    subject { -> { UploadParser.new(tsv_string).parse } }

    it { should change(Upload, :count).by(1) }
    it { should change(Purchaser, :count).by(3) }
    it { should change(Merchant, :count).by(3) }
    it { should change(PurchasedItem, :count).by(4) }
  end

  describe "#parsed?" do
    let(:upload_parser) { UploadParser.new(tsv_string) }

    context "when not parsed" do
      it "should be false" do
        expect(upload_parser.parsed?).to be_falsey
      end
    end

    context "when parsed" do
      before(:each) { upload_parser.parse }
      it "should be true" do
        expect(upload_parser.parsed?).to be_truthy
      end
    end
  end

  context "when tsv_string is not set" do
    let(:upload_parser) { UploadParser.new("") }

    before(:each) do
      upload_parser.parse
    end

    it "should not be parsed" do
      expect(upload_parser.parsed?).to be_falsey
    end
  end
end