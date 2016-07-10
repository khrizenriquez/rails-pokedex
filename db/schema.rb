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

ActiveRecord::Schema.define(version: 20160710234654) do

  create_table "pokemon_assets", force: :cascade do |t|
    t.integer  "pokemon_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "per",             default: 0
    t.integer "nat",             default: 0
    t.string  "name"
    t.integer "hp",              default: 1
    t.integer "atk",             default: 1
    t.integer "def",             default: 1
    t.integer "sp_a",            default: 1
    t.integer "sp_d",            default: 1
    t.integer "spe",             default: 1
    t.integer "total",           default: 1
    t.string  "type_1"
    t.string  "type_2"
    t.string  "tier"
    t.string  "hability"
    t.string  "hability_2"
    t.string  "hidden_hability"
    t.float   "mass",            default: 1.0
    t.integer "lkgk",            default: 1
    t.string  "evolution_worth"
    t.integer "expv",            default: 1
    t.string  "color"
    t.integer "hatch"
    t.string  "gender"
    t.string  "egg_group_1"
    t.string  "egg_group_2"
    t.integer "catch"
    t.integer "exp"
    t.string  "evolve"
    t.integer "per_2"
    t.integer "nat_2"
    t.integer "joh"
    t.integer "hoe"
    t.integer "sin"
    t.integer "un"
    t.string  "name_2"
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
