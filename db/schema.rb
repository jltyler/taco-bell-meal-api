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

ActiveRecord::Schema.define(version: 20170720182716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text     "text",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id", using: :btree
  end

  create_table "meal_items", force: :cascade do |t|
    t.integer  "meal_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["meal_id"], name: "index_meal_items_on_meal_id", using: :btree
    t.index ["menu_item_id"], name: "index_meal_items_on_menu_item_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id", using: :btree
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "name"
    t.float    "cost"
    t.integer  "calories"
    t.integer  "calories_from_fat"
    t.integer  "total_fat"
    t.integer  "saturated_fat"
    t.integer  "trans_fat"
    t.integer  "cholesterol"
    t.integer  "sodium"
    t.integer  "carbohydrates"
    t.integer  "dietary_fiber"
    t.integer  "sugars"
    t.integer  "protein"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "token",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["token"], name: "index_users_on_token", unique: true, using: :btree
  end

  add_foreign_key "examples", "users"
  add_foreign_key "meal_items", "meals"
  add_foreign_key "meal_items", "menu_items"
  add_foreign_key "meals", "users"
end
