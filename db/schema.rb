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

ActiveRecord::Schema.define(version: 2021_04_24_070158) do

  create_table "foreigners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "gender", null: false
    t.date "birthday", null: false
    t.string "country_region", null: false
    t.string "language", null: false
    t.integer "japanese_level_id", null: false
    t.string "address", null: false
    t.string "job", null: false
    t.string "hobby", null: false
    t.string "wonder", null: false
    t.string "welcome", null: false
    t.string "free"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_foreigners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_foreigners_on_reset_password_token", unique: true
  end

  create_table "needs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "foreigner_id"
    t.string "title", null: false
    t.string "detail", null: false
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["foreigner_id"], name: "index_needs_on_foreigner_id"
  end

  create_table "tutors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.string "gender", null: false
    t.date "birthday", null: false
    t.string "country_region", null: false
    t.string "language", null: false
    t.string "address", null: false
    t.string "job", null: false
    t.string "hobby", null: false
    t.string "motivation", null: false
    t.string "free", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_tutors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tutors_on_reset_password_token", unique: true
  end

  add_foreign_key "needs", "foreigners"
end
