json.array!(@purchased_items) do |purchased_item|
  json.extract! purchased_item, :id, :description, :price, :quantity, :purchaser_id, :merchant_id, :upload_id
  json.url purchased_item_url(purchased_item, format: :json)
end
