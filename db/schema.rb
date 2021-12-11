# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_11_052436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stats", force: :cascade do |t|
    t.bigint "url_id", null: false
    t.string "request"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url_id"], name: "index_stats_on_url_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "webpush_endpoints", force: :cascade do |t|
    t.string "endpoint"
    t.string "auth_key", null: false
    t.string "p256dh_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auth_key"], name: "index_webpush_endpoints_on_auth_key", unique: true
  end

  add_foreign_key "stats", "urls"
end
