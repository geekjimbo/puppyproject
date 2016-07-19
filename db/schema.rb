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

ActiveRecord::Schema.define(version: 20160719013312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "crew_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crews", force: :cascade do |t|
    t.integer  "age"
    t.string   "name"
    t.string   "avatar"
    t.string   "title"
    t.string   "species"
    t.string   "origin"
    t.text     "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_elements", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "data_package_id"
    t.integer  "data_taxonomy_id"
    t.integer  "end_point_id"
    t.string   "format"
    t.boolean  "match_parameter"
    t.string   "validation_rule"
  end

  create_table "data_packages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "entity_id"
    t.boolean  "is_outbound"
  end

  create_table "data_providers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_taxonomies", force: :cascade do |t|
    t.string   "data_element"
    t.string   "data_type"
    t.string   "description"
    t.string   "sample_value"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "data_provider_id"
  end

  create_table "dtaxo_backup", id: false, force: :cascade do |t|
    t.integer  "id"
    t.string   "data_element"
    t.string   "data_type"
    t.string   "description"
    t.string   "sample_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "data_provider_id"
  end

  create_table "end_points", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "entity_id"
    t.string   "serialization_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string   "name"
    t.string   "abilitecAdressLink"
    t.string   "abilitecBusinessLink"
    t.string   "abilitecBusinessId"
    t.string   "abilitecEntityId"
    t.string   "email"
    t.integer  "countryCode"
    t.string   "countryName"
    t.float    "lat"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.float    "long"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.string   "zipCode"
    t.string   "placeName"
    t.string   "phone"
    t.string   "zipExtension"
    t.integer  "business_id"
    t.string   "business_type"
  end

  create_table "remove_column_from_users", force: :cascade do |t|
    t.string   "passwordDigest"
    t.string   "rememberDigest"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "right_joins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "entity_id"
    t.string   "password_digest"
    t.string   "remember_digest"
  end

end
