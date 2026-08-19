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

ActiveRecord::Schema[8.1].define(version: 2026_08_19_141747) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "decks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_decks_on_name", unique: true
  end

  create_table "match_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "environment"
    t.boolean "include_in_aggregation", default: true, null: false
    t.text "memo"
    t.bigint "my_deck_id", null: false
    t.bigint "opponent_deck_id", null: false
    t.string "opponent_name"
    t.date "played_on", null: false
    t.string "result", null: false
    t.string "rock_paper_scissors_result", null: false
    t.string "tournament_name"
    t.string "turn_order", null: false
    t.datetime "updated_at", null: false
    t.index ["my_deck_id"], name: "index_match_records_on_my_deck_id"
    t.index ["opponent_deck_id"], name: "index_match_records_on_opponent_deck_id"
    t.index ["played_on"], name: "index_match_records_on_played_on"
  end

  add_foreign_key "match_records", "decks", column: "my_deck_id"
  add_foreign_key "match_records", "decks", column: "opponent_deck_id"
end
