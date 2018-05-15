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

ActiveRecord::Schema.define(version: 2018_05_15_042911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "stadium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs_seasons", id: false, force: :cascade do |t|
    t.bigint "season_id", null: false
    t.bigint "club_id", null: false
    t.index ["season_id", "club_id"], name: "index_clubs_seasons_on_season_id_and_club_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "home_club_id"
    t.bigint "away_club_id"
    t.integer "home_club_score"
    t.integer "away_club_score"
    t.bigint "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_matches_on_season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.string "number_of_teams"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standings", force: :cascade do |t|
    t.integer "played_matches"
    t.integer "wins"
    t.integer "draws"
    t.integer "losses"
    t.integer "goals_scored"
    t.integer "goals_conceded"
    t.integer "points"
    t.bigint "season_id"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_standings_on_club_id"
    t.index ["season_id"], name: "index_standings_on_season_id"
  end

  add_foreign_key "matches", "clubs", column: "away_club_id"
  add_foreign_key "matches", "clubs", column: "home_club_id"
  add_foreign_key "matches", "seasons"
  add_foreign_key "standings", "clubs"
  add_foreign_key "standings", "seasons"
end
