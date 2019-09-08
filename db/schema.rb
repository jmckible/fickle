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

ActiveRecord::Schema.define(version: 2019_09_08_231250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ballots", force: :cascade do |t|
    t.integer "poll_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id", "user_id", "created_at"], name: "index_ballots_on_poll_id_and_user_id_and_created_at"
  end

  create_table "caucuses", force: :cascade do |t|
    t.integer "poll_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id", "user_id"], name: "index_caucuses_on_poll_id_and_user_id", unique: true
  end

  create_table "choices", force: :cascade do |t|
    t.integer "poll_id"
    t.string "name"
    t.boolean "live", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poll_id", "live"], name: "index_choices_on_poll_id_and_live"
  end

  create_table "polls", force: :cascade do |t|
    t.integer "creator_id"
    t.string "name"
    t.string "slug"
    t.boolean "live", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_polls_on_creator_id"
    t.index ["live"], name: "index_polls_on_live"
    t.index ["slug"], name: "index_polls_on_slug", unique: true
  end

  create_table "rankings", force: :cascade do |t|
    t.integer "ballot_id"
    t.integer "choice_id"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ballot_id", "choice_id", "position"], name: "index_rankings_on_ballot_id_and_choice_id_and_position", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
