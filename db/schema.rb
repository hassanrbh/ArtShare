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

ActiveRecord::Schema[7.0].define(version: 2022_03_02_183117) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artwork_shares", force: :cascade do |t|
    t.integer "artwork_id", null: false
    t.integer "viewer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["viewer_id", "artwork_id"], name: "index_artwork_shares_on_viewer_id_and_artwork_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
