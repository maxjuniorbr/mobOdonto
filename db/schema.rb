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

ActiveRecord::Schema.define(version: 20151004080006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "patient_id"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "zip"
    t.integer  "city_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree
  add_index "addresses", ["patient_id"], name: "index_addresses_on_patient_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.integer  "state_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "health_plans", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "patient",               limit: 100
    t.date     "birth"
    t.string   "nationality",           limit: 100
    t.integer  "marital_status_id"
    t.integer  "indication_patient_id"
    t.integer  "health_plan_id"
    t.string   "email",                 limit: 100
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "patients", ["health_plan_id"], name: "index_patients_on_health_plan_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.string   "contact_name"
    t.integer  "phone_type"
    t.integer  "patient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "phones", ["patient_id"], name: "index_phones_on_patient_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.string   "initial",    limit: 2
    t.integer  "country_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "patients"
  add_foreign_key "cities", "states"
  add_foreign_key "patients", "health_plans"
  add_foreign_key "phones", "patients"
  add_foreign_key "states", "countries"
end
