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

ActiveRecord::Schema.define(version: 2024_02_26_192508) do

  create_table "matches", force: :cascade do |t|
    t.integer "team_home_score"
    t.integer "team_away_score"
    t.integer "team_home_id", null: false
    t.integer "team_away_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_away_id"], name: "index_matches_on_team_away_id"
    t.index ["team_home_id"], name: "index_matches_on_team_home_id"
  end

  create_table "player_performances", force: :cascade do |t|
    t.integer "kills"
    t.integer "assists"
    t.integer "deaths"
    t.integer "headshots"
    t.integer "player_id", null: false
    t.integer "match_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_player_performances_on_match_id"
    t.index ["player_id"], name: "index_player_performances_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.string "nationality"
    t.date "birth_date"
    t.integer "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "region"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "matches", "team_aways"
  add_foreign_key "matches", "team_homes"
  add_foreign_key "player_performances", "matches"
  add_foreign_key "player_performances", "players"
  add_foreign_key "players", "teams"
end
