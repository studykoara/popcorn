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

ActiveRecord::Schema.define(version: 2021_01_12_155130) do

  create_table "kind_assignments", force: :cascade do |t|
    t.integer "kind_id", null: false
    t.integer "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_id"], name: "index_kind_assignments_on_kind_id"
    t.index ["reservation_id"], name: "index_kind_assignments_on_reservation_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "kind_name"
    t.integer "fee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "full_name"
    t.integer "sex", default: 0, null: false
    t.date "birthday"
    t.string "mail"
    t.string "password_digest"
    t.string "credit_number"
    t.date "expiration_date"
    t.integer "authentication_number"
    t.boolean "administrator", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.string "story", null: false
    t.date "release_date", null: false
    t.integer "running_time", null: false
    t.string "distribution", null: false
    t.string "director", null: false
    t.string "actor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performance_seats", force: :cascade do |t|
    t.integer "performance_id", null: false
    t.integer "seat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_id"], name: "index_performance_seats_on_performance_id"
    t.index ["seat_id"], name: "index_performance_seats_on_seat_id"
  end

  create_table "performances", force: :cascade do |t|
    t.integer "movie_id", null: false
    t.date "screening_date", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.integer "screen", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_performances_on_movie_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "performance_id", null: false
    t.integer "member_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_reservations_on_member_id"
    t.index ["performance_id"], name: "index_reservations_on_performance_id"
  end

  create_table "seat_assignments", force: :cascade do |t|
    t.integer "seat_id", null: false
    t.integer "reservation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_seat_assignments_on_reservation_id"
    t.index ["seat_id"], name: "index_seat_assignments_on_seat_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "en_number"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
