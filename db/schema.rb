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

ActiveRecord::Schema.define(version: 20150116082628) do

  create_table "historical_records", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "operation"
    t.integer  "item_id"
    t.integer  "storage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "historical_records", ["item_id"], name: "index_historical_records_on_item_id"
  add_index "historical_records", ["storage_id"], name: "index_historical_records_on_storage_id"
  add_index "historical_records", ["user_id"], name: "index_historical_records_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.integer  "storage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["storage_id"], name: "index_items_on_storage_id"

  create_table "storages", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["username"], name: "index_users_on_username"

end
