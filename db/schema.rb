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

ActiveRecord::Schema[7.1].define(version: 2024_03_11_135858) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "participation_id", null: false
    t.bigint "riddle_id", null: false
    t.bigint "game_id", null: false
    t.text "content", default: ""
    t.boolean "correct", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_answers_on_game_id"
    t.index ["participation_id"], name: "index_answers_on_participation_id"
    t.index ["riddle_id"], name: "index_answers_on_riddle_id"
  end

  create_table "clues", force: :cascade do |t|
    t.string "content"
    t.bigint "riddle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["riddle_id"], name: "index_clues_on_riddle_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "status"
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "user_id", null: false
    t.bigint "storyline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pin"
    t.integer "current_place_id"
    t.integer "current_riddle_id"
    t.string "qr_code"
    t.integer "code_type", default: 0
    t.index ["storyline_id"], name: "index_games_on_storyline_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.float "longitude"
    t.float "latitude"
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_participations_on_game_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.float "longitude"
    t.float "latitude"
    t.bigint "storyline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storyline_id"], name: "index_places_on_storyline_id"
  end

  create_table "riddles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "solution"
    t.string "question"
    t.bigint "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "motion_type"
    t.index ["place_id"], name: "index_riddles_on_place_id"
  end

  create_table "state_messages", force: :cascade do |t|
    t.text "content"
    t.bigint "game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "index"
    t.string "data_type"
    t.index ["game_id"], name: "index_state_messages_on_game_id"
  end

  create_table "storylines", force: :cascade do |t|
    t.string "district"
    t.string "theme"
    t.integer "difficulty"
    t.float "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "duration"
    t.text "short_description"
    t.text "long_description"
    t.text "introduction"
    t.bigint "user_id"
    t.boolean "is_ready", default: false
    t.index ["user_id"], name: "index_storylines_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.integer "level"
    t.integer "xp"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "games"
  add_foreign_key "answers", "participations"
  add_foreign_key "answers", "riddles"
  add_foreign_key "clues", "riddles"
  add_foreign_key "games", "storylines"
  add_foreign_key "games", "users"
  add_foreign_key "participations", "games"
  add_foreign_key "participations", "users"
  add_foreign_key "places", "storylines"
  add_foreign_key "riddles", "places"
  add_foreign_key "state_messages", "games"
  add_foreign_key "storylines", "users"
end
