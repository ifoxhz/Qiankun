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

ActiveRecord::Schema.define(version: 16) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activities", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.float    "locationx"
    t.float    "locationy"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", force: true do |t|
    t.string   "name"
    t.float    "lx"
    t.float    "ly"
    t.string   "address"
    t.string   "number"
    t.integer  "organize_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buildings", force: true do |t|
    t.string   "number"
    t.integer  "unitnum"
    t.string   "numperunit"
    t.integer  "floornum"
    t.string   "first_num"
    t.string   "elevator"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "msgtype"
    t.text     "msg"
    t.integer  "user_id"
    t.integer  "node_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nodes", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "nodetype"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "org_pools", force: true do |t|
    t.integer  "organize_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.string   "org_type"
    t.string   "node_id"
    t.string   "integer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_billings", force: true do |t|
    t.string   "name"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "receipt_num"
    t.integer  "month_num"
    t.integer  "year_num"
    t.float    "unit_fee"
    t.float    "total_pay"
    t.float    "count"
    t.string   "status"
    t.string   "receipt_photo"
    t.string   "admin_person"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_cars", force: true do |t|
    t.string   "cartype"
    t.string   "brand"
    t.string   "number"
    t.string   "color"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_families", force: true do |t|
    t.string   "name"
    t.integer  "room_id"
    t.string   "relation"
    t.integer  "age"
    t.string   "sex"
    t.string   "workplace"
    t.string   "title"
    t.string   "mphone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_owners", force: true do |t|
    t.string   "name"
    t.string   "sex"
    t.integer  "room_id"
    t.integer  "family_num"
    t.string   "id_num"
    t.string   "workplace"
    t.string   "title"
    t.string   "mphone"
    t.string   "emergency_phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_pets", force: true do |t|
    t.string   "number"
    t.string   "pinzhong"
    t.string   "num"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", force: true do |t|
    t.string   "number"
    t.integer  "floor"
    t.integer  "building_id"
    t.boolean  "saled"
    t.string   "chan_quan"
    t.string   "huxing"
    t.string   "structure"
    t.float    "square"
    t.string   "idles_tatus"
    t.string   "rents_tatus"
    t.string   "zhuangxiu_status"
    t.string   "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploads", force: true do |t|
    t.text     "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mphone"
    t.string   "qq"
    t.string   "crypedpwd"
    t.string   "salt"
    t.string   "role"
    t.string   "veribit"
    t.string   "vericode"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
