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

ActiveRecord::Schema.define(version: 20170719033116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contestants_on_user_id"
  end

  create_table "plays", force: :cascade do |t|
    t.text "description"
    t.integer "point_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "team_name"
    t.string "role"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_contestants", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_weekly_contestants_on_contestant_id"
    t.index ["week_id"], name: "index_weekly_contestants_on_week_id"
  end

  create_table "weekly_plays", force: :cascade do |t|
    t.bigint "week_id"
    t.bigint "play_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["play_id"], name: "index_weekly_plays_on_play_id"
    t.index ["week_id"], name: "index_weekly_plays_on_week_id"
  end

  create_table "weekly_scores", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "play_id"
    t.bigint "week_id"
    t.integer "play_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contestant_id"], name: "index_weekly_scores_on_contestant_id"
    t.index ["play_id"], name: "index_weekly_scores_on_play_id"
    t.index ["week_id"], name: "index_weekly_scores_on_week_id"
  end

  create_table "weeks", force: :cascade do |t|
    t.datetime "date"
    t.integer "week_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contestants", "users"
  add_foreign_key "weekly_contestants", "contestants"
  add_foreign_key "weekly_contestants", "weeks"
  add_foreign_key "weekly_plays", "plays"
  add_foreign_key "weekly_plays", "weeks"
  add_foreign_key "weekly_scores", "contestants"
  add_foreign_key "weekly_scores", "plays"
  add_foreign_key "weekly_scores", "weeks"
end
