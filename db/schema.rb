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

ActiveRecord::Schema.define(version: 2019_11_30_224146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.string "city"
    t.string "meeting_point"
    t.text "description"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "CHF", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "teasing1"
    t.text "teasing2"
    t.text "instruction"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_activities_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "experience_preferences_categories", force: :cascade do |t|
    t.bigint "experience_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_experience_preferences_categories_on_category_id"
    t.index ["experience_id"], name: "index_experience_preferences_categories_on_experience_id"
  end

  create_table "experience_slices", force: :cascade do |t|
    t.bigint "activity_id"
    t.bigint "experience_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_experience_slices_on_activity_id"
    t.index ["experience_id"], name: "index_experience_slices_on_experience_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "budget_cents", default: 0, null: false
    t.string "budget_currency", default: "CHF", null: false
    t.string "city"
    t.date "date"
    t.string "time_slot"
    t.datetime "paid_at"
    t.datetime "prepared_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "checkout_session_id"
    t.integer "preference_level"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "message_types", force: :cascade do |t|
    t.string "message_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "send_at"
    t.integer "day"
    t.text "content"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "message_type_id"
    t.bigint "experience_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experience_id"], name: "index_messages_on_experience_id"
    t.index ["message_type_id"], name: "index_messages_on_message_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primary_number"
    t.string "secondary_number"
    t.string "primary_first_name"
    t.string "primary_last_name"
    t.string "secondary_first_name"
    t.string "secondary_last_name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "categories"
  add_foreign_key "experience_preferences_categories", "categories"
  add_foreign_key "experience_preferences_categories", "experiences"
  add_foreign_key "experience_slices", "activities"
  add_foreign_key "experience_slices", "experiences"
  add_foreign_key "experiences", "users"
  add_foreign_key "messages", "experiences"
  add_foreign_key "messages", "message_types"
end
