# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_25_192957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: :cascade do |t|
    t.text "charity_name"
    t.bigint "ein"
    t.text "tag_line"
    t.text "mission"
    t.text "website_url"
    t.float "current_rating"
    t.float "financial_rating"
    t.float "accountability_rating"
    t.text "cause"
    t.bigint "income_amount"
    t.text "mailing_street_address"
    t.text "mailing_street_address_2"
    t.string "mailing_city"
    t.integer "mailing_zipcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "charity_id"
    t.integer "donation_amount"
    t.date "donation_date"
    t.text "donation_note"
    t.boolean "favorite", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "charity_id"
    t.date "event_date"
    t.text "event_title"
    t.string "event_type"
    t.text "event_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inboxes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "message_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "message_title"
    t.text "message_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.date "dob"
    t.string "email_address"
    t.string "password"
    t.text "street_address"
    t.text "street_address_2"
    t.string "city"
    t.integer "zip"
    t.string "phone_number"
    t.integer "cc_number"
    t.date "cc_exp_date"
    t.string "cc_type"
    t.integer "total_donation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
