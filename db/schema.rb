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

ActiveRecord::Schema.define(version: 20160420161658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "title"
    t.text     "comments"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.integer  "price"
    t.boolean  "active",      default: true
    t.integer  "profile_id"
    t.integer  "length_id"
    t.integer  "location_id"
    t.date     "end_date"
  end

  add_index "appointments", ["profile_id"], name: "index_appointments_on_profile_id", using: :btree

  create_table "certifications", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "cert_name"
    t.string   "cert_abbreviation"
    t.string   "website"
    t.text     "cert_description"
  end

  create_table "confirmations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "appointment_id"
    t.string   "confirmation_temp"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "email"
    t.string   "card_token"
  end

  create_table "genders", force: :cascade do |t|
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lengths", force: :cascade do |t|
    t.string   "appointment_length"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "location_types", force: :cascade do |t|
    t.string   "type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_certifications", force: :cascade do |t|
    t.string   "cert_year"
    t.integer  "profile_id"
    t.integer  "certification_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "profile_certifications", ["certification_id"], name: "index_profile_certifications_on_certification_id", using: :btree
  add_index "profile_certifications", ["profile_id"], name: "index_profile_certifications_on_profile_id", using: :btree

  create_table "profile_locations", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "location_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "location_type_id"
    t.boolean  "guests"
  end

  add_index "profile_locations", ["location_id"], name: "index_profile_locations_on_location_id", using: :btree
  add_index "profile_locations", ["profile_id"], name: "index_profile_locations_on_profile_id", using: :btree

  create_table "profile_workouts", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "profile_id"
    t.integer  "workout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profile_workouts", ["profile_id"], name: "index_profile_workouts_on_profile_id", using: :btree
  add_index "profile_workouts", ["workout_id"], name: "index_profile_workouts_on_workout_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "bio"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "gender_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "username"
    t.boolean  "trainer"
    t.date     "dob"
  end

  add_index "profiles", ["gender_id"], name: "index_profiles_on_gender_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "stripe_customer"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workouts", force: :cascade do |t|
    t.string   "workout_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "appointments", "profiles"
  add_foreign_key "profile_certifications", "certifications"
  add_foreign_key "profile_certifications", "profiles"
  add_foreign_key "profile_locations", "locations"
  add_foreign_key "profile_locations", "profiles"
  add_foreign_key "profile_workouts", "profiles"
  add_foreign_key "profile_workouts", "workouts"
  add_foreign_key "profiles", "genders"
end
