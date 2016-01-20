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

ActiveRecord::Schema.define(version: 20160118033901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "auto_makes", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auto_models", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.integer  "auto_make_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auto_models", ["auto_make_id"], name: "index_auto_models_on_auto_make_id", using: :btree

  create_table "contact_stores", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "tel"
    t.string   "message"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_app_lockers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meets", force: :cascade do |t|
    t.string   "employee_name"
    t.string   "headshot"
    t.integer  "duration"
    t.text     "about"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "position"
    t.jsonb    "headshot_images"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "name"
    t.integer  "stars"
    t.text     "testimonial"
    t.string   "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "import"
    t.string   "kind"
    t.string   "status"
    t.string   "model"
    t.string   "title"
    t.integer  "price"
    t.string   "make"
    t.integer  "year"
    t.string   "body_style"
    t.integer  "mileage"
    t.string   "exterior_color"
    t.string   "interior_color"
    t.string   "engine"
    t.string   "transmission"
    t.string   "drive_type"
    t.string   "vehicle_class"
    t.string   "mpg"
    t.string   "trim"
    t.string   "fuel_type"
    t.string   "stereo"
    t.integer  "doors"
    t.string   "stock_number"
    t.string   "vin_num"
    t.string   "thumb"
    t.string   "description"
    t.string   "other_options"
    t.string   "image_1"
    t.string   "image_2"
    t.string   "image_3"
    t.string   "image_4"
    t.string   "image_5"
    t.string   "image_6"
    t.string   "image_7"
    t.string   "image_8"
    t.string   "image_9"
    t.string   "image_10"
    t.string   "image_11"
    t.string   "image_12"
    t.string   "image_13"
    t.string   "image_14"
    t.string   "image_15"
    t.string   "image_16"
    t.string   "image_17"
    t.string   "image_18"
    t.string   "image_19"
    t.string   "image_20"
    t.string   "image_21"
    t.string   "image_22"
    t.string   "image_23"
    t.string   "image_24"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.jsonb    "vehicle_images"
    t.integer  "countclicks"
    t.string   "admin_thumb"
  end

end
