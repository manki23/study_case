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

ActiveRecord::Schema.define(version: 2020_03_12_161757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contact_interests", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "interest_id"
    t.index ["contact_id"], name: "index_contact_interests_on_contact_id"
    t.index ["interest_id"], name: "index_contact_interests_on_interest_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.integer "subscriber_id"
    t.index ["subscriber_id"], name: "index_newsletter_subscribers_on_subscriber_id"
  end

end
