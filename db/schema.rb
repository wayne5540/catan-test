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

ActiveRecord::Schema.define(version: 20160713111838) do

  create_table "games", force: :cascade do |t|
    t.string   "token",                  null: false
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["token"], name: "index_games_on_token", unique: true
  end

  create_table "land_nodes", force: :cascade do |t|
    t.integer  "land_id"
    t.integer  "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["land_id"], name: "index_land_nodes_on_land_id"
    t.index ["node_id"], name: "index_land_nodes_on_node_id"
  end

  create_table "lands", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "resource_type"
    t.integer  "position"
    t.integer  "dice_point"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["game_id"], name: "index_lands_on_game_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "position"
    t.integer  "level",      default: 0
    t.integer  "player_id"
    t.index ["game_id"], name: "index_nodes_on_game_id"
    t.index ["player_id"], name: "index_nodes_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id"
    t.index ["game_id"], name: "index_players_on_game_id"
  end

  create_table "resource_items", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "resource_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["player_id"], name: "index_resource_items_on_player_id"
  end

end
