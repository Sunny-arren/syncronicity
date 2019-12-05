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

ActiveRecord::Schema.define(version: 2019_12_03_113043) do

  create_table "chcities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "jpkanji", null: false
    t.string "hira"
    t.string "simplified", null: false
    t.string "pinyin", null: false
    t.string "prov", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chcity2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.integer "prov", null: false
    t.integer "income"
    t.integer "r_price"
    t.integer "popul"
    t.integer "size"
    t.integer "dense"
    t.integer "chcity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "pref", null: false
    t.string "jpkanji", null: false
    t.string "simplified", null: false
    t.string "hira", null: false
    t.string "alphabet", null: false
    t.string "pinyin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jpcity2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.string "pref", null: false
    t.integer "income"
    t.integer "r_price"
    t.integer "popul"
    t.integer "size"
    t.integer "dense"
    t.integer "jpcity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jpclimates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "jpcity_id", null: false
    t.integer "temp", null: false
    t.integer "rain", null: false
    t.integer "warmin"
    t.integer "cldiv_id"
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "simplified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "jpkanji", null: false
    t.string "simplified", null: false
    t.string "pinyin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
