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

ActiveRecord::Schema.define(version: 2019_11_27_092513) do

  create_table "chcities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "jpkanji"
    t.string "hira"
    t.string "simplified"
    t.string "pinyin"
    t.integer "prov_id"
  end

  create_table "chcity2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "lati", null: false
    t.float "longi", null: false
    t.integer "prov_id", null: false
    t.integer "popul", null: false
    t.integer "size", null: false
    t.integer "dens", null: false
    t.integer "income"
    t.integer "r_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chcity_id"
  end

  create_table "chclimates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "chcity_id", null: false
    t.integer "temp", null: false
    t.integer "rain", null: false
    t.integer "warmin"
    t.integer "cldiv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jpcities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "simplified"
    t.string "jpkanji"
    t.string "hira"
    t.string "alphabet"
    t.string "pinyin"
    t.integer "pref_id"
  end

  create_table "jpcity2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "lati", null: false
    t.float "longi", null: false
    t.integer "pref_id", null: false
    t.integer "popul", null: false
    t.integer "size", null: false
    t.integer "dens", null: false
    t.integer "income"
    t.integer "r_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jpcity_id"
  end

  create_table "jpclimates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "jpcity_id", null: false
    t.integer "temp", null: false
    t.integer "rain", null: false
    t.integer "warmin"
    t.integer "cldiv_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sim_name"
  end

  create_table "provinces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "jpkanji", null: false
    t.string "simplified", null: false
    t.string "pinyin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
