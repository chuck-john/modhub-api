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

ActiveRecord::Schema.define(version: 2021_03_05_024351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "garages", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "location"
    t.index ["user_id"], name: "index_garages_on_user_id"
  end

  create_table "makes", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.index ["name"], name: "index_makes_on_name", unique: true
  end

  create_table "models", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "make_id", null: false
    t.string "name", null: false
    t.string "kind", null: false
    t.index ["make_id"], name: "index_models_on_make_id"
    t.index ["name", "make_id"], name: "index_models_on_name_and_make_id", unique: true
  end

  create_table "trims", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "model_id", null: false
    t.string "name", null: false
    t.integer "years", default: [], null: false, array: true
    t.index ["model_id"], name: "index_trims_on_model_id"
    t.index ["name", "model_id"], name: "index_trims_on_name_and_model_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "garage_id", null: false
    t.bigint "trim_id", null: false
    t.integer "year", null: false
    t.index ["garage_id"], name: "index_vehicles_on_garage_id"
    t.index ["trim_id"], name: "index_vehicles_on_trim_id"
  end

  add_foreign_key "garages", "users"
  add_foreign_key "models", "makes"
  add_foreign_key "trims", "models"
  add_foreign_key "vehicles", "garages"
  add_foreign_key "vehicles", "trims"
end
