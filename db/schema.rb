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

ActiveRecord::Schema.define(version: 2020_05_18_142126) do

  create_table "bans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "enacted"
    t.date "proposed"
    t.string "ban_type", null: false
    t.string "stage", null: false
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_bans_on_city_id"
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "latitude", precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "longitude", precision: 10, scale: 5, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "population", default: 0, null: false
    t.text "zips", null: false
    t.integer "density", default: 0, null: false
    t.string "county", default: "", null: false
    t.bigint "state_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "composters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "url", default: "", null: false
    t.string "email", default: "", null: false
    t.string "phone", default: "", null: false
    t.boolean "active", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_composters_on_city_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "zip", default: "", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_customers_on_city_id"
  end

  create_table "facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "capability", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_facilities_on_city_id"
  end

  create_table "lobsters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "zip", null: false
    t.string "address", null: false
    t.string "phone", null: false
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_lobsters_on_city_id"
  end

  create_table "states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
  end

  add_foreign_key "bans", "cities"
  add_foreign_key "cities", "states"
  add_foreign_key "composters", "cities"
  add_foreign_key "customers", "cities"
  add_foreign_key "facilities", "cities"
  add_foreign_key "lobsters", "cities"
end
