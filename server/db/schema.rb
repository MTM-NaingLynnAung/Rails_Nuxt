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

ActiveRecord::Schema.define(version: 2022_12_07_090419) do

  create_table "build_types", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "car_models", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "manufacture_id"
    t.index ["manufacture_id"], name: "index_car_models_on_manufacture_id"
  end

  create_table "manufactures", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "condition"
    t.string "trim_name"
    t.string "engine_power"
    t.string "steering_position"
    t.string "fuel_type"
    t.string "color"
    t.string "price"
    t.string "vin"
    t.string "plate_number"
    t.integer "seat"
    t.integer "door"
    t.text "description"
    t.string "year"
    t.string "phone"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "manufacture_id"
    t.bigint "user_id"
    t.bigint "car_model_id"
    t.bigint "build_type_id"
    t.index ["build_type_id"], name: "index_posts_on_build_type_id"
    t.index ["car_model_id"], name: "index_posts_on_car_model_id"
    t.index ["manufacture_id"], name: "index_posts_on_manufacture_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "car_models", "manufactures"
  add_foreign_key "posts", "build_types"
  add_foreign_key "posts", "car_models"
  add_foreign_key "posts", "manufactures"
  add_foreign_key "posts", "users"
end
