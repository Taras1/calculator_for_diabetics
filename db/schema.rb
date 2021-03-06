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

ActiveRecord::Schema.define(version: 20130913064631) do

  create_table "group_products", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "belong_group"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "birthday"
    t.string   "phone_number"
    t.string   "city"
    t.string   "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code_confirm"
    t.boolean  "confirm_email", default: false
    t.string   "password"
    t.string   "session_key"
    t.boolean  "admin",         default: false
  end

end
