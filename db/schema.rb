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

ActiveRecord::Schema[7.0].define(version: 2022_04_30_012906) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drone_encounters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "drone_kills"
    t.boolean "win"
    t.text "notes"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "drone_encounter_id"
    t.string "player_name"
    t.string "hero"
    t.string "hero_aspect"
    t.string "notes"
    t.index ["drone_encounter_id"], name: "index_players_on_drone_encounter_id"
  end

end
