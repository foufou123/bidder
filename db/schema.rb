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

ActiveRecord::Schema.define(version: 20150805232915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.integer  "price",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "contract_id"
    t.integer  "interest_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.string   "email"
    t.string   "phone"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country",             default: "United States"
    t.string   "postal"
    t.boolean  "show_email",          default: false
    t.boolean  "show_phone",          default: false
    t.boolean  "show_street_address", default: false
    t.string   "country_code",        default: "us"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "contacts", ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id", using: :btree

  create_table "contractors", force: :cascade do |t|
    t.integer  "user_id",           null: false
    t.string   "organization_type", null: false
    t.string   "organization_name", null: false
    t.text     "summary",           null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "job_id",        null: false
    t.string   "conditions"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "stipulations"
    t.integer  "contractor_id", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.integer  "contractor_id", null: false
    t.integer  "job_id",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "category",    null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id",     null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer  "contractor_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
