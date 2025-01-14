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
ActiveRecord::Schema[7.1].define(version: 2025_01_04_150833) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_on"
    t.datetime "end_on"
    t.string "address"
    t.bigint "user_id"
    t.bigint "dance_id"
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.string "pic"
    t.index ["dance_id"], name: "index_appointments_on_dance_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "dances", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "photo"
    t.index ["user_id"], name: "index_dances_on_user_id"
  end

  create_table "feeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id", null: false
    t.index ["profile_id"], name: "index_feeds_on_profile_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "date"
    t.string "location"
    t.index ["profile_id"], name: "index_meetings_on_profile_id"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "partners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.bigint "user_id", null: false
    t.bigint "dance_id"
    t.string "investissement"
    t.string "niveau"
    t.integer "training_per_week"
    t.string "level"
    t.string "xp"
    t.string "coaching_status"
    t.string "practice_a_week"
    t.string "technique"
    t.string "ambition"
    t.string "empathie"
    t.string "social"
    t.index ["dance_id"], name: "index_profiles_on_dance_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "profile_id", null: false
    t.string "status"
    t.bigint "user_id", null: false
    t.index ["profile_id"], name: "index_requests_on_profile_id"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_subscriptions_on_appointment_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.string "location"
    t.integer "experience"
    t.string "contact"
    t.string "email", default: "", null: false
    t.string "password"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "nickname"
    t.string "first_name"
    t.string "last_name"
    t.boolean "terms"
    t.bigint "dance_id"
    t.string "photo"
    t.string "gender"
    t.bigint "request_id"
    t.string "city"
    t.string "level"
    t.string "xp"
    t.string "coaching_status"
    t.string "practice_a_week"
    t.string "technique"
    t.string "ambition"
    t.string "empathie"
    t.string "social"
    t.string "website"
    t.index ["dance_id"], name: "index_users_on_dance_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["request_id"], name: "index_users_on_request_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "dances"
  add_foreign_key "dances", "users"
  add_foreign_key "feeds", "profiles"
  add_foreign_key "meetings", "profiles"
  add_foreign_key "meetings", "users"
  add_foreign_key "profiles", "dances"
  add_foreign_key "profiles", "users"
  add_foreign_key "requests", "profiles"
  add_foreign_key "requests", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "subscriptions", "appointments"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "users", "dances"
  add_foreign_key "users", "requests"
end
