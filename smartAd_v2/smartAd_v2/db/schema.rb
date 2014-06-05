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

ActiveRecord::Schema.define(version: 20140530025435) do

  create_table "ad_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "auction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auctions", force: true do |t|
    t.datetime "start_at"
    t.datetime "end_at"
    t.float    "start_price"
    t.float    "min_step_price"
    t.float    "current_price",  default: 0.0
    t.integer  "winner"
    t.integer  "product_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_uploaded"
  end

  create_table "bids", force: true do |t|
    t.integer  "bidder_id"
    t.float    "bid_amount"
    t.integer  "auction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "format_id"
    t.integer  "form_factor_id"
    t.integer  "time_share_id"
    t.integer  "duration"
    t.integer  "grade_id"
    t.integer  "product_type_id"
    t.integer  "period_id"
    t.date     "expiry_date"
    t.date     "start_at"
    t.integer  "position_id"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "user_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile"
    t.string   "tel"
    t.text     "address"
    t.text     "description"
    t.string   "website"
    t.string   "cover_file_name"
    t.integer  "cover_file_size"
    t.string   "cover_content_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
