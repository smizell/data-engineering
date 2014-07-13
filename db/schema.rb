# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140710013457) do

  create_table "merchants", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchased_items", force: true do |t|
    t.string   "description"
    t.decimal  "price",        precision: 8, scale: 2
    t.integer  "quantity"
    t.integer  "purchaser_id"
    t.integer  "merchant_id"
    t.integer  "upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "purchased_items", ["merchant_id"], name: "index_purchased_items_on_merchant_id"
  add_index "purchased_items", ["purchaser_id"], name: "index_purchased_items_on_purchaser_id"
  add_index "purchased_items", ["upload_id"], name: "index_purchased_items_on_upload_id"

  create_table "purchasers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
