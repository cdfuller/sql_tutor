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

ActiveRecord::Schema.define(version: 20161101155054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", id: :serial, force: :cascade do |t|
    t.string "title", limit: 160, null: false
    t.integer "artist_id", null: false
    t.index ["artist_id"], name: "index_album_on_artist_id"
    t.index ["id"], name: "index_album_on_id", unique: true
  end

  create_table "artists", id: :serial, force: :cascade do |t|
    t.string "name", limit: 120
    t.index ["id"], name: "index_artist_on_id", unique: true
  end

  create_table "challenges", id: :serial, force: :cascade do |t|
    t.string "instructions"
    t.string "query"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.json "metadata"
  end

  create_table "customers", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 40, null: false
    t.string "last_name", limit: 20, null: false
    t.string "company", limit: 80
    t.string "address", limit: 70
    t.string "city", limit: 40
    t.string "state", limit: 40
    t.string "country", limit: 40
    t.string "postal_code", limit: 10
    t.string "phone", limit: 24
    t.string "fax", limit: 24
    t.string "email", limit: 60, null: false
    t.integer "support_rep_id"
    t.index ["id"], name: "index_customer_on_id", unique: true
    t.index ["support_rep_id"], name: "index_customers_on_support_rep_id"
  end

  create_table "employees", id: :serial, force: :cascade do |t|
    t.string "last_name", limit: 20, null: false
    t.string "first_name", limit: 20, null: false
    t.string "title", limit: 30
    t.integer "reports_to"
    t.datetime "birth_date"
    t.datetime "hire_date"
    t.string "address", limit: 70
    t.string "city", limit: 40
    t.string "state", limit: 40
    t.string "country", limit: 40
    t.string "postal_code", limit: 10
    t.string "phone", limit: 24
    t.string "fax", limit: 24
    t.string "email", limit: 60
    t.index ["id"], name: "index_employee_on_id", unique: true
    t.index ["reports_to"], name: "index_employees_on_reports_to"
  end

  create_table "invoices", id: :serial, force: :cascade do |t|
    t.integer "customer_id", null: false
    t.datetime "invoice_date", null: false
    t.string "billing_address", limit: 70
    t.string "billing_city", limit: 40
    t.string "billing_state", limit: 40
    t.string "billing_country", limit: 40
    t.string "billing_postal_code", limit: 10
    t.decimal "total", precision: 10, scale: 2, null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["id"], name: "index_invoice_on_id", unique: true
  end

  create_table "media_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 120
    t.index ["id"], name: "index_media_type_on_id", unique: true
  end

  create_table "tracks", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "album_id"
    t.integer "media_type_id", null: false
    t.string "composer", limit: 220
    t.integer "milliseconds", null: false
    t.integer "bytes"
    t.decimal "unit_price", precision: 10, scale: 2, null: false
    t.index ["album_id"], name: "index_tracks_on_album_id"
    t.index ["id"], name: "index_track_on_id", unique: true
    t.index ["media_type_id"], name: "index_track_on_media_type_id"
  end

  add_foreign_key "albums", "artists", name: "albums_artist_id_fkey"
  add_foreign_key "customers", "employees", column: "support_rep_id", name: "customers_support_rep_id_fkey"
  add_foreign_key "employees", "employees", column: "reports_to", name: "employees_reports_to_fkey"
  add_foreign_key "invoices", "customers", name: "invoices_customer_id_fkey"
  add_foreign_key "tracks", "albums", name: "tracks_album_id_fkey"
  add_foreign_key "tracks", "media_types", name: "tracks_media_type_id_fkey"
end
