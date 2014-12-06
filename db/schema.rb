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

ActiveRecord::Schema.define(version: 20141124222544) do

  create_table "accounts", force: true do |t|
    t.datetime "date"
    t.string   "concept"
    t.decimal  "amountini",  precision: 16, scale: 3
    t.decimal  "amountend",  precision: 16, scale: 3
    t.string   "state"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "telefone"
    t.boolean  "active"
    t.string   "dealtype"
    t.string   "note"
    t.string   "address"
    t.integer  "error_unit_id"
    t.integer  "acounting_unit_id"
    t.integer  "bill_unit_id"
    t.integer  "sw_unit_id"
    t.integer  "acount_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "supplier_id"
    t.string   "name"
    t.string   "note"
    t.decimal  "minall",      precision: 16, scale: 3
    t.decimal  "mingroup",    precision: 16, scale: 3
    t.decimal  "minunit",     precision: 16, scale: 3
    t.decimal  "kgxunit",     precision: 16, scale: 3
    t.string   "unittype"
    t.decimal  "price",       precision: 16, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_suppliers", force: true do |t|
    t.integer  "order_id"
    t.integer  "supplier_id"
    t.integer  "group_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "state"
    t.datetime "date"
    t.decimal  "requested",  precision: 16, scale: 3
    t.decimal  "received",   precision: 16, scale: 3
    t.decimal  "priceini",   precision: 16, scale: 3
    t.decimal  "priceend",   precision: 16, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.integer  "unit_id"
    t.string   "nickname"
    t.string   "accesslevel"
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.integer  "telefone"
    t.string   "password_digest"
    t.boolean  "active"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "supplier_id"
    t.string   "name"
    t.string   "imageurl"
    t.boolean  "active"
    t.string   "note"
    t.decimal  "minall",      precision: 16, scale: 3
    t.decimal  "mingroup",    precision: 16, scale: 3
    t.decimal  "minunit",     precision: 16, scale: 3
    t.decimal  "kgxunit",     precision: 16, scale: 3
    t.string   "unittype"
    t.decimal  "price",       precision: 16, scale: 3
    t.decimal  "priceold",    precision: 16, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.integer  "item_id"
    t.integer  "unit_id"
    t.decimal  "requested",  precision: 16, scale: 3
    t.decimal  "received",   precision: 16, scale: 3
    t.decimal  "priceini",   precision: 16, scale: 3
    t.decimal  "priceend",   precision: 16, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "telefone"
    t.string   "url"
    t.boolean  "active"
    t.string   "note"
    t.string   "frecuency"
    t.integer  "ranking"
    t.integer  "account_id"
    t.integer  "group_id"
    t.integer  "watcher_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "email"
    t.integer  "telefone"
    t.boolean  "active"
    t.string   "note"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
