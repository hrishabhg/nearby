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

ActiveRecord::Schema.define(version: 20141025110400) do

  create_table "locations", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "latitude",    precision: 10, scale: 3, default: 0.0
    t.decimal  "longitude",   precision: 10, scale: 3, default: 0.0
    t.boolean  "is_active",                            default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_activities", force: true do |t|
    t.integer  "user_id"
    t.string   "activity"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_activities", ["user_id"], name: "index_user_activities_on_user_id", using: :btree

  create_table "user_addresses", force: true do |t|
    t.integer  "user_id"
    t.string   "flat_no"
    t.string   "street"
    t.integer  "pincode"
    t.integer  "city_id"
    t.boolean  "is_default", default: false
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_addresses", ["city_id"], name: "index_user_addresses_on_city_id", using: :btree
  add_index "user_addresses", ["user_id"], name: "index_user_addresses_on_user_id", using: :btree

  create_table "user_contacts", force: true do |t|
    t.integer  "user_id"
    t.integer  "contact_type",         default: 0
    t.string   "contact"
    t.boolean  "is_verified",          default: false
    t.boolean  "is_active",            default: true
    t.integer  "verify_attempt_count", default: 0
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_contacts", ["user_id"], name: "index_user_contacts_on_user_id", using: :btree

  create_table "user_details", force: true do |t|
    t.integer  "user_id"
    t.string   "detail_name"
    t.string   "detail_value"
    t.integer  "privacy_level", limit: 1, default: 0
    t.boolean  "is_active",               default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id", using: :btree

  create_table "user_devices", force: true do |t|
    t.integer  "user_id"
    t.integer  "device_type",  limit: 1
    t.string   "device_token"
    t.boolean  "is_active",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_devices", ["user_id"], name: "index_user_devices_on_user_id", using: :btree

  create_table "user_identities", force: true do |t|
    t.integer  "user_id"
    t.integer  "adapter"
    t.integer  "adapter_identifier"
    t.string   "hash_string"
    t.boolean  "is_active",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_identities", ["user_id"], name: "index_user_identities_on_user_id", using: :btree

  create_table "user_item_locations", force: true do |t|
    t.integer  "user_item_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_item_locations", ["location_id"], name: "index_user_item_locations_on_location_id", using: :btree
  add_index "user_item_locations", ["user_item_id"], name: "index_user_item_locations_on_user_item_id", using: :btree

  create_table "user_items", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",           precision: 10, scale: 2
    t.integer  "price_type",                               default: 0
    t.decimal  "advance_payment", precision: 10, scale: 2
    t.boolean  "is_negotiable",                            default: false
    t.boolean  "is_active",                                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_items", ["user_id"], name: "index_user_items_on_user_id", using: :btree

  create_table "user_locations", force: true do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_locations", ["location_id"], name: "index_user_locations_on_location_id", using: :btree
  add_index "user_locations", ["user_id"], name: "index_user_locations_on_user_id", using: :btree

  create_table "user_sources", force: true do |t|
    t.string   "name",                    null: false
    t.string   "identifier"
    t.integer  "users_count", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "register_date"
    t.boolean  "is_verified",            default: false
    t.boolean  "is_active",              default: false
    t.boolean  "is_individual",          default: true
    t.boolean  "is_seller",              default: false
    t.boolean  "is_seller_verified",     default: false
    t.integer  "preferred_contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_source_id"
    t.string   "current_cookie"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_source_id"], name: "index_users_on_user_source_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
