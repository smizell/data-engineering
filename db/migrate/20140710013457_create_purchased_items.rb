class CreatePurchasedItems < ActiveRecord::Migration
  def change
    create_table :purchased_items do |t|
      t.string :description
      t.decimal :price, precision: 8, scale: 2
      t.integer :quantity
      t.references :purchaser, index: true
      t.references :merchant, index: true
      t.references :upload, index: true

      t.timestamps
    end
  end
end
