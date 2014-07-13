require 'csv'

class UploadParser
  attr_accessor :upload, :items, :tsv_string, :parsed

  def initialize(tsv_string)
    @items = []
    @tsv_string = tsv_string
    @parsed = false
  end

  def parsed?
    parsed
  end

  def parse
    parse_tsv_file unless tsv_string.blank? or parsed?
    parsed?
  end

  private

    def parse_tsv_file
      @upload = Upload.create
      CSV.parse(tsv_string, { :headers => true, :col_sep => "\t" }) do |row|
        items.append(parse_row(row))
      end
      @parsed = true
    end

    def parse_row(row)
      purchaser = Purchaser.where(name: row['purchaser name']).first_or_create
      merchant = Merchant.where(
        name: row['merchant name'],
        address: row['merchant address']).first_or_create
      purchased_item = PurchasedItem.create(
        description: row['item description'],
        price: row['item price'],
        quantity: row['purchase count'],
        purchaser: purchaser,
        merchant: merchant,
        upload: upload)
    end
end